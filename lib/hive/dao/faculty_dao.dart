import 'package:hive/hive.dart';
import 'package:university_magazine_project/app/model/faculty_vo.dart';
import 'package:university_magazine_project/hive/hive_constants.dart';

mixin FacultyDao {
  /// Persistence

  void saveFaculty(FacultyVO? fac) async {
    await getFacultyBox().put(fac?.id, fac!);
  }

  void deleteFaculty(String? id) async {
    await getFacultyBox().delete(id);
  }

  void clearFaculty() async {
    await getFacultyBox().clear();
  }

  List<FacultyVO?>? getAllFaculty() {
    return getFacultyBox().values.toList();
  }

  /// Reactive
  Stream<void> getAllFacultyEventStream() {
    return getFacultyBox().watch();
  }

  Stream<List<FacultyVO?>?> getAllFacultyStream() {
    return Stream.value(getAllFaculty());
  }

  /// Box
  Box<FacultyVO> getFacultyBox() {
    return Hive.box<FacultyVO>(BOX_NAME_FACULTY_VO);
  }
}
