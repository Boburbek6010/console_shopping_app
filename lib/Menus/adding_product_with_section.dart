import 'dart:io';
import 'package:console_shopping_app/Menus/home_menu.dart';
import 'package:console_shopping_app/Menus/product_function.dart';
import 'package:console_shopping_app/Services/extention_service.dart';
import 'package:console_shopping_app/Services/io_service.dart';
import 'package:console_shopping_app/Services/navigation_service.dart';
import 'admin_system_menu.dart';
import 'main_menu.dart';
import 'main_product_menu.dart';


class Departaments extends Menu{
  static const id = "/product_menu";
  IOService ioService = IOService();
  Map<String, dynamic> map = {};

  Future<void> selectMenu(String press) async{
    switch(press){
      case "1":{
        bolalar();
        build();
      }
      break;
      case "2":{
       uyJoy();
       build();
      }
      break;
      case "3":{
        transport();
        build();
      }
      break;
      case "4":{
      hayvonlar();
      build();
      }
      break;
      case "5":{
        uyJoy();
        build();
      }
      break;
      case "6":{
        electronika();
        build();
      }
      break;
      case "7":{
        kiyim();
        build();
      }
      break;
      case "8":{
        xobbi();
        build();
      }
      break;
      case "9":{
        ProductFunction.printElementsWithIndexes();
        build();
      }
      break;
      case "10":{
        Navigator.push(HomeMenu());
      }
      break;
      case "11":{
        exit(0);
      }
      default: build();
    }
  }


  @override
  Future<void> build()async{
    ioService.pBorder("\x1b[32m 1. ${IOService.txtBlock("Bolalar uchun")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 2. ${IOService.txtBlock("Kochmas Mulk")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 3. ${IOService.txtBlock("Transport")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 4. ${IOService.txtBlock("Uy hayvonlari")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 5. ${IOService.txtBlock("Uy va bog' uchun mahsulotlar")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 6. ${IOService.txtBlock("Elektr jihozlari")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 7. ${IOService.txtBlock("Moda va Still")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 8. ${IOService.txtBlock("Xobbi, dam olish va Sport")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m 9. ${IOService.txtBlock("Jami Elonlarni korish")}\x1b[0m".tr);
    ioService.pBorder("\x1b[32m \t\t\t 10. Menu   \x1b[0m".tr);
    ioService.pBorder("\x1b[31m \t\t\t 11. Exit   \x1b[0m".tr);
    print(" ");
    String press ="";
    do{
      IOService.write("\x1b[32m  Tanlang =>  \t\x1b[0m".tr);
      press = stdin.readLineSync()!;
      if(press != "1" && press != "2" && press != "3" && press != "4"&&press != "5" && press != "6" && press != "7" && press != "8" && press != "9" && press != "10"){
        print("\n");
        ioService.pBorder("\x1b[31m \t\t\t${IOService.txtBlock("Xato kiritdingiz")}\x1b[0m".tr);
      } else {
        break;
      }
    }while(true);
    await selectMenu(press);
  }

  void bolalar(){

    String type;
    do {
      stdout.write("type kiriting: ");
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        print("type qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("type qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    /*String name;
    do {
      stdout.write("name kiriting: ");
      name = stdin.readLineSync() ?? "";

      if (!isContainsDigit(name) && name.length > 3 && !hasSpecialCharacters(name)) {
        map['name'] = name;
        print("name qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("name qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);*/

    double price;
    do {
      stdout.write("Price kiriting: ");
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        print("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.");
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      stdout.write("color kiriting: ");
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        print("color qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("color qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);


    ProductMenu.productListBolalarUchun.add(map);
  }

  void uyJoy(){
    String type;
    do {
      stdout.write("type kiriting: ");
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        print("type qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("type qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    String manzil;
    do {
      stdout.write("manzil kiriting: ");
      manzil = stdin.readLineSync() ?? "";

      if (!isContainsDigit(manzil) && manzil.length > 3 && !hasSpecialCharacters(manzil)) {
        map['manzil'] = manzil;
        print("manzil qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("manzil qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    double price;
    do {
      stdout.write("Price kiriting: ");
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        print("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.");
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    double maydon;
    do {
      stdout.write("maydon kiriting: ");
      maydon = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (maydon <= 0) {
        print("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.");
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['maydon'] = maydon;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String xolati;
    do {
      stdout.write("xolati qanday: ");
      xolati = stdin.readLineSync() ?? "";

      if (!isContainsDigit(xolati) && xolati.length > 3 && !hasSpecialCharacters(xolati)) {
        map['xolati'] = xolati;
        print("uy-joy  qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("Matn qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);


    ProductMenu.productListKochmasMulk.add(map);
  }

  void transport(){
    String type;
    do {
      stdout.write("type kiriting: ");
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        print("type qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("type qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    String name;
    do {
      stdout.write("name kiriting: ");
      name = stdin.readLineSync() ?? "";

      if (!isContainsDigit(name) && name.length > 3 && !hasSpecialCharacters(name)) {
        map['name'] = name;
        print("name qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("name qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    double price;
    do {
      stdout.write("Price kiriting: ");
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        print("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.");
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      stdout.write("color kiriting: ");
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        print("color qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("Matn qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);


    ProductMenu.productListTransport.add(map);
  }

  void hayvonlar(){
    String type;
    do {
      stdout.write("type kiriting: ");
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        print("type qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("type qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    String jinsi;
    do {
      stdout.write("jinsini kiriting: ");
      jinsi = stdin.readLineSync() ?? "";

      if (!isContainsDigit(jinsi) && jinsi.length > 3 && !hasSpecialCharacters(jinsi) && jinsi == "erkak" || jinsi == "urg'ochi") {
        map['jinsi'] = jinsi;
        print("jinsi qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("name qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    double price;
    do {
      stdout.write("Price kiriting: ");
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        print("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.");
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      stdout.write("color kiriting: ");
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        print("color qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("color qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);


    ProductMenu.productListUyHayvonlari.add(map);
  }

  void xojalik(){
    String type;
    do {
      stdout.write("type kiriting: ");
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        print("type qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("type qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);


    double price;
    do {
      stdout.write("Price kiriting: ");
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        print("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.");
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      stdout.write("color kiriting: ");
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        print("color qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("color qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);


    ProductMenu.productListUyBog.add(map);
  }

  void electronika(){
    String type;
    do {
      stdout.write("type kiriting: ");
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        print("type qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("type qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    String name;
    do {
      stdout.write("name kiriting: ");
      name = stdin.readLineSync() ?? "";

      if (!isContainsDigit(name) && name.length > 3 && !hasSpecialCharacters(name)) {
        map['name'] = name;
        print("name qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("name qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    double price;
    do {
      stdout.write("Price kiriting: ");
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        print("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.");
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      stdout.write("color kiriting: ");
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        print("color qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("color qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);


    ProductMenu.productListElectrJihozlar.add(map);
  }

  void kiyim(){
    String type;
    do {
      stdout.write("type kiriting: ");
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        print("type qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("type qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    String xolati;
    do {
      stdout.write("kiyim xolati qanday: ");
      xolati = stdin.readLineSync() ?? "";

      if (!isContainsDigit(xolati) && xolati.length > 3 && !hasSpecialCharacters(xolati)) {
        map['xolati'] = xolati;
        print("kiyim xolati qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("kiyim xolati qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);

    double price;
    do {
      stdout.write("Price kiriting: ");
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        print("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.");
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      stdout.write("color kiriting: ");
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        print("color qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("color qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);


    ProductMenu.productListModaVaStil.add(map);
  }

  void xobbi(){
    String type;
    do {
      stdout.write("type kiriting: ");
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        print("type qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("type qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);


    double price;
    do {
      stdout.write("Price kiriting: ");
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        print("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.");
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      stdout.write("color kiriting: ");
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        print("color qabul qilindi!");
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("color qabul qilinmadi. Qaytadan urinib ko'ring.");
      }
    } while (true);


    ProductMenu.productListHobbiVaDamOlish.add(map);
  }





}




bool isContainsDigit(String text) {
  return text.contains(RegExp(r'\d'));
}

bool hasSpecialCharacters(String text) {
  return text.contains(RegExp(r'[@#$%^&*]'));
}


