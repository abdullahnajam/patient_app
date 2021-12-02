import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:patient_app/Model/DoctorModel.dart';
import 'package:patient_app/widgets/doctor_card.dart';


class SearchDoctor extends SearchDelegate<String> {
  final List<DoctorModel> doctor;
  String? result;
  SearchDoctor(this.doctor);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = doctor.where((doctor) {
      return doctor.name.toLowerCase().contains(query.toLowerCase());
       

    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return DoctorCard(suggestions.elementAt(index));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = doctor.where((doctor) {
      return doctor.name.toLowerCase().contains(query.toLowerCase());

    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DoctorCard(suggestions.elementAt(index)),
        );
      },
    );
  }
}