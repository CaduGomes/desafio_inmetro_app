import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);
  final String logoURI = 'assets/images/labsec-logo.png';
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.15,
        margin: EdgeInsets.only(top: 20),
        child: Image.asset(logoURI));
  }
}
