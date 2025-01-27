#include <fstream>
#include <iostream>

class Csv {
	std::ofstream stream;
	bool isConsoleMode;
	void writeCell() {}
	void newRow() { isConsoleMode ? std::cout << '\n' : stream << '\n'; }

   public:
	Csv() : isConsoleMode(true) {}
	Csv(const char* filename) : isConsoleMode(false) {
		stream.open(filename);
		if (!stream.is_open()) exit(-55);
	}
	~Csv() {
		if (!isConsoleMode) stream.close();
	}
	auto& getWritter() { return isConsoleMode ? std::cout : stream; }
	void newEmptyRow() { isConsoleMode ? std::cout << ",\n" : stream << ",\n"; }
	template <typename T, typename... Args>
	void newRow(T&& arg, Args&&... args) {
		isConsoleMode ? std::cout << arg << ',' : stream << arg << ',';
		newRow(std::forward<Args>(args)...);
	}
	void newCell() { isConsoleMode ? std::cout << ',' : stream << ','; }
	template <typename T, typename... Args>
	void newCell(T&& arg, Args&&... args) {
		isConsoleMode ? std::cout << arg << ' ' : stream << arg << ' ';
		newCell(std::forward<Args>(args)...);
	}
	template <typename T, typename... Args>
	void writeCell(T&& arg, Args&&... args) {
		isConsoleMode ? std::cout << arg << ' ' : stream << arg << ' ';
		writeCell(std::forward<Args>(args)...);
	}
};
