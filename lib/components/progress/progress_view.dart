import 'package:bytebank/components/progress/progress.dart';
import 'package:flutter/material.dart';

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