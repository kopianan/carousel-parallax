import 'package:flutter/material.dart';

class MenuServiceItem extends StatelessWidget {
  const MenuServiceItem({
    super.key,
    required this.label,
    required this.image,
  });
  final String label;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 40,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 15),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
