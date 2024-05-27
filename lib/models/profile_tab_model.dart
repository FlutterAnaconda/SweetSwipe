import 'package:flutter/Material.dart';

class ProfiletabModel {
  final String title;
  final Function(BuildContext) onpressed;
  final String iconspath;
  const ProfiletabModel(
      {required this.title, required this.onpressed, required this.iconspath});
}
