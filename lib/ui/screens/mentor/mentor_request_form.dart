import 'package:flutter/material.dart';
import 'package:super_woman_user/utils/constants.dart';

class MentorRequestForm extends StatefulWidget {
  static const routeName = '/mentor-request-form';
  const MentorRequestForm({Key? key}) : super(key: key);

  @override
  State<MentorRequestForm> createState() => _MentorRequestFormState();
}

class _MentorRequestFormState extends State<MentorRequestForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provide some info'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value can\'t be blank';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Specify what you want to learn",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: kPrimaryColor,
                  minWidth: double.infinity,
                  onPressed: () {},
                  child: const Text(
                    'Send Mentoring Request',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
