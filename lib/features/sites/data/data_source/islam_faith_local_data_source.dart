import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class IslamFaithLocalDataSource {
  Future<List<FixedEntities>> getArtical();
}

class IslamFaithLocalDataSourceImp extends IslamFaithLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  IslamFaithLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<FixedEntities>> getArtical() async {
    Get.find<Logger>()
        .i("Start `getArtical` in |IslamFaithLocalDataSourceImp|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.islamFaith);
    List<FixedEntities> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      jsonData['islamfaith'].forEach((key, value) {
        articals.add(FixedEntities(
          name: key,
          content: value,
        ));
      });
    }
    Get.find<Logger>().w("End `getArtical` in |IslamFaithLocalDataSourceImp|");
    return Future.value(articals);
  }
}
