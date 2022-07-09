import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/widgets/primary_button.dart';

import '../../../../utils/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? _fullName;
  String? _educationLevel;
  String? _phoneNumber;
  int? _countryCode;

   formSumit() {
    if (_formKey.currentState!.validate()) {}
  }
  Widget _buildDropdownItem(Country country) =>
      Text("+${country.phoneCode}");

  @override
  Widget build(BuildContext context) {
    return Form(
      
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Full name'),
          const SizedBox(height: kDefaultPadding*0.3),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter full name';
              }
              return null;
            },
            onChanged: (value) {
              _fullName = value;
            },
            decoration: const InputDecoration(
              hintText: "Enter your full name",
            ),
          ),
          // InputDatePickerFormField(
          //   fieldHintText: 'Enter your birth date',
          //   errorFormatText: 'Format error',
          //   errorInvalidText: 'Invalid date',

          //   firstDate: DateTime(1950),
          //   lastDate: DateTime.now(),
          //   onDateSaved: (date) {},
          //   initialDate: DateTime.now(),
          // ),
          const SizedBox(height: kDefaultPadding),
          const Text('Date of birth'),
          const SizedBox(height: kDefaultPadding*0.3),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter full name';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Choose your birth date",
            ),
          ),
          
          const SizedBox(height: kDefaultPadding,),
          const Text('Educational Level'),
          const SizedBox(height: kDefaultPadding*0.3),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffd1d1d1))),
            child: DropdownButton<String>(
                value: _educationLevel,
                // icon: const Icon(Icons.arrow_downward),
                elevation: 8,
                underline: Container(
                  height: 0,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _educationLevel = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    child: Text('Grade 12'),
                  ),
                  DropdownMenuItem(
                    value: 'Grade 11',
                    child: Text('Grade 11'),
                  )
                ]),
          ),
          const SizedBox(height: kDefaultPadding,),
          const Text('Phone Number'),
          const SizedBox(height: kDefaultPadding*0.3),
          Container(
            padding: const EdgeInsets.only(left: 8.0),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0XFFd1d1d1))),
            child: Row(
              children: [
                CountryPickerDropdown(
                  initialValue: 'et',
                  itemBuilder: _buildDropdownItem,
                  onValuePicked: (Country country) {
                    print(country.name);
                  },
                ),
                Expanded(
                    child: TextFormField(
                    
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _fullName = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your phone number",
                    errorText: null,
                    errorStyle: TextStyle(height: 0)
                  ),
                ))
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding*0.5),
          const Text('We will text you to confirm your number'),
          const SizedBox(height: kDefaultPadding*1.5,),
          PrimaryButton(text: 'Continue', press: formSumit)
        ],
      ),
    );
  }
}
