import 'package:flutter/material.dart';

showWarningDialog(context, String title, String text, String? buttonText) {
  VoidCallback continueCallBack = () => {
        Navigator.of(context).pop(),
        // code on continue comes here
      };

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(text),
    actions: [
      TextButton(
        child: buttonText != null ? Text(buttonText) : Text("Ok"),
        onPressed: () {
          continueCallBack();
        },
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  return;
}
