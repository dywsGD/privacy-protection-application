#!/bin/bash

#
# Copyright (C) 2015, BMW Car IT GmbH
#
# Author: Sebastian Mattheis <sebastian.mattheis@bmw-carit.de>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in
# writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.
#
# Modified 5/14/2018 Aaron Ferber
# Added docker environmental variables.
# Added Dockerfile postgres scripts.
database=${POSTGRES_DB}
user=${POSTGRES_USER}
password=${POSTGRES_PASSWORD}

service postgresql start
/bin/bash --rcfile /root/.bashrc

echo "Start creation and initialization of database '${database}' ..."
sudo -u postgres createdb ${database}
sudo -u postgres psql -d ${database} -c "CREATE EXTENSION hstore;"
sudo -u postgres psql -d ${database} -c "CREATE EXTENSION postgis;"
echo "Done."

echo "Start creation of user and initialization of credentials ..."
sudo -u postgres psql -c "CREATE USER \"${user}\" PASSWORD '${password}';"
sudo -u postgres psql -c "GRANT ALL ON DATABASE \"${database}\" TO \"${user}\";"
passphrase="localhost:5432:${database}:${user}:${password}"

if [ ! -e ~/.pgpass ] || [ `less ~/.pgpass | grep -c "$passphrase"` -eq 0 ]
then
	echo "$passphrase" >> ~/.pgpass
	chmod 0600 ~/.pgpass
fi
echo "Started Database."
