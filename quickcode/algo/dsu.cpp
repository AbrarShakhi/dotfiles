#include <unordered_map>

template <typename T = int>
class Dsu {
	T *boss = nullptr;
	size_t *size = nullptr;

public:
	Dsu(int p_capacity) {
		boss = new T[p_capacity];
	}
	~Dsu() {
		if (boss)
			delete boss;
		if (size)
			delete size;
	}
	inline void make_set(T i) {
		boss[i] = i;
		size[i] = 1;
	}
	inline T find_set(T i) {
		if (boss[i] == i)
			return i;
		return boss[i] = find_set(boss[i]);
	}
	inline bool union_set(T a, T b) {
		a = find_set(a);
		b = find_set(b);
		if (b != a) {
			if (size[a] < size[b]) {
				boss[a] = b;
				size[b] += size[a];
			} else {
				boss[b] = a;
				size[a] += size[b];
			}
			return true;
		} else {
			return false;
		}
	}
};
