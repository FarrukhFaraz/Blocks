import 'package:flutter/material.dart';

import '../Utils/color.dart';

class SubmitButton extends StatelessWidget {
  String txt;
  Color? bacgroudColor;
  Color? textColor;
  double witdh;
  double height;
  GestureTapCallback ontap;
  final double fontSize;
  final Color? borderColor;
  final double borderRadius;
  final bool isOutlineButton;
  SubmitButton(
      {Key? key,
      required this.txt,
      required this.ontap,
      this.bacgroudColor,
      this.textColor,
      this.borderColor,
      this.fontSize = 18.0,
      this.borderRadius = 25.0,
      this.height = 50,
      this.witdh = 300,
      this.isOutlineButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: LayoutBuilder(builder: (context, constraint) {
        return ButtonTheme(
          height: height,
          minWidth: witdh,
          child: SizedBox(
            height: height,
            width: witdh,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius))),
                    side: borderColor != null
                        ? MaterialStateProperty.all(
                            BorderSide(color: borderColor!))
                        : null,
                    backgroundColor:
                        MaterialStateProperty.all(bacgroudColor ?? kSkyBlue)
                    // ,
                    ),
                onPressed: ontap,
                child: Text(
                  txt,
                  style: TextStyle(
                      color: textColor ?? Colors.white, fontSize: fontSize),
                )),
          ),
        );
      }),
    );
  }
}
