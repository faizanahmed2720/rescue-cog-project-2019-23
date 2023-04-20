import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class userAccountSetting extends StatefulWidget {
  const userAccountSetting({super.key});

  @override
  State<userAccountSetting> createState() => _userAccountSettingState();
}

class _userAccountSettingState extends State<userAccountSetting> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("This is User Account Setting Screen")),
    );
  }
}
