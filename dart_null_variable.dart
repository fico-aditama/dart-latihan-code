void main(){
  String? nullableString; // Nullable variable
  String nonNullableString = 'Hello'; //Non Nullable Variable

  // Using a nullable variable
  if (nullableString != null){
    print(nullableString.length);
  } else {
    print('Nullable string is null');
  }
  print(nonNullableString.length); //Non-nullable variable
}
