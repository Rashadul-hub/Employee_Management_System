import 'package:flutter/material.dart';
class MeetingPage extends StatefulWidget {

  const MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'All your Meetings Lists here'
            )
          ],
        ),
      ),
    );
  }
}
