import 'package:university_magazine_project/app/model/deadline_vo.dart';

DeadlineVO populatedDL = DeadlineVO(
    firstFinalDate:
        DateTime.now().add(Duration(days: 7)).toString().substring(0, 10),
    secondFinalDate:
        DateTime.now().add(Duration(days: 14)).toString().substring(0, 10));
