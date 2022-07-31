import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/ui/widgets/primary_button.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
import 'package:super_woman_user/utils/constants.dart';

import '../../../../providers/auth.dart';
import '../../otp/otp.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String _phoneCode = "+251";
  String? _phoneNo;
  bool isChecked = true;
  bool _isLoading = false;
  String _errorText = "";
  // formSumit() {
  //   if (_formKey.currentState!.validate()) {

  //   }
  // }
  Future<void> _formSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorText = "";
      });
      try {
        Auth auth = Auth();
        await auth.signIn(
          _phoneCode + _phoneNo!,
        );

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => Otp(
                      phoneNo: _phoneCode + _phoneNo!,
                    )));
      } catch (e) {
        // setState(() {
        //   _errorText = e.toString();
        // });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildDropdownItem(Country country) => Row(
        // mainAxisAlignment: MainAxisAlignment.,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(
            width: kDefaultPadding * 0.5,
          ),
          country.name.length > 15
              ? Text(country.name.substring(0, 15) + " (${country.phoneCode})")
              : Text(country.name + "+ (${country.phoneCode})"),
        ],
      );

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return kSecondaryColor;
      }
      return kPrimaryColor;
    }

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0XFFd1d1d1))),
              child: CountryPickerDropdown(
                initialValue: 'et',
                isExpanded: true,
                itemBuilder: _buildDropdownItem,
                onValuePicked: (Country country) {
                  _phoneCode = country.phoneCode;
                },
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter phone number';
                }
                return null;
              },
              onChanged: (value) {
                _phoneNo = value;
              },
              decoration: const InputDecoration(
                  hintText: "Phone number",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd1d1d1))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd1d1d1))),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor))),
            ),
            const SizedBox(
              height: kDefaultPadding * 0.5,
            ),
            const Text('We will text you to confirm your number'),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Text('Remember me')
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
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
                // const Text(
                //   'Continue',
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20),
                // ),
                press: _formSubmit),
          ],
        ),
      ),
    );
  }
}
