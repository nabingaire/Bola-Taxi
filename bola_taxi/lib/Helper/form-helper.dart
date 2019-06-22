import 'package:flutter/material.dart';

class FormHelper {
  
  BuildContext _context;
  final _key;

  FormHelper(this._context,this._key);
  
  
  saveForm() {
    _key.currentState.save();
  }

}
