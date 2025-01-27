long long sz = 1e6 + 5;

bool PrimeSieve[1000005] = {1};  // 1e6+5

void buildSieve() {
	PrimeSieve[0] = 0;
	PrimeSieve[1] = 0;  // 1 is neither prime nor composite

	for (int i = 2; i < sz; i++) {
		if (PrimeSieve[i] == 0)
			continue;  // the current number itself is composite

		for (int j = 2; j * i < sz; j++) {
			PrimeSieve[i * j] = 0;
		}
	}
}

// add SieveOfEratosthenes
bool isPrime(int n) {
	for (int i = 2; i * i <= n; i++) {
		if (n % i == 0) return 0;
	}
	return 1;
}