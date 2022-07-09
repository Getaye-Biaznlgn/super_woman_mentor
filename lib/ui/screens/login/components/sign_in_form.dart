import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/widgets/primary_button.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
import 'package:super_woman_user/utils/constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? country;
  String? phoneNo;
  bool isChecked = true;

  formSumit() {
    if (_formKey.currentState!.validate()) {}
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
              : Text(country.name + " (${country.phoneCode})"),
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
                itemBuilder: _buildDropdownItem,
                onValuePicked: (Country country) {
                  print(country.name);
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
              decoration: const InputDecoration(
                hintText: "Phone number",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffd1d1d1))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffd1d1d1))),
               errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)
               ),
               focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color:kPrimaryColor)
               )
              ),
            ),
            const SizedBox(height: kDefaultPadding*0.5,),
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
           const SizedBox(height: kDefaultPadding,),
            PrimaryButton(text: 'Continue', press: formSumit),
          ],
        ),
      ),
    );
  }
}
