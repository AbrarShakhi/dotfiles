#ifdef AbrarShakhi
#include "../xtra/debug.h"
#include "../xtra/timer.h"
#else
#pragma GCC optimize("O3")
#define DB(...)
#define TOTAL_TIMER
#define TESTCASE_TIMER
#define REDIRECT_IO(...)
#endif  // AbrarShakhi

#include <cstdint>
#include <iostream>
#include <string>
#include <vector>

#define N 0x7FFFFFF

inline static auto solve() {}

int main() {
	std::cin.tie(0)->sync_with_stdio(0);
	std::cin.exceptions(std::cin.failbit);
	TOTAL_TIMER;
	REDIRECT_IO("input.txt");
	uint32_t T = 1;
	std::cin >> T;
	for (uint32_t t = 1; t <= T; t++) {
		// std::cout << "Case #" << i << ": ";
		// std::cout << solve();
		// std::cout << (solve() ? "YES" : "NO");
		// solve();
		std::cout << '\n';
	}
}
