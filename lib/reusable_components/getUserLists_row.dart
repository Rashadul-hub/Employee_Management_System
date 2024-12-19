import 'package:flutter/material.dart';

class GetUserListRow extends StatelessWidget {
  String title, value;
  GetUserListRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),

              )),
          Expanded(
              flex: 2,
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.black87,
                ),)),
        ],
      ),
    );
  }
}
