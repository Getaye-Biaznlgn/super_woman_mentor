import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_woman_user/utils/constants.dart';

import '../../../models/mentor.dart';
import '../../../providers/auth.dart';

class MentorRequestForm extends StatefulWidget {
  static const routeName = '/mentor-request-form';
  const MentorRequestForm({Key? key}) : super(key: key);

  @override
  State<MentorRequestForm> createState() => _MentorRequestFormState();
}

class _MentorRequestFormState extends State<MentorRequestForm> {
  final _formKey = GlobalKey<FormState>();
  String? _message;
  bool _isLoading = false;
  String _errorText = "";

  Future<void> _formSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorText = "";
      });
      try {
        String token = Provider.of<Auth>(context, listen: false).token;
        final mentorId = ModalRoute.of(context)!.settings.arguments as int;

        MentorLists mentorLists = MentorLists();
        Map<String, dynamic> message = {'message': _message};
        await mentorLists.sendMentorRequest(mentorId, message, token);
        ScaffoldMessenger.of(context).showSnackBar(
          
          const SnackBar(
            content: Text('Request is sent successfully'),
          ),
          
        );
        // Navigator.pop(context);
      } catch (e) {
        setState(() {
          _errorText = e.toString();
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

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
                  onChanged: (value) {
                    _message = value;
                  },
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
                  onPressed: _formSubmit,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Send Mentoring Request',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
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
                  //const Text(
                  //   'Send Mentoring Request',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
                Text(_errorText),
              ],
            ),
          ),
        ));
  }
}
