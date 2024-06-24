import 'dart:io';

class ExpenseEntry {
  int amount;
  String category;
  DateTime date;
  String? note;

  ExpenseEntry(this.amount, this.category, this.date, {this.note});
}

class ExpenseTracker {
  List<ExpenseEntry> expenseHistory = [];

  void addExpense(int amount, String category, DateTime date, {String? note}) {
    final expense = ExpenseEntry(amount, category, date, note: note);
    expenseHistory.add(expense);
  }

  void displayExpenseHistory() {
    print('Riwayat Pengeluaran');
    for (var entry in expenseHistory) {
      print("Jumlah   : ${entry.amount}");
      print("Kategori : ${entry.category}");
      if (entry.note != null) {
        print("Catatan : ${entry.note}");
      }
      print("Tanggal  : ${entry.date}");
      print("\n");
    }
  }

  void displayTotalExpense() {
    int totalExpense = expenseHistory.fold(0, (total, entry) => total + entry.amount);
    print('Total Pengeluaran: $totalExpense');
  }
}

void main() {
  var myExpense = ExpenseTracker();

  void calcExpense() {
    stdout.write('Jumlah: ');
    String? amountStr = stdin.readLineSync();
    if (amountStr != null) {
      int amount = int.tryParse(amountStr) ?? 0;

      stdout.write('Kategori: ');
      String? category = stdin.readLineSync() ?? '';

      stdout.write('Tanggal (YYYY-MM-DD): ');
      String? dateStr = stdin.readLineSync();
      DateTime date = DateTime.tryParse(dateStr ?? '') ?? DateTime.now();

      stdout.write('Catatan: ');
      String? note = stdin.readLineSync();

      myExpense.addExpense(amount, category, date, note: note);
    }
  }

  void runMyExpense() {
    print('\nAplikasi Keuangan Pribadi myExpense');
    stdout.write('Masukkan Pilihan Anda:\n');
    print('1. Masukan Pengeluaran Anda');
    print('2. Tampilkan Riwayat Pengeluaran');
    print('3. Tampilkan Total Pengeluaran');
    print('4. Keluar');

    String? yourChoiceStr = stdin.readLineSync();
    int? yourChoice = int.tryParse(yourChoiceStr ?? '');

    switch (yourChoice) {
      case 1:
        calcExpense();
        runMyExpense();
        break;
      case 2:
        myExpense.displayExpenseHistory();
        runMyExpense();
        break;
      case 3:
        myExpense.displayTotalExpense();
        runMyExpense();
        break;
      case 4:
        exit(0);
        break;
      default:
        print('Silakan Masukkan Nomor yang Tepat');
        runMyExpense();
        break;
    }
  }

  runMyExpense();
}
