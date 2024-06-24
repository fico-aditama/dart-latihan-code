import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final int height;
  final double weight;
  final String eyeColor;
  final String hairColor;
  final String hairType;
  final String domain;
  final String ipAddress;
  final String address;
  final String city;
  final double userLatitude;
  final double userLongitude;
  final String postalCode;
  final String userState;
  final String macAddress;
  final String university;
  final String bankCardExpire;
  final String bankCardNumber;
  final String bankCardType;
  final String bankCurrencies;
  final String bankIban;
  final String companyAddress;
  final String companyCity;
  final String companyLatitude;
  final String companyLongitude;
  final double companyPostalCode;
  final String companyState;
  final String companyDepartment;
  final String companyName;
  final String companyTitle;
  final String ein;
  final String ssn;
  final String userAgent;



  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.hairColor,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairType,
    required this.domain,
    required this.ipAddress,
    required this.address,
    required this.city,
    required this.userLatitude,
    required this.userLongitude,
    required this.postalCode,
    required this.userState,
    required this.macAddress,
    required this.university,
    required this.bankCardExpire,
    required this.bankCardNumber,
    required this.bankCardType,
    required this.bankCurrencies,
    required this.bankIban,
    required this.companyAddress,
    required this.companyCity,
    required this.companyLatitude,
    required this.companyLongitude,
    required this.companyPostalCode,
    required this.companyState,
    required this.companyDepartment,
    required this.companyName,
    required this.companyTitle,
    required this.ein,
    required this.ssn,
    required this.userAgent,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      hairColor: json['hair']['color'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      password: json['password'],
      birthDate: json['birthDate'],
      image: json['image'],
      bloodGroup: json['bloodGroup'],
      height: json['height'],
      weight: json['weight'],
      eyeColor: json['eyeColor'],
      hairType: json['hair']['type'],
      domain: json['domain'],
      ipAddress: json['ip'],
      address: json['address']['address'],
      city: json['address']['city'],
      userLatitude: json['address']['coordinates']['lat'],
      userLongitude: json['address']['coordinates']['lng'],
      postalCode: json['postalCode'],
      userState: json['state'],
      macAddress: json['macAddress'],
      university: json['university'],
      bankCardExpire: json['bank']['cardExpire'],
      bankCardNumber: json['bank']['cardNumber'],
      bankCardType: json['bank']['cardType'],
      bankCurrencies: json['bank']['currency'],
      bankIban: json['bank']['iban'],
      companyAddress: json['company']['address']['address'],
      companyCity: json['company']['address']['city'],
      companyLatitude: json['company']['address']['coordinates']['lat'],
      companyLongitude: json['company']['address']['coordinates']['lng'],
      companyPostalCode: json['company']['address']['postalCode'],
      companyState: json['company']['address']['state'],
      companyDepartment: json['company']['department'],
      companyName: json['company']['name'],
      companyTitle: json['company']['title'],
      ein: json['ein'],
      ssn: json['ssn'],
      userAgent: json['userAgent'],
    );
  }

  /// Fetches user data from the specified [url].
  /// Returns a [User] object if successful, or null on failure.
  static Future<User?> fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return User.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle network errors or JSON parsing errors
      print('Error: $e');
      return null;
    }
  }
  /// Prints user details to the console.
  void printUser() {
    print('Name       : $firstName' + ' $lastName');
    print('User ID    : $id');
    print('Age        : $age');
    print('Hair Color : $hairColor');
    print('Gender     : $gender');
    print('Email      : $email');
    print('Phone      : $phone');
    print('Username   : $username');
    print('Password   : $password');
    print('Birth Date : $birthDate');
    print('Image      : $image');
    print('Blood Group: $bloodGroup');
    print('Height     : $height');
    print('Weight     : $weight');
    print('Eye Color  : $eyeColor');
    print('Hair Type  : $hairType');
    print('Domain     : $domain');
    print('Ip Address : $ipAddress');
    print('Address    : $address');
    print('City       : $city');

    print('\n');
  }
}

void main() async {
  final url = 'https://dummyjson.com/users/';
  for (int i=1; i <= url.length; i++) {
    final user = await User.fetchData('$url$i');
    if (user!= null) {
      user.printUser();
  }}
}
