// TODO: Add all binary search variations

int64_t binray_search(int64_t* input_array, int64_t len, int64_t target) {
	int64_t left = 0;
	int64_t right = len - 1;
	int64_t mid;
	while (left <= right) {
		mid = left + (right - left) / 2;
		if (input_array[mid] < target) {
			left = mid + 1;
		} else if (input_array[mid] > target) {
			right = mid - 1;
		} else {
			return mid;
		}
	}
	return -1;
}