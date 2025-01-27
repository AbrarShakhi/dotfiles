#include <iostream>
#include <vector>

template <typename typC, typename typD>
auto& operator>>(std::istream& cin, std::pair<typC, typD>& a) {
	return cin >> a.first >> a.second;
}
template <typename typC>
auto& operator>>(std::istream& cin, std::vector<typC>& a) {
	for (auto& x : a) cin >> x;
	return cin;
}
template <typename typC, typename typD>
auto& operator<<(std::ostream& cout, const std::pair<typC, typD>& a) {
	return cout << a.first << ' ' << a.second;
}
template <typename typC, typename typD>
auto& operator<<(std::ostream& cout,
                 const std::vector<std::pair<typC, typD>>& a) {
	for (auto& x : a) cout << x << ' ';
	return cout;
}
template <typename typC>
auto& operator<<(std::ostream& cout, const std::vector<typC>& a) {
	if (!a.size()) return cout;
	cout << a[0];
	for (size_t i = 1; i < a.size(); i++) cout << ' ' << a[i];
	return cout;
}
inline void __write() {}
template <typename T, typename... Args>
inline void __write(T&& arg, Args&&... args) {
	std::cout << arg << ' ';
	__write(std::forward<Args>(args)...);
}
inline void __writeline() {}
template <typename T, typename... Args>
inline void __writeline(T&& arg, Args&&... args) {
	std::cout << arg << '\n';
	__writeline(std::forward<Args>(args)...);
}
inline void print() { std::cout << '\n'; };
template <typename T, typename... Args>
inline void print(T&& arg, Args&&... args) {
	__write(std::forward<T>(arg), std::forward<Args>(args)...);
}
inline void println() { print(); };
template <typename T, typename... Args>
inline void println(T&& arg, Args&&... args) {
	__writeline(std::forward<T>(arg), std::forward<Args>(args)...);
}
inline void scan() {}
template <typename T, typename... Args>
inline void scan(T&& arg, Args&&... args) {
	std::cin >> arg;
	scan(std::forward<Args>(args)...);
}
template <typename T>
inline T input() {
	T t;
	std::cin >> t;
	return t;
}

#define FOR(i, a, b, s)                                                  \
	for (int64_t i = (a); (s) > 0 ? i < (int64_t)(b) : i > (int64_t)(b); \
	     i += (s))
#define FOR1(e) FOR(i, 0, e, 1)
#define FOR2(i, e) FOR(i, 0, e, 1)
#define FOR3(i, b, e) FOR(i, b, e, 1)
#define FOR4(i, b, e, s) FOR(i, b, e, s)
#define GET5(a, b, c, d, e, ...) e
#define FORC(...) GET5(__VA_ARGS__, FOR4, FOR3, FOR2, FOR1)
#define LOOP(...) FORC(__VA_ARGS__)(__VA_ARGS__)
#define EACH(x, a) for (auto& x : a)
