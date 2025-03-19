#pragma once


#ifndef _MSC_VER

#include <iostream>
#include <string>

void __debug_debug_print(int x) {
	std::cerr << x;
}

void __debug_debug_print(long x) {
	std::cerr << x;
}
void __debug_debug_print(long long x) {
	std::cerr << x;
}

void __debug_debug_print(unsigned x) {
	std::cerr << x;
}

void __debug_debug_print(unsigned long x) {
	std::cerr << x;
}

void __debug_debug_print(unsigned long long x) {
	std::cerr << x;
}

void __debug_debug_print(float x) {
	std::cerr << x;
}

void __debug_debug_print(double x) {
	std::cerr << x;
}

void __debug_debug_print(long double x) {
	std::cerr << x;
}

void __debug_debug_print(char x) {
	std::cerr << '\'' << x << '\'';
}

void __debug_debug_print(const char *x) {
	std::cerr << '\"' << x << '\"';
}

void __debug_debug_print(const std::string &x) {
	std::cerr << '\"' << x << '\"';
}

void __debug_debug_print(bool x) {
	std::cerr << (x ? "true" : "false");
}

template <typename T, typename V>
void __debug_debug_print(const std::pair<T, V> &x);

template <typename T>
void __debug_debug_print(const T &x) {
	int f = 0;
	std::cerr << '{';
	for (auto &i : x)
		std::cerr << (f++ ? ", " : ""), __debug_debug_print(i);
	std::cerr << "}";
}

template <typename T, typename V>
void __debug_debug_print(const std::pair<T, V> &x) {
	std::cerr << '{';
	__debug_debug_print(x.first);
	std::cerr << ", ";
	__debug_debug_print(x.second);
	std::cerr << '}';
}
void _debug_print() {
	std::cerr << "]\n";
}

template <typename T, typename... V>
void _debug_print(T t, V... v) {
	__debug_debug_print(t);
	if (sizeof...(v))
		std::cerr << ", ";
	_debug_print(v...);
}

#define DB(x...)                                                       \
	std::cerr << "\e[93m" << __func__ << ":" << __LINE__ << " [" << #x \
	          << "] = [";                                              \
	_debug_print(x);                                                   \
	std::cerr << "\e[39m" << std::endl;

#else
#define DB(...)
#endif // _MSC_VER
