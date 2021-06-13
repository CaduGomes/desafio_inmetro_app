import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, @required this.text, required this.onPressed})
      : super(key: key);
  final text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 250,
        height: 45,
        child:
            ElevatedButton(child: Text(this.text), onPressed: this.onPressed),
      ),
    );
  }
}
