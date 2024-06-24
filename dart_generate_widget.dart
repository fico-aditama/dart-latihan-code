import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHRINE'),
        leading: IconButton(
          icon: const Icon(Icons.menu, semanticLabel: 'menu'),
          onPressed: () {
            print('Menu Button');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, semanticLabel: 'search'),
            onPressed: () {
              print('Search Button');
            },
          ),
          IconButton(
            icon: const Icon(Icons.tune, semanticLabel: 'filter'),
            onPressed: () {
              print('Filter Button');
            },
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(10),
      ),
    );
  }

  // Define a function to build a Card widget
  Widget _buildCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.asset('assets/diamond.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Title'),
                const SizedBox(height: 8.0),
                Text('Secondary Text'),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
        (int index){
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset('assets/diamond.png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('Title'),
                      SizedBox(height: 8.0),
                      Text('Secondary Text'),
                    ],
                  ),
                )
              ],
            ),
          );
      },
    );
    return cards;
  }
}

