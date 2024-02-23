import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  const CustomButton(
      {super.key, required this.text, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 18.0,
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(
                Radius.elliptical(
                  20,
                  20,
                ),
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
