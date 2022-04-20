import 'package:note_app/services/data_service.dart';
import 'package:note_app/services/io_service.dart';
import 'dart:io';

void main() async {
  print("1. Ma'lumotlarni store qilish:\n2. Ma'lumotlarni o'qish:\n3. Ma'lumotlar delete qilish:\n0. Dasturdan chiqich: ");
  stdout.write("Son kiriting: ");
  int son = int.parse(stdin.readLineSync()!);

  while(son != 0) {
    DataService dataService = DataService();
    await dataService.init();
    switch(son) {
      case 1: {
        write("Iltimos passwordni kiriting: \n");
        String password = read();
        bool result = await dataService.storeString(key: "password", value: password);

        write("Iltimos tilni kiriting: \n");
        String language = read();
        bool res = await dataService.storeString(key: "language", value: language);

        if(result || res){
          write("Muvaffaqiyatli yaratildi!");
        } else {
          write("Iltimos qayta urinib ko'ring!");
        }
      } return;

      case 2: {
        write("Qaysi ma'lumot kerak: \n");
        String text = read();
        dataService.readData(key: text)?.then((value) {
          write("\nsearch: $value");
        });
      } return;

      case 3: {
        // write("Qaysi ma'lumotni o'chirmoqchisiz?: ");
        // String delete = read();
        //
        // dataService.deleteData(key: delete).then((value) {
        //   write("\ndelete: $value");
        // });

        write("Ma'lumotlar o'chirilsinmi? \n");
        String cleare = clear();
        dataService.clearData(key: cleare).then((value) {
          write("\nclear: $value");
        });
      } return;
    }
  }
  print("Dastur yakunlandi, foydalanganingiz uchun raxmat!");
}










