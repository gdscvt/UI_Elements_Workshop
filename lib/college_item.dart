import 'package:flutter/material.dart';

generateWidget(String name, String id, BuildContext context) {
  return Card(
    color: Colors.green,
    child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * (1 / 10),
              child: Text(id)),
          Container(
            width: MediaQuery.of(context).size.width * (1 / 2),
            child: Text(
              name,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    ),
  );
}
