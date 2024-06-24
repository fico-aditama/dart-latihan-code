import numpy as np

random_seed = 42  # Anda bisa mengganti nilai seed sesuai keinginan
np.random.seed(random_seed)

# Sekarang, semua operasi angka acak yang menggunakan NumPy akan menghasilkan hasil yang sama
random_numbers = np.random.random(5)
print(random_numbers)
