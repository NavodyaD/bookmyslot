import 'package:flutter/material.dart';

class PrimaryAppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  PrimaryAppButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50), backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(buttonText, style: TextStyle(fontSize: 15, color: Colors.white),),
    );
  }
}
