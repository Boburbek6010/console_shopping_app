import 'dart:convert';
import 'dart:io';
import 'package:console_shopping_app/Models/user.dart';
import 'package:console_shopping_app/Registration/register_user.dart';

/// When run, it will be run firstly
void main() {
  print(" W " " E " " L " " C " " O " " M " " E ");

  RegisterUser register = RegisterUser();
  register.start();
}
