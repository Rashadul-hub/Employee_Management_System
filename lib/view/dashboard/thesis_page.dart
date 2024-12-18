import 'package:flutter/material.dart';


class ThesisPage extends StatefulWidget {
  const ThesisPage({super.key});

  @override
  State<ThesisPage> createState() => _ThesisPageState();
}

class _ThesisPageState extends State<ThesisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'All your Faculty/Students Lists here'
            )
          ],
        ),
      ),
    );;
  }
}
