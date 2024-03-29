import 'package:flutter/material.dart';

void showLoadingDialog({required BuildContext context,
  bool idShow = true,
}) {
  idShow
      ? Future.delayed(const Duration(seconds: 0), () {
          showDialog(
              context: context,
              barrierColor: Colors.black.withOpacity(0.40),
              barrierDismissible:
                  true, // set to false if you want to force a rating
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        })
      : print("");
}

void hideLoadingDialog({required BuildContext context}) {
  Navigator.pop(context, false);
}
