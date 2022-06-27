// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, override_on_non_overriding_member, annotate_overrides, use_key_in_widget_constructors, camel_case_types
import 'package:flutter/material.dart';

class shello extends StatefulWidget {
  const shello({Key? key}) : super(key: key);

  @override
  State<shello> createState() => _shelloState();
}

class _shelloState extends State<shello> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
    );
  }
}
