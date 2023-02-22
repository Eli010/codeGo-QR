import 'package:codigo6_qr/ui/general/colores.dart';
import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  final Function? onPressed;
  final String text;

  const CommonButtonWidget(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        onPressed: onPressed != null
            ? () {
                onPressed!();
              }
            : null,
        // onPressed != null
        //     ? () {
        //         onPressed!();
        //       }
        //     : null,
        // //  () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ScannerPage(),
        //     ),);
        // },
        child: Text(
          text,
          style: TextStyle(
              color: kBrandSecondColor,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kBrandPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
      ),
    );
  }
}
