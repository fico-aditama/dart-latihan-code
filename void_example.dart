void numberExamples(){
  int age = 25;
  double price = 12.99;
  
  int sum = age + 5;
  double discountedPrice = price - 2.50;
  
  print('Age: $age');
  print('New Age: $sum');
  print('Price: $price');
  print('Discounted Price: $discountedPrice');
}


void stringExamples(){
  String greeting = 'Hello';
  String name = 'Alice';
  
  String message = '$greeting $name';
  
  print(message);
  print('Message Length: ${message.length}');
}

void booleanExamples(){
  bool isAdult = true;
  bool hasPermission = false;
  
  if (isAdult && !hasPermission){
    print('You are an adult but do not have permission');
  } else {
    print('You are either not an adult or have permission');
  }
}

void main(){
  numberExamples();
  stringExamples();
  booleanExamples();
}


