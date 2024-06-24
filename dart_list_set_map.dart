====L I S T ====
void main() {
  List<String> stringList = [
    "Programming",
    "Hello",
    "Dicoding",
    "Dart",
    "Flutter"
  ];

  // Menghapus list dengan nilai Programming
  stringList.remove('Programming');

  // Menghapus list pada index ke-1
  // stringList.removeAt(1);

  // Menghapus data list terakhir
  // stringList.removeLast();

  // Menghapus list mulai index ke-0 sampai ke-1 (indeks 2 masih dipertahankan)
  // stringList.removeRange(0,2);

  print(stringList);
}
========= SET=========
void main() {
  Set<int> anotherSet = new Set.from([1, 4, 6, 4, 1]);

  print(anotherSet);
}

/// Output:
/// {1, 4, 6}

====== MAP ===========
void main() {
  var capital = {
    'Jakarta': 'Indonesia',
    'London': 'England',
    'Tokyo': 'Japan',
  };

  print(capital['Jakarta']);
}
/// Output:
/// Indonesia
