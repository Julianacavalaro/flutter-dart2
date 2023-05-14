import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guthub Search"),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8, top: 8),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText:  "Search..."
            ),
          ),
          
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (_, id) {
            return ListTile();
          }))
      ]),
    );
  }
}
