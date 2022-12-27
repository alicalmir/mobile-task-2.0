import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  final String  message;
  const PopUpDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        height: 100,
        width: 300,
        child:  Scaffold(
          body: Center(
            child: Padding(
              padding:const  EdgeInsets.all(20),
              child: Text(message)
            ),
          ),
        ),
      ),
    );
  }
}

showpopDialog({
  required BuildContext context,
  required String data,
}) {
  return showDialog(
      context: (context), builder: (context) => PopUpDialog(message:data,));
}