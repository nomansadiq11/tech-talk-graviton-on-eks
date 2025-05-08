# Dockerfile
FROM python:3.11-slim

CMD ["python", "-c", "\
import time;\
start = time.time();\
primes = [2];\
for num in range(3, 100000):\
  if all(num % p != 0 for p in primes): primes.append(num);\
print(f'Found {len(primes)} primes in {time.time() - start:.2f} seconds');\
"]
