import 'package:flutter/material.dart';

class MyDialogUtil {
  static Future<dynamic> showMyModalBottomSheet({
    required BuildContext context,
    required Widget child,
  }) async {
    return await showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      context: (context),
      builder: (context) {
        return child;
      },
    ).then((value) => value);
  }
}
