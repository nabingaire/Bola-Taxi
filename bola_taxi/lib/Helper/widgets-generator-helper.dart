import 'package:flutter/material.dart';

class WidgetsGeneratorHelper {
  BuildContext context;

  WidgetsGeneratorHelper(this.context);

  showSnackBar(message) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
