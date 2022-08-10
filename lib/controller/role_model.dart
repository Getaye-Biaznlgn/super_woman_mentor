import '../models/role_model.dart';
import '../models/role_model_detail.dart';
import '../services/api_base_helper.dart';

class RoleModelController {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  Future<List<RoleModel>> fetchRoleModels() async {
    List<RoleModel> roleModels = [];
    final response = await apiBaseHelper.get(url: '/user/get_role_models');
    List roleModelResponse = response['data'] as List;
    for (int i = 0; i < roleModelResponse.length; i++) {
      Map<String, dynamic> map = roleModelResponse[i];
      roleModels.add(RoleModel.fromJson(map));
    }
    return roleModels;
  }
//RETURN ROLE MODEL DETAIL NOT ROLE MODEL
    Future<RoleModelDetail> fetchRoleModel(int id) async {
    ApiBaseHelper apiBaseHelper = ApiBaseHelper();

    final response =
        await apiBaseHelper.get(url: '/user/get_detail_role_models/${id}');
    return RoleModelDetail.fromJson(response);
  }
}
