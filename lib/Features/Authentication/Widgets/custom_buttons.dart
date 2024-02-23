import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final String? assetIconURL;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
    this.assetIconURL,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
          ),
        ),
        onPressed: onTap,
        child: Stack(
          children: [
            if (assetIconURL != null)
              Positioned(
                left: 0,
                bottom: 0,
                child: Image.asset(
                  assetIconURL!,
                  height: 30,
                  width: 30,
                ),
              ),
            Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
