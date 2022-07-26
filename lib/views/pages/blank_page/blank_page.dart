import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Icon(
              Icons.now_widgets_outlined,
              size: 24,
            ),
            Text("This Page Not Found (404)")
          ],
        ),
      ),
    );
  }
}
