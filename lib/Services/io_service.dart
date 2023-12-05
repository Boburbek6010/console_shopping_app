import 'dart:io';

import 'language_service.dart';

class IOService{

  static void write<T>(T str){
    stdout.write(str);
  }

  static void write1<T>(T str){
    int num;
    do {
      stdout.write(str);
      String num1 = stdin.readLineSync() ?? "";
      num = int.tryParse(num1) ?? 0;
      if (num <= 0){
        print("Invalid input. Please, choose 1 || 2 || 3 ||");
      } else if (num > 3) {
        print("You can choose only  1 || 2 || 3 ||");
      }
    } while (num <= 0 || num > 3);

    if(num == 1){
      LanguageService.setLanguage = Language.uz;
    }else if(num == 2){
      LanguageService.setLanguage = Language.ru;
    }else{
      LanguageService.setLanguage = Language.en;
    }

  }
  Future<void> selectWhoAreU() async {
    String press = IOService.read();
    switch(press){
      case "1":{
        "1";
      }
      break;

      case "2":{
       "2";
      }
      default: selectWhoAreU();
    }
  }



  static String read<T>(){
    return stdin.readLineSync() ?? "";
  }

  ///prints with border
  void pBorder(Object? value){
    print('\x1b[51m $value \x1b[0m');
  }
  void pBorderstdout(Object? value){
    stdout.write('\x1b[51m $value \x1b[0m');
  }

  ///prints bold
  void pBold(Object? value){
    print('\x1B[1m $value \x1B[0m');
  }

  ///prints in red color
  void pRed(Object? value){
    print('\x1b[31m $value\x1b[0m');
  }

  ///prints in green color
  void pGreen(Object? value){
    print('\x1b[32m $value\x1b[0m');
  }

  ///prints in blue color
  void pBlue(Object? value){
    print('\x1b[34m $value\x1b[0m');
  }

 static String txtBlock(String txtin){
    String txt = txtin;
    for(int i = txt.length; i<40; i++){
      txt += " ";
    }
    return txt;
  }

}