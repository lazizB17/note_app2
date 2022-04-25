import 'dart:io';
import 'package:note_app/services/ext_service.dart';
import 'package:note_app/services/file_service.dart';
import 'package:note_app/services/io_service.dart';
import 'package:note_app/services/lang_services.dart';
import 'package:note_app/services/navigation_service.dart';
import '../models/menu_model.dart';


class AppSetting extends Menu {
  static const String id = "app_settings";

  Future<void> viewNoteList() async {
    FileService fileService = FileService();
    await fileService.init();
    List<FileSystemEntity>  files = fileService.directory.listSync();
    if(files.isEmpty) {
      // for(int i = 0; i < files.length; i++){
      //   writeln("${i + 1}.${files[i].path.substring(files[0].path.lastIndexOf("\\") + 1)}");
      // }

      writeln("I. " + "change_pas".tr);
      writeln("II. " + "change_lang".tr);
      writeln("III. " + "back_to_home".tr);
      String selectedMenu = read();
      await selectFunctionIf(selectedMenu, files);
    } else {
      writeln("no_note".tr);
      writeln("I" + "create_note".tr);
      writeln("II" + "back_to_home".tr);
      String selectedMenu = read();
      await selectFunctionElse(selectedMenu);
    }
  }

  Future<void> chooseLang() async {
    FileService fileService = FileService();
    await fileService.init();
    List<FileSystemEntity>  files = fileService.directory.listSync();
    if(files.isEmpty) {
      // for(int i = 0; i < files.length; i++){
      //   writeln("${i + 1}.${files[i].path.substring(files[0].path.lastIndexOf("\\") + 1)}");
      // }

      writeln("I. " + "RU".tr);
      writeln("II. " + "UZ".tr);
      writeln("III. " + "EN".tr);
      String selectedMenu = read();
      await selectFunctionIf(selectedMenu, files);
    } else {
      writeln("no_note".tr);
      writeln("I" + "create_note".tr);
      writeln("II" + "back_to_home".tr);
      String selectedMenu = read();
      await selectFunctionElse(selectedMenu);
    }
  }

  Future<void> selectFunctionIf(String selectedMenu, List<FileSystemEntity> files) async {
    switch(selectedMenu) {
      case "I": {
        write("\n\n\n\n\n\n");
        await Navigator.push(ViewOneNoteMenu(list: files));
      } break;
      case "II": {
        write("\n\n\n\n\n\n");
        write("choose_lang".tr);
        await chooseLang();
      } break;
      case "III": {
        write("\n\n\n\n\n\n");
        // hali bor
        await Navigator.push(SelectDeleteMenu(list: files));
      } break;
      default: {
        writeln("error".tr);
      }
    }
  }

  Future<void> selectLang(String selectedMenu, List<FileSystemEntity> files) async {
    switch(selectedMenu) {
      case "I": {
        write("\n\n\n\n\n\n");
        write("Ru ga o'tdi\n\n");
        LangService.language = Language.ru;
      } break;
      case "II": {
        write("\n\n\n\n\n\n");
        write("Uz ga o'tdi\n\n");
        LangService.language = Language.uz;
      } break;
      case "III": {
        write("\n\n\n\n\n\n");
        write("En ga o'tdi\n\n");
        LangService.language = Language.en;
      } break;
      default: {
        writeln("error".tr);
      }
    }
  }

  Future<void> selectFunctionelse(String selectedMenu) async {
    switch(selectedMenu) {
      case "I": {
        write("\n\n\n\n\n\n");
        await Navigator.pushReplacement(CreatedNoteMenu());
      } break;
      case "II": {
        write("\n\n\n\n\n\n");
        await Navigator.pop();
      } break;
      default: {
        writeln("error".tr);
      }
    }
  }

  @override
  Future<void> build() async {
    await viewNoteList();
  }
}







