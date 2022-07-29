// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_picker_dropdown.dart';
// import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:super_woman_user/ui/widgets/primary_button.dart';
import '../../../../utils/constants.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String? _fullName;
  String? _educationLevel;
  String? _bio;

  formSumit() {
    if (_formKey.currentState!.validate()) {}
  }

  // Widget _buildDropdownItem(Country country) => Text("+${country.phoneCode}");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Full name'),
          const SizedBox(height: kDefaultPadding * 0.3),
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
          const SizedBox(height: kDefaultPadding),

          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Enter your bio';
            //   }
            //   return null;
            // },
            onChanged: (value) {
              _bio = value;
            },
            decoration: const InputDecoration(
              hintText: "Bio",
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          const Text('Date of birth'),
          const SizedBox(height: kDefaultPadding * 0.3),
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

          const SizedBox(
            height: kDefaultPadding,
          ),
          const Text('Educational Level'),
          const SizedBox(height: kDefaultPadding * 0.3),
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
          const SizedBox(
            height: kDefaultPadding,
          ),
          const SizedBox(height: kDefaultPadding * 0.3),
          // Container(
          //   padding: const EdgeInsets.only(left: 8.0),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //       border: Border.all(color: const Color(0XFFd1d1d1))),
          //   child: Row(
          //     children: [
          //       CountryPickerDropdown(
          //         initialValue: 'et',
          //         itemBuilder: _buildDropdownItem,
          //         onValuePicked: (Country country) {
          //           print(country.name);
          //         },
          //       ),
          //       Expanded(
          //           child: TextFormField(
          //         keyboardType: TextInputType.number,
          //         validator: (value) {
          //           if (value == null || value.isEmpty) {
          //             return '';
          //           }
          //           return null;
          //         },
          //         onChanged: (value) {
          //           _fullName = value;
          //         },
          //         decoration: const InputDecoration(
          //             hintText: "Enter your phone number",
          //             errorText: null,
          //             errorStyle: TextStyle(height: 0)),
          //       ))
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: kDefaultPadding * 1.5,
          ),
          PrimaryButton(
              child: const Text(
                'Continue',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              press: formSumit)
        ],
      ),
    );
  }
}
