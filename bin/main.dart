import 'dart:convert';
import 'dart:io';
import 'package:console_shopping_app/Services/register_user.dart';

import 'package:console_shopping_app/Models/user.dart';


/// When run, it will be run firstly
void main() {
  print(" W " " E "" L " " C "" O " " M " " E ");
  RegisterUser registerUser = RegisterUser();
  registerUser.start();
}