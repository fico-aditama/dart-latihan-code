import numpy as np

# Penggunaan Random Seed Kecil
numbers = [x for x in range(10)]

np.random.seed(1)
np.random.shuffle(numbers)
print("Random numbers with small seed:", numbers)

# Penggunaan Random Seed Besar
np.random.seed(42)
np.random.shuffle(numbers)
print("Random numbers with large seed:", numbers)
