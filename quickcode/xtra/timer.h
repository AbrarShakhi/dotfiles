#pragma once

#include <chrono>
#include <iostream>
#include <string>

class Timer {
	std::chrono::time_point<std::chrono::high_resolution_clock> m_Start;

   public:
	Timer() { reset(); }
	void reset() { m_Start = std::chrono::high_resolution_clock::now(); }
	float elapsed() const {
		return std::chrono::duration_cast<std::chrono::microseconds>(
		           std::chrono::high_resolution_clock::now() - m_Start)
		           .count() *
		       0.001f * 0.001f;
	}
	float elapsedMillis() const {
		return std::chrono::duration_cast<std::chrono::microseconds>(
		           std::chrono::high_resolution_clock::now() - m_Start)
		           .count() *
		       0.001f;
	}
};

class ScopedTimer {
	Timer m_Timer;
	std::string m_Name;

   public:
	ScopedTimer(std::string name)
	    : m_Name(name) { /*std::cout << "\033[1;32m--------\033[0m\n";*/ }
	~ScopedTimer() {
		float time = m_Timer.elapsedMillis();
		std::cout << "\033[1;32m[ " << m_Name << ": " << time
		          << "ms ]\033[0m\n";
	}
};

class ManualTimer {
	Timer timer;

   public:
	void start() { timer.reset(); }
	float stopElapsedMillis() { return timer.elapsedMillis(); }
};

#define TOTAL_TIMER ScopedTimer total_time("Total Time")
#define TESTCASE_TIMER ScopedTimer testcase_time("Testcase Time")
