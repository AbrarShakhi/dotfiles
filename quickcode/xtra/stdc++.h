#pragma once

// General Purpose Headers
#include <cassert>
#include <cfloat>
#include <climits>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iomanip>
#include <iostream>

// Containers
#include <array>
#include <deque>
#include <list>
#include <map>
#include <queue>
#include <set>
#include <stack>
#include <unordered_map>
#include <unordered_set>
#include <vector>
// #include <priority_queue>

// Algorithms
#include <algorithm>
#include <numeric>

// Iterators
#include <functional>
#include <iterator>

// Strings
#include <string.h>

#include <sstream>
#include <string>

// Input/Output
#include <filesystem>  // C++17 and later
#include <fstream>
#include <streambuf>

// Multithreading
#include <condition_variable>
#include <future>
#include <mutex>
#include <thread>

// Exception Handling
#include <exception>
#include <stdexcept>

// Type Traits and Utilities
#include <type_traits>
#include <utility>

// Memory Management
#include <memory>

// Time and Date
#include <chrono>

// Regular Expressions
#include <regex>

// Other
#include <bitset>
#include <locale>
#include <valarray>

// C++20 and Later
// #include <concepts>
// #include <ranges>
// #include <span>

#ifdef _MSC_VER  // IF USING VISUAL STUDIO IDE
#pragma warning(disable : 4996)
#define ARRAY(t, var, n)                   \
	auto var = (t*)_alloca(n * sizeof(t)); \
	if (!var) exit(-99)
#else
#define ARRAY(t, var, n) \
	t var[n];            \
	if (!var) exit(-99)
#endif  // _MSC_VER