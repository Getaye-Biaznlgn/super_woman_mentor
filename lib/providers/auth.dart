import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_woman_user/services/api_base_helper.dart';
import '../services/storage_manager.dart';

class Auth with ChangeNotifier {
  String? _token = '39|5VCtYdRIq5HSuCDWOLkDH8FAGTwsn53hr1Zegx8D';
  String? _lastName;
  String? _firstName;
  String? _email;
  String? _phoneNumber;
  String? _bio;

  // String? date_of_birth;
  String? _profilePicture;
  int? _educationLevelId;
  // page loading controller
  // bool _isLoading = false;
  _fromJson(Map<String, dynamic> json) {
    _token = json['access_token'];
    _firstName = json['user']['first_name'];
    _lastName = json['user']['last_name'];
    _email = json['user']['email'];
    _phoneNumber = json['user']['phone_number'];
    _profilePicture = json['user']['profile_picture'];
    _educationLevelId = json['user']['education_level_id'];
    notifyListeners();
    print('😂😂😂');
  }

  //
  bool get isAuth {
    return _token != null;
  }

  Future signIn(phoneNo) async {
    Map<String, dynamic> data = {'phone_number': phoneNo};
    ApiBaseHelper apiBaseHelper = ApiBaseHelper();
    var signUpResponse =
        await apiBaseHelper.post(url: '/user/login', payload: data);
    print('signup');
    return signUpResponse;
  }

  Future signUp(
      {required firstName,
      required lastName,
      required dob,
      required eduLevelId,
      required phoneNo}) async {
    ApiBaseHelper apiBaseHelper = ApiBaseHelper();
    Map<String, dynamic> userInfo = {
      'first_name': lastName,
      'last_name': firstName,
      'date_of_birth': dob.toString(),
      'education_level_id': eduLevelId,
      'phone_number': phoneNo
    };
    var signUpResponse =
        await apiBaseHelper.post(url: '/user/register', payload: userInfo);
    return signUpResponse;
  }

  Future verifyOtp({required phoneNo, required otp}) async {
    ApiBaseHelper apiBaseHelper = ApiBaseHelper();
    Map<String, dynamic> userInfo = {'phone_number': phoneNo, 'otp': otp};

    var verifyOtpResponse =
        await apiBaseHelper.post(url: '/user/verify_phone', payload: userInfo);
    print(verifyOtpResponse);
    if (verifyOtpResponse != null) {
      _fromJson(verifyOtpResponse);
          StorageManager.saveData('authToken', _token);
    }

    // return verifyOtpResponse;
  }

  Future resendOtp({required phoneNo}) async {
    ApiBaseHelper apiBaseHelper = ApiBaseHelper();
    Map<String, dynamic> userInfo = {'phone_number': phoneNo};

    var resendOtpResponse =
        await apiBaseHelper.post(url: '/user/resend', payload: userInfo);
    return resendOtpResponse;
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('authToken')) return false;
    _token = prefs.getString('authToken');
    notifyListeners();
    return true;
  }

  get token {
    return _token;
  }

  get lastName {
    return _lastName;
  }

  get firstName {
    return _firstName;
  }

  get email {
    return _email;
  }

  get phoneNumber {
    return _phoneNumber;
  }

  get bio {
    return _bio;
  }

  get profilePictue {
    return _profilePicture;
  }

  get educationLevelId {
    return _educationLevelId;
  }

  // bool get isLoading {
  //   return _isLoading;
  // }

  // set isLoading(bool val) {
  //   _isLoading = val;
  //   notifyListeners();
  // }
}
