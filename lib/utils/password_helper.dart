import 'package:flutter/cupertino.dart';

class PasswordHelper {
  bool checkIfPasswordIsValid({@required String value}) {
    final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
    final numberOnly = RegExp(r'^[0-9]*$');
    final letterOnly = RegExp(r'^[a-zA-Z]+$');

    if (numberOnly.hasMatch(value) || letterOnly.hasMatch(value)) {
      return false;
    } else if (validCharacters.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }
}
