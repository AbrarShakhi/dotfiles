#include <chrono>
#include <cstdint>
#include <random>

std::default_random_engine default_engine;

auto clock_seed = std::chrono::steady_clock::now().time_since_epoch().count();
std::random_device rd_seed;
std::mt19937 mersenne_twister_engine((uint32_t)clock_seed);

template <class T = int>
T randint(T a, T b) {
	return std::uniform_int_distribution<T>(a, b)(mersenne_twister_engine);
}

template <class T = float>
T randint(T a, T b) {
	return std::uniform_real_distribution<T>(a, b)(mersenne_twister_engine);
}