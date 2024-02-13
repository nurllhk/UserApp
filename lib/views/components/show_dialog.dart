import 'package:flutter/material.dart';

Future<void> dialogBuilder(
    BuildContext context, String titile, String bodyTtile) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey[300],
        title: Text(titile),
        content: Text(bodyTtile),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              'All right.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
