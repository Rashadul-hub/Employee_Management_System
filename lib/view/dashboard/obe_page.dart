import 'package:flutter/material.dart';


class ObePage extends StatefulWidget {
  const ObePage({super.key});

  @override
  State<ObePage> createState() => _ObePageState();
}

class _ObePageState extends State<ObePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'All your OBE Lists here'
            )
          ],
        ),
      ),
    );;
  }
}
