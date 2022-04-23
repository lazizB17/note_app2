import 'dart:io';
import 'package:note_app/services/ext_service.dart';
import '../models/menu_model.dart';
import '../services/io_service.dart';
import '../services/navigation_service.dart';
import 'create_note_menu.dart';


class HomeMenu extends Menu{
  static const String id = "/home_menu";

  Future<void> selectFunction(String selectedMenu) async {
    switch(selectedMenu) {
      case "I": {
        await Navigator.push(CreateNoteMenu());
      } break;
      case "II": {} break;
      case "III": {} break;
      case "IV": exit(0);
      default: {
        writeln("error".tr);
      }
    }
  }

  @override
  Future<void> build() async {
    writeln("welcome".tr);
    writeln("I. " + "create_note".tr);
    writeln("II. " + "view_all_notes".tr);
    writeln("III. " + "settings".tr);
    writeln("IV. " + "exit".tr);
    String selectedMenu = read();
    await selectFunction(selectedMenu);
  }
}