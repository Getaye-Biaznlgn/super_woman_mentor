import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/models/education_level.dart';
import 'package:super_woman_user/providers/education_levels.dart';
import 'package:super_woman_user/ui/widgets/primary_button.dart';
import '../../../../providers/auth.dart';
import '../../../../utils/constants.dart';
import '../../otp/otp.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;

  EducationLevel? _eduLevel;
  String? _phoneNumber;
  String _countryCode = "+251";

  bool isLoading = false;
  DateTime _selectedDate = DateTime.now();
  String? _errorText = '';
  var dateFieldCtrl = TextEditingController();

  Future<void> formSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
        _errorText = "";
      });
      try {
        Auth auth = Auth();
        await auth.signUp(
          firstName: _firstName,
          lastName: _lastName,
          dob: _selectedDate,
          phoneNo: _countryCode + _phoneNumber!,
          eduLevelId: _eduLevel!.id,
        );
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => Otp(
                      phoneNo: _countryCode + _phoneNumber!,
                    )));
      } catch (e) {
        setState(() {
          _errorText = e.toString();
        });
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      helpText: "SELECT YOUR BIRTH DATE",
      initialDate: _selectedDate,
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );

    if (selected != null && selected != _selectedDate) {
      setState(() {
        _selectedDate = selected;
        dateFieldCtrl.text =
            "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}";
      });
    }
  }

  Widget _buildDropdownItem(Country country) =>
      Text("+${country.phoneCode}-${country.iso3Code}");
  @override
  Widget build(BuildContext context) {
    final educationLevels =
        Provider.of<EducationLevels>(context).educationalLevels;
    if (educationLevels.isNotEmpty) {
      _eduLevel = educationLevels[0];
    }

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('First name'),
            const SizedBox(height: kDefaultPadding * 0.3),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter first name';
                }
                return null;
              },
              onChanged: (value) {
                _firstName = value;
              },
              decoration: const InputDecoration(
                hintText: "Enter your first name",
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            const Text('Last name'),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter last name';
                }
                return null;
              },
              onChanged: (value) {
                _lastName = value;
              },
              decoration: const InputDecoration(
                hintText: "Enter your last name",
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            const Text('Date of birth'),
            const SizedBox(height: kDefaultPadding * 0.3),
            TextFormField(
              controller: dateFieldCtrl,
              keyboardType: TextInputType.none,
              enabled: true,
              // initialValue: "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter birth date';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Choose your birth date",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () {
                      _selectDate(context);
                    },
                  )),
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
              child: DropdownButton<EducationLevel>(
                  value: _eduLevel,
                  // icon: const Icon(Icons.arrow_downward),
                  elevation: 8,
                  isExpanded: true,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (EducationLevel? newValue) {
                    setState(() {
                      _eduLevel = newValue;
                    });
                  },
                  items: educationLevels.map((EducationLevel item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item.level ?? ''),
                    );
                  }).toList()),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            const Text('Phone Number'),
            const SizedBox(height: kDefaultPadding * 0.3),
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
                      _countryCode = country.phoneCode;
                    },
                  ),
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _phoneNumber = value;
                    },
                    decoration: const InputDecoration(
                        hintText: "Phone number",
                        errorText: null,
                        errorStyle: TextStyle(height: 0)),
                  ))
                ],
              ),
            ),
            const SizedBox(height: kDefaultPadding * 0.5),
            const Text('We will text you to confirm your number'),
            const SizedBox(
              height: kDefaultPadding * 1.5,
            ),
            // if (isLoading)
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
                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.only(left: kDefaultPadding),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                  ],
                ),
                press: formSubmit),
            //  const SizedBox(height: kDefaultPadding,)
            Text(
              _errorText ?? '',
              style: const TextStyle(color: kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
