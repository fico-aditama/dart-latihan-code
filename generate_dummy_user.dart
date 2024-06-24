import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final int id;
  final String firstName;
  final String lastName;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }

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

  void printUser() {
    print('User ID   : $id');
    print('First Name: $firstName');
    print('Last Name : $lastName');
    print('\n');
  }
}

void main() async {
  final url = 'https://dummyjson.com/users/';
  final users = <User>[];

  await Future.forEach(List.generate(10, (i) => i + 1), (i) async {
    final user = await User.fetchData('$url$i');
    if (user != null) {
      users.add(user);
    }
  });

  runApp(MyApp(users: users));
}

class MyApp extends StatelessWidget {
  final List<User> users;

  MyApp({required this.users});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Data'),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('User ID: ${users[index].id}'),
              subtitle: Text(
                  'Name: ${users[index].firstName} ${users[index].lastName}'),
            );
          },
        ),
      ),
    );
  }
}

