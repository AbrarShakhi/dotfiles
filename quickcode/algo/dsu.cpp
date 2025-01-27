#include <unordered_map>

template <typename T>
class Dsu {
	std::unordered_map<T, T> boss;
	std::unordered_map<T, size_t> size;

   public:
	void make_set(T item) {
		boss[item] = item;
		size[item] = 1;
	}
	T find_set(T item) {
		if (boss[item] == item) return item;
		return boss[item] = find_set(boss[item]);
	}
	void union_set(T item1, T item2) {
		item1 = find_set(item1);
		item2 = find_set(item2);
		if (item2 != item1) {
			if (size[item1] < size[item2]) {
				boss[item1] = item2;
				size[item2] += size[item1];
			} else {
				boss[item2] = item1;
				size[item1] += size[item2];
			}
		}
	}
};
