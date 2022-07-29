import 'package:flutter/material.dart';
import '../models/education_level.dart';
import '../services/api_base_helper.dart';

class EducationLevels extends ChangeNotifier {
  List<EducationLevel> _educationLevelList = [];
  List<EducationLevel> get educationalLevels {
    return _educationLevelList;
  }

  Future<void> getEducationLevel() async {
    ApiBaseHelper apiBaseHelper = ApiBaseHelper();
    // List<EducationLevel>? _levelsList = [];
    try {
      List levelsResponse =
          await apiBaseHelper.get(url: '/user/education_levels') as List;
      for (int i = 0; i < levelsResponse.length; i++) {
        Map<String, dynamic> map = levelsResponse[i];
        _educationLevelList.add(EducationLevel.fromJson(map));
      }
    } catch (e) {
      //
    }

    notifyListeners();
  }
}
