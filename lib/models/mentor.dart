import 'package:super_woman_user/models/availablity.dart';

import '../services/api_base_helper.dart';
import 'experience.dart';

class Mentor {
  int id;
  String firstName;
  String lastName;
  //field;
  int noOfMentee;
  String? profilePicture;
  List<Experience>? experiences;
  List<Availablity>? availablity;

  Mentor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.noOfMentee,
    required this.profilePicture,
    this.experiences,
    this.availablity,
  });
  factory Mentor.fromJson(Map<String, dynamic> json) {
    List experiencesJson = json['experiances'] as List;
    List<Experience> experiences = [];
    for (int i = 0; i < experiencesJson.length; i++) {
      Map<String, dynamic> map = experiencesJson[i];
      experiences.add(Experience.fromJson(map));
    }
    List availablityJson = json['availablites'] as List;
    List<Availablity> availablities = [];
    availablities =
        availablityJson.map((el) => Availablity.fromJson(el)).toList();

    // List<Availablity> availablities = json['availablities']?.map((el) =>
    //     Availablity(
    //         id: el['id'], day: el['day'], to: el['to'], from: el['from']));
    return Mentor(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      noOfMentee: json['no_of_mentee'],
      profilePicture: json['profile_picture'],
      experiences: experiences,
      availablity: availablities,
    );
  }
}

class MentorLists {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  Future<List<Mentor>> fetchAllMentors() async {
    List<Mentor> mentors = [];
    final response = await apiBaseHelper.get(url: '/user/mentors');
    List mentorResponse = response['data'] as List;
    for (int i = 0; i < mentorResponse.length; i++) {
      Map<String, dynamic> map = mentorResponse[i];
      mentors.add(Mentor.fromJson(map));
    }
    return mentors;
  }

  Future<Mentor> fetchMyMentor(token) async {
    Mentor mentor;
    final response =
        await apiBaseHelper.get(url: '/user/my_mentor', token: token);
    Map<String, dynamic> map = response;
    mentor = Mentor.fromJson(map);
    return mentor;
  }

  Future sendMentorRequest(mentorId, message, token) async {
    return await apiBaseHelper.post(
        url: '/user/send_mentor_request/$mentorId',
        payload: message,
        token: token);
  }
}
