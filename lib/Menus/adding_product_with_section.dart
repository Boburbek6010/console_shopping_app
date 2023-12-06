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
    ioService.pBorder("\x1b[32m 1. ${IOService.txtBlock("for_children".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 2. ${IOService.txtBlock("real_estate".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 3. ${IOService.txtBlock("transport".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 4. ${IOService.txtBlock("domestic_animals".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 5. ${IOService.txtBlock("products_for_home_and_garden".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 6. ${IOService.txtBlock("electrical_equipment".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 7. ${IOService.txtBlock("fashion_and_style".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 8. ${IOService.txtBlock("hobbies_recreation_and_sports".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m 9. ${IOService.txtBlock("view_total_ads".tr)}\x1b[0m");
    ioService.pBorder("\x1b[32m \t\t\t 10. ${"Menu".tr}     \x1b[0m");
    ioService.pBorder("\x1b[31m \t\t\t 11. ${"Exit".tr}   \x1b[0m");
    print(" ");
    String press ="";
    do{
      IOService.write("\x1b[32m  ${"choose =>".tr}  \t\x1b[0m");
      press = stdin.readLineSync()!;
      if(press != "1" && press != "2" && press != "3" && press != "4"&&press != "5" && press != "6" && press != "7" && press != "8" && press != "9" && press != "10"){
        print("\n");
        ioService.pBorder("\x1b[31m \t\t\t${IOService.txtBlock("you_entered_an_error".tr)}\x1b[0m");
      } else {
        break;
      }
    }while(true);
    await selectMenu(press);
  }

  void bolalar(){

    String type;
    do {
      ioService.pBorder("\x1b[32m 9. ${IOService.txtBlock("Turini kiriting")}\x1b[0m".tr);
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);



    double price;
    do {
       ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Narxini kiriting:")}\x1b[0m".tr);
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        ioService.pBorder("\x1b[32m  ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      ioService.pBorder("\x1b[32m  ${IOService.txtBlock("Rangini kiriting")}\x1b[0m".tr);
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
    ioService.pBorder("\x1b[32m 9. ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m 9. ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);


    ProductMenu.productListBolalarUchun.add(map);
  }

  void uyJoy(){
    String type;
    do {
      ioService.pBorder("\x1b[32m ${IOService.txtBlock("Turini kiriting")}\x1b[0m".tr);
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        ioService.pBorder("\x1b[32m  ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);

    String manzil;
    do {
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Manzilni kiriting")}\x1b[0m".tr);
      manzil = stdin.readLineSync() ?? "";

      if (!isContainsDigit(manzil) && manzil.length > 3 && !hasSpecialCharacters(manzil)) {
        map['manzil'] = manzil;
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);

    double price;
    do {
      ioService.pBorder("\x1b[32m ${IOService.txtBlock("Narxini kiriting")}\x1b[0m".tr);
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        ioService.pBorder("\x1b[32m 9. ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    double maydon;
    do {
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Maydoni qancha")}\x1b[0m".tr);
      maydon = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (maydon <= 0) {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['maydon'] = maydon;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String xolati;
    do {
      stdout.write("xolati qanday: ");
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("xolati qanday : ")}\x1b[0m".tr);
      xolati = stdin.readLineSync() ?? "";

      if (!isContainsDigit(xolati) && xolati.length > 3 && !hasSpecialCharacters(xolati)) {
        map['xolati'] = xolati;
        ioService.pBorder("\x1b[32m  ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);


    ProductMenu.productListKochmasMulk.add(map);
  }

  void transport(){
    String type;
    do {
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("turini kiriting ")}\x1b[0m".tr);
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m  ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);

    String name;
    do {
      ioService.pBorderstdout("\x1b[32m 9. ${IOService.txtBlock("Nomini kiriting : ")}\x1b[0m".tr);
      name = stdin.readLineSync() ?? "";

      if (!isContainsDigit(name) && name.length > 3 && !hasSpecialCharacters(name)) {
        map['name'] = name;
        print("name qabul qilindi!");
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi")}\x1b[0m".tr);
      }
    } while (true);

    double price;
    do {
      ioService.pBorder("\x1b[32m ${IOService.txtBlock("Narxini kiriting:")}\x1b[0m".tr);
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      ioService.pBorder("\x1b[32m ${IOService.txtBlock("Rangini kiriting")}\x1b[0m".tr);
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);


    ProductMenu.productListTransport.add(map);
  }

  void hayvonlar(){
    String type;
    do {
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Turini kiriting")}\x1b[0m".tr);
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        ioService.pBorder("\x1b[32m 9. ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);

    String jinsi;
    do {
      ioService.pBorder("\x1b[32m ${IOService.txtBlock("Jinsini kiriting")}\x1b[0m".tr);
      jinsi = stdin.readLineSync() ?? "";

      if (!isContainsDigit(jinsi) && jinsi.length > 3 && !hasSpecialCharacters(jinsi) && jinsi == "erkak" || jinsi == "urg'ochi" || jinsi == "bilmayman") {
        map['jinsi'] = jinsi;
        ioService.pBorder("\x1b[32m 9. ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);

    double price;
    do {
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      ioService.pBorder("\x1b[32m ${IOService.txtBlock("Rangini kiriting")}\x1b[0m".tr);
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);


    ProductMenu.productListUyHayvonlari.add(map);
  }

  void xojalik(){
    String type;
    do {
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Turini kiriting")}\x1b[0m".tr);
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting ")}\x1b[0m".tr);
      }
    } while (true);


    double price;
    do {
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Narxini kiriting:")}\x1b[0m".tr);
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, Qaytadan kiriting  ")}\x1b[0m".tr);
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      ioService.pBorderstdout("\x1b[32m${IOService.txtBlock("Enter color")}\x1b[0m".tr);
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi")}\x1b[0m".tr);
      }
    } while (true);


    ProductMenu.productListUyBog.add(map);
  }

  void electronika(){
    String type;
    do {
      ioService.pBorderstdout("\x1b[32m 9. ${IOService.txtBlock("Turini kiriting :")}\x1b[0m".tr);
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        ioService.pBorder("\x1b[32m 9. ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Malumot qabul qilinmadi, qaytadan kiriting")}\x1b[0m".tr);
      }
    } while (true);

    String name;
    do {

      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Name :")}\x1b[0m".tr);
      name = stdin.readLineSync() ?? "";

      if (!isContainsDigit(name) && name.length > 3 && !hasSpecialCharacters(name)) {
        map['name'] = name;
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Malumot qabul qilindi")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("");
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("ism qabul qilinmadi. Qaytadan urinib ko'ring.")}\x1b[0m".tr);
      }
    } while (true);

    double price;
    do {
      stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m 9. ${IOService.txtBlock("Narxini kiriting:")}\x1b[0m".tr);
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        print("");
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.")}\x1b[0m".tr);
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Rangini kiriting:")}\x1b[0m".tr);
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Rang qabul qilindi!")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("");
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Rang qabul qilinmadi. Qaytadan urinib ko'ring.")}\x1b[0m".tr);
      }
    } while (true);


    ProductMenu.productListElectrJihozlar.add(map);
  }

  void kiyim(){
    String type;
    do {

      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Turini kiriting")}\x1b[0m".tr);
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        print("");
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Turi qabul qilindi!")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("");
        ioService.pBorder("\x1b[31m  ${IOService.txtBlock("Turi qabul qilinmadi. Qaytadan urinib ko'ring.")}\x1b[0m".tr);
      }
    } while (true);

    String xolati;
    do {
      stdout.write("");
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("kiyim xolati qanday: ")}\x1b[0m".tr);
      xolati = stdin.readLineSync() ?? "";

      if (!isContainsDigit(xolati) && xolati.length > 3 && !hasSpecialCharacters(xolati)) {
        map['xolati'] = xolati;
        print("");
        ioService.pBorder("\x1b[32m 9. ${IOService.txtBlock("kiyim xolati qabul qilindi!")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("");
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("kiyim xolati qabul qilinmadi. Qaytadan urinib ko'ring.")}\x1b[0m".tr);
      }
    } while (true);

    double price;
    do {
      stdout.write("");
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Narxini kiriting: ")}\x1b[0m".tr);
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        print("");
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.")}\x1b[0m".tr);
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m  ${IOService.txtBlock("Rangini kiriting:")}\x1b[0m".tr);
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Rangi qabul qilindi!")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        print("");
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Rangi qabul qilinmadi. Qaytadan urinib ko'ring.")}\x1b[0m".tr);
      }
    } while (true);


    ProductMenu.productListModaVaStil.add(map);
  }

  void xobbi(){
    String type;
    do {
      stdout.write("Mahuslot nomi : ");
      ioService.pBorder("\x1b[32m  ${IOService.txtBlock("Maxsulot nomi")}\x1b[0m".tr);
      type = stdin.readLineSync() ?? "";

      if (!isContainsDigit(type) && type.length > 3 && !hasSpecialCharacters(type)) {
        map['type'] = type;
        ioService.pBorder("\x1b[32m  ${IOService.txtBlock("turi qabul qilindi!")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("turi qabul qilinmadi. Qaytadan urinib ko'ring")}\x1b[0m".tr);

      }
    } while (true);


    double price;
    do {
      stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m${IOService.txtBlock("Narxini kiriting:")}\x1b[0m".tr);
      price = double.tryParse(stdin.readLineSync()!) ?? 0;

      if (price <= 0) {
        ioService.pBorder("\x1b[31m ${IOService.txtBlock("Noto'g'ri qiymat. Qiymat 0 dan katta bo'lishi kerak.")}\x1b[0m".tr);
        continue; // Qiymat noto'g'ri bo'lsa tsiklni qayta boshlaymiz
      }

      map['price'] = price;
      break; // Qiymat to'g'ri bo'lib, tsiklni to'xtatamiz
    } while (true);

    String color;
    do {
      stdout.write(" ");
      ioService.pBorderstdout("\x1b[32m ${IOService.txtBlock("Rangini kiriting:")}\x1b[0m".tr);
      color = stdin.readLineSync() ?? "";

      if (!isContainsDigit(color) && color.length > 3 && !hasSpecialCharacters(color)) {
        map['color'] = color;
        print("");
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Rangi qabul qilindi!")}\x1b[0m".tr);
        break; // Shartlar barchasi to'g'ri bo'lganida tsiklni to'xtatamiz
      } else {
        ioService.pBorder("\x1b[32m ${IOService.txtBlock("Rangi qabul qilinmadi. Qaytadan urinib ko'ring.")}\x1b[0m".tr);
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


