import 'package:note_app/menu/create_note_menu.dart';
import 'package:note_app/menu/home_menu.dart';
import 'package:note_app/services/lang_services.dart';
import 'package:note_app/services/note_service.dart';

void main() async {
  MyApp(
    home: HomeMenu(),
    locale: await LangService.currentLanguage(),
    routes: {
      HomeMenu.id: HomeMenu(),
      CreateNoteMenu.id: CreateNoteMenu(),
    },
  );
}

////////////////////////////////////////////////////////////////////////////////

