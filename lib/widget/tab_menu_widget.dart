
import 'package:flutter/material.dart';

class TabMenuWidget extends StatelessWidget {
  const TabMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            "BUCKET LIST",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Text(
            "/",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Text(
            "KIDS",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Text(
            "/",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Text(
            "WELLNESS",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Text(
            "/",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Text(
            "ROMANTIC",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}