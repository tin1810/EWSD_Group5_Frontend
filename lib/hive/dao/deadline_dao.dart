import 'package:hive/hive.dart';
import 'package:university_magazine_project/app/model/deadline_vo.dart';
import 'package:university_magazine_project/hive/hive_constants.dart';

mixin DeadlineDao {
  /// Persistence

  void saveDeadline(DeadlineVO deadline) async {
    await getDeadlineBox().put(1, deadline);
  }

  void deleteDeadline(String? id) async {
    await getDeadlineBox().delete(id);
  }

  void clearDeadline() async {
    await getDeadlineBox().clear();
  }

  DeadlineVO? getDeadline() {
    return getDeadlineBox().get(1);
  }

  /// Box
  Box<DeadlineVO> getDeadlineBox() {
    return Hive.box<DeadlineVO>(BOX_NAME_DEADLINE_VO);
  }
}
