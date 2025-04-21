import 'package:hive/hive.dart';
import 'package:university_magazine_project/hive/hive_constants.dart';
part 'deadline_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_DEADLINE_VO, adapterName: DEADLINE_VO_ADAPTER)
class DeadlineVO {
  @HiveField(0)
  String? firstFinalDate;
  @HiveField(1)
  String? secondFinalDate;


  DeadlineVO({
    this.firstFinalDate,
    this.secondFinalDate,
  });
}
