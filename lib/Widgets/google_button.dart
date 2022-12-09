import 'package:flutter/material.dart';

import '../Utils/color.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      constraints: const BoxConstraints(
        maxHeight: 50.0,
        minHeight: 50.0,
        maxWidth: 250.0,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(25.0)),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              SizedBox(
                height: 25.0,
                width: 25.0,
                child: Image.asset(kGoogle),
              ),
              const Expanded(
                  child: Text(
                'Continue with Google',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0),
              ))
            ],
          )),
    );
  }
}
