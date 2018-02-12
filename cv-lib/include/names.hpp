/*******************************************************************************
 * Copyright 2018 UT-Battelle, LLC
 * All rights reserved
 * Route Sanitizer, version 0.9
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * For issues, question, and comments, please submit a issue via GitHub.
 *******************************************************************************/
#ifndef CVDP_DI_NAMES_HPP
#define CVDP_DI_NAMES_HPP

#include <istream>
#include <memory>
#include <ostream>
#include <stdexcept>
#include <string>
#include <tuple>
#include <unordered_set>
#include <unordered_map>
#include <vector>

using ISPtr = std::shared_ptr<std::istream>;                ///< Alias to shared pointer to input stream.
using OSPtr = std::shared_ptr<std::ostream>;                ///< Alias to shared pointer to output stream.
using IFSPtr = std::shared_ptr<std::ifstream>;              ///< Alias to shared pointer to input file stream.
using OFSPtr = std::shared_ptr<std::ofstream>;              ///< Alias to shared pointer to output file stream.

using IntSet  = std::unordered_set<int>;                    ///< Alias to a set of integer types.

#endif
