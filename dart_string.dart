void main() {
  // tulis kodemu di sini.
  for (int i=1; i<11; i++){
    String repeatedStar = '*' * i ;    
    print(repeatedStar);
  }
}
======================================================

void main() {
  // index [i] akan berulang untuk menampilkan teks tiap baris
  for (int i = 0; i < 10; i++) {
    // index [j] akan berulang untuk menampilkan teks tiap kolom
    String text = "";
    for (int j = 0; j <= i; j++) {
      text = text + "*";
    }
    print(text);
  }
}
=====================================================
void main() {
  int i = 1;

  while (i < 10) {
    String repeatedStar = '*' * i;
    print(repeatedStar);
    i += 1;
  }
}

======================================================
void main() {
  int i = 10;

  while (i > 0) {
    String repeatedStar = '*' * i;
    print(repeatedStar);
    i -= 1;
  }
}
