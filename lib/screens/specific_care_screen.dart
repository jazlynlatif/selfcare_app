import 'package:flutter/material.dart';
import 'package:selfcare_app/models/category.dart';

class SpecificCarePage extends StatefulWidget {
  final Category care;
  const SpecificCarePage({
    super.key,
    required this.care
  });

  @override
  State<SpecificCarePage> createState() => _SpecificCarePageState();
}

class _SpecificCarePageState extends State<SpecificCarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Care'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              
            ],
          ),
        )
      ),
    );
  }
}