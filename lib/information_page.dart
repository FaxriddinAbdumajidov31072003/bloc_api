
import 'package:flutter/material.dart';

import 'model.dart';

class InformationPage extends StatelessWidget {
  final UniverResponse univerResponse;

  const InformationPage({Key? key, required this.univerResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: univerResponse.univers?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.lightBlueAccent,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              child: Text(univerResponse.univers?[index].name ?? ""),
            );
          }),
    );
  }
}