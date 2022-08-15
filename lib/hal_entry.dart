import 'package:flutter/material.dart';


class HalEntry extends StatelessWidget {
  const HalEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hal Entry',
      theme: Theme.of(context),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hal Entry'),
        ),
        body: const Center(
          child: Text("asdasd")
        ),
      ),
    );
  }
}
