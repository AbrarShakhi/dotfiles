#if defined(AbrarShakhi) && defined(_MSC_VER)
#include "xtra/debug.h"
#include "xtra/stdc++.h"
#include "xtra/timer.h"
#else
#pragma GCC optimize("O3")
#include <bits/stdc++.h>
#define DB(...)
#endif // AbrarShakhi && _MSC_VER

#define N 0x7FFFFFF

inline static auto solve() {
}

int main() {
	std::cin.tie(0)->sync_with_stdio(0);
	std::cin.exceptions(std::cin.failbit);

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
