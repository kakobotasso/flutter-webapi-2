import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String message;

  Progress({
    this.message = 'Loading',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              message,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressView extends StatelessWidget {
  final String message;
  ProgressView({this.message = 'Sending...'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sending'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Progress(
            message: message,
          ),
        ),
      ),
    );
  }
}
