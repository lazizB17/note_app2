import 'package:note_app/models/note_model.dart';
import 'package:note_app/services/data_service.dart';
import 'package:note_app/services/file_service.dart';
import 'package:note_app/services/io_service.dart';
import 'dart:io';

void main() async {
  FileService fileService = FileService();
  await fileService.init();

  String title = "";
  String content = "";
  String exit = "";

  write("Iltimos note ni nomini kiriting: ");
  title = read();

  // await fileService.updateFile(title);

  Note note = await fileService.readFile(title);
  print(note);

  // await fileService.deleteFile(title);

  // String path = await fileService.createFile(title);
  // writeln("Note ni yozishingiz mumkin(Yozib tugatganingizda 'Save' so'zini yozsangiz note saqlab qo'yiladi)");
  // while(exit != "Save") {
  //   exit = read();
  //   if(exit == "Save") {
  //     break;
  //   }
  //   content += (exit + "\n");
  // }
  //
  // Note note = Note(title: title, content: content);
  //
  // await fileService.writeFile(note, path).then((value) => print("Note muvofaqiyatli saqlandi"));
}


////////////////////////////////////////////////////////////////////////////////
/*
void main(){
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
*/

























