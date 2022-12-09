import 'package:flutter/material.dart';

import '../Utils/color.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({Key? key}) : super(key: key);

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
          color: kLightBlue, borderRadius: BorderRadius.circular(25.0)),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              SizedBox(
                height: 30.0,
                width: 30.0,
                child: Image.asset(kFacebook),
              ),
              const Expanded(
                  child: Text(
                'Continue with Facebook',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ))
            ],
          )),
    );
  }
}
