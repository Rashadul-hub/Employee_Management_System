import 'package:flutter/material.dart';

class GetUserlists extends StatefulWidget {
  const GetUserlists({super.key});

  @override
  State<GetUserlists> createState() => _GetUserlistsState();
}

class _GetUserlistsState extends State<GetUserlists> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
           SizedBox(height: 10),
          Text(
            'User Lists Screen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
