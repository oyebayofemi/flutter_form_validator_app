import 'package:flutter/material.dart';
import 'package:form_validator_app/widget/login_page_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Center(
          child: SingleChildScrollView(
            child: LoginPageWidget(
                formkey: formkey,
                usernameController: _usernameController,
                passwordController: _passwordController),
          ),
        ),
      ),
    );
  }
}
