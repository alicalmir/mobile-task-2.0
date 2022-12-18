import 'package:flutter/material.dart';

class LoadingAlert extends StatelessWidget {
  const LoadingAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        height: 100,
        width: 300,
        child: const Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(
                color: Colors.greenAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

showLoadingDialog(BuildContext context) {
  return showDialog(
      context: (context), builder: (context) => const LoadingAlert());
}
