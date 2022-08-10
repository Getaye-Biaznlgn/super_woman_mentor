import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/ui/screens/home/home_screen.dart';
import 'package:super_woman_user/ui/widgets/primary_button.dart';
import 'package:super_woman_user/utils/constants.dart';
import '../../../../providers/auth.dart';
import '../../interest_setting/interest_setting.dart';
import '../../interest_setting/screen_argument.dart';

class OtpForm extends StatefulWidget {
  String phoneNo;
  OtpForm({
    required this.phoneNo,
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;
  bool _isLoading = false;
  String _errorText = "";
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrl1 = TextEditingController();
  final TextEditingController _ctrl2 = TextEditingController();
  final TextEditingController _ctrl3 = TextEditingController();
  final TextEditingController _ctrl4 = TextEditingController();
  final TextEditingController _ctrl5 = TextEditingController();
  final TextEditingController _ctrl6 = TextEditingController();
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
    _ctrl1.dispose();
    _ctrl2.dispose();
    _ctrl3.dispose();
    _ctrl4.dispose();
    _ctrl5.dispose();
    _ctrl6.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  Future<void> formSubmit() async {
    // if (_formKey.currentState!.validate()) {
    String otp = _ctrl1.text.toString() +
        _ctrl2.text.toString() +
        _ctrl3.text.toString() +
        _ctrl4.text.toString() +
        _ctrl5.text.toString() +
        _ctrl6.text.toString();
    setState(() {
      _isLoading = true;
      _errorText = "";
    });
    try {
      // Auth auth = Auth();
      await Provider.of<Auth>(context, listen: false).verifyOtp(
        phoneNo: widget.phoneNo,
        otp: otp,
      );
      Navigator.pushReplacementNamed(context, HomeScreen.routeName,
          arguments: ScreenArgument(isInSetting: false));
    } catch (e) {
      setState(() {
        _errorText = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    // }
  }

  Future<void> resendOtp() async {
    setState(() {
      _errorText = "";
    });
    try {
      Auth auth = Auth();
      await auth.resendOtp(
        phoneNo: widget.phoneNo,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Confirmation code is sent.'),
        ),
      );
    } catch (e) {
      setState(() {
        _errorText = e.toString();
      });
    }
  }

  final otpInputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      // borderSide: const BorderSide(color: Colors.green),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      // borderSide: const BorderSide(color: Colors.green),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      // borderSide: const BorderSide(color: Colors.green),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // Provider.of<ThemeNotifier>(context).themeMode;
    final double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width / 8,
                child: TextFormField(
                  controller: _ctrl1,
                  autofocus: true,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: width / 8,
                child: TextFormField(
                  controller: _ctrl2,
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: width / 8,
                child: TextFormField(
                  controller: _ctrl3,
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: width / 8,
                child: TextFormField(
                  controller: _ctrl4,
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin5FocusNode),
                ),
              ),
              SizedBox(
                width: width / 8,
                child: TextFormField(
                  controller: _ctrl5,
                  focusNode: pin5FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin6FocusNode),
                ),
              ),
              SizedBox(
                width: width / 8,
                child: TextFormField(
                  controller: _ctrl6,
                  focusNode: pin6FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin6FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding),
          Row(children: [
            const Text('Don\'t get the code?'),
            const SizedBox(
              width: kDefaultPadding,
            ),
            TextButton(
                onPressed: resendOtp,
                child: const Text(
                  'Resend',
                  style: TextStyle(color: kPrimaryColor),
                )),
            const Spacer()
          ]),
          const SizedBox(
            height: kDefaultPadding * 2,
          ),
          PrimaryButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.only(left: kDefaultPadding),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
              ],
            ),
            press: formSubmit,
          ),
          Text(
            _errorText,
            style: const TextStyle(color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}
