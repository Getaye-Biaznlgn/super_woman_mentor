import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/models/education_level.dart';
import 'package:super_woman_user/providers/education_levels.dart';
import 'package:super_woman_user/ui/widgets/primary_button.dart';
import '../../../../providers/auth.dart';
import '../../../../utils/constants.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateFieldCtrl = TextEditingController();
  final TextEditingController _firstNameCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController();
  final TextEditingController _bioCtrl = TextEditingController();

  DateTime? _dob;
  List<EducationLevel> _levelList = [];
  late EducationLevel _selectedLevel;
  bool _isLoading = false;
  String _errorText = "";

  formSumit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorText = "";
      });
      try {
        Auth auth = Provider.of<Auth>(context, listen: false);
        await auth.editProfile(
            firstName: _firstNameCtrl.text,
            lastName: _lastNameCtrl.text,
            dob: _dob.toString(),
            eduLevelId: _selectedLevel.id,
            token: auth.token,
            bio: auth.bio);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Profile is upadted successfully.'),
        ));
      } catch (e) {
        setState(() {
          _errorText = 'error' + e.toString();
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      helpText: "SELECT YOUR BIRTH DATE",
      initialDate: _dob ?? DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );

    if (selected != null && selected != _dob) {
      setState(() {
        _dob = selected;
        _dateFieldCtrl.text = "${_dob?.day}/${_dob?.month}/${_dob?.year}";
      });
    }
  }

  setPreviousProfile(Auth auth, EducationLevels eduLevels) {
    _dob = DateTime.parse(auth.dob);
    _firstNameCtrl.text = auth.firstName;
    _lastNameCtrl.text = auth.lastName;
    _bioCtrl.text = auth.bio;
    _dateFieldCtrl.text = "${_dob?.day}/${_dob?.month}/${_dob?.year}";
    _levelList = eduLevels.educationalLevels;
    print('');

    _selectedLevel =
        _levelList.firstWhere((el) => el.id == auth.educationLevelId);
  }

  @override
  void initState() {
    super.initState();
    Auth auth = Provider.of<Auth>(context, listen: false);
    EducationLevels eduLevels =
        Provider.of<EducationLevels>(context, listen: false);
    setPreviousProfile(auth, eduLevels);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('First name'),
          const SizedBox(height: kDefaultPadding * 0.3),
          TextFormField(
            controller: _firstNameCtrl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter First name';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Enter your first name",
            ),
          ),
          const SizedBox(height: kDefaultPadding * 1 / 2),
          const Text('Last name'),
          const SizedBox(height: kDefaultPadding * 0.3),
          TextFormField(
            controller: _lastNameCtrl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter last name';
              }
              return null;
            },
            // onChanged: (value) {
            //   _lastName = value;
            // },
            decoration: const InputDecoration(
              hintText: "Enter your last name",
            ),
          ),
          const SizedBox(height: kDefaultPadding * 1 / 2),
          const Text('Bio'),
          const SizedBox(height: kDefaultPadding * 0.3),
          TextFormField(
            controller: _bioCtrl,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: "Bio",
            ),
          ),
          const SizedBox(height: kDefaultPadding * 1 / 2),
          const Text('Date of birth'),
          const SizedBox(height: kDefaultPadding * 0.3),
          TextFormField(
            controller: _dateFieldCtrl,
            keyboardType: TextInputType.none,
            enabled: true,
            // initialValue: "${_dob.day}/${_dob.month}/${_dob.year}",
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
            height: kDefaultPadding * 1 / 2,
          ),
          const Text('Educational Level'),
          const SizedBox(height: kDefaultPadding * 0.3),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffd1d1d1))),
            child: DropdownButton<EducationLevel>(
                value: _selectedLevel,
                isExpanded: true,
                // icon: const Icon(Icons.arrow_downward),
                elevation: 8,
                underline: Container(
                  height: 0,
                ),
                onChanged: (EducationLevel? newValue) {
                  setState(() {
                    _selectedLevel = newValue!;
                  });
                },
                items: _levelList
                    .map((EducationLevel level) =>
                        DropdownMenuItem<EducationLevel>(
                            value: level, child: Text(level.level ?? "")))
                    .toList()),
          ),
          const SizedBox(
            height: kDefaultPadding * 1 / 2,
          ),
          const SizedBox(height: kDefaultPadding * 0.3),
          const SizedBox(
            height: kDefaultPadding * 1.5,
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
              press: formSumit),
          Text(
            _errorText,
            style: const TextStyle(color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}
