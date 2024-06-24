Asynchronous Programming with Future and async/await

Dart's asynchronous capabilities are key to achieving concurrency without blocking the user interface. We'll explore two important concepts:

Future: A Future in Dart represents a potentially long-running operation that will yield a result in the future. While waiting for the result, your app can continue executing other tasks. Here's an example:
Future<int> fetchUserData() {
  return Future.delayed(Duration(seconds: 2), () => 42); // Simulating a delay
}
In this example, fetchUserData returns a Future<int> that resolves to 42 after a simulated delay of 2 seconds.

async/await: Dart provides the async and await keywords to work with asynchronous code in a more readable and synchronous-like manner. You can use await to pause the execution of a function until a Future completes. Here's an example:
Future<void> printUserData() async {
  final data = await fetchUserData();
  print('User data: $data');
}
