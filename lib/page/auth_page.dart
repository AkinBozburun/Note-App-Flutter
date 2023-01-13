import 'package:flutter/material.dart';
import 'package:my_notes_app/page/login_page.dart';
import 'package:my_notes_app/page/register_page.dart';

class AuthPage extends StatefulWidget
{
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
{
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin ?
  LoginPage(onClickedRegister: toggle) :
  RegisterPage(onClickedLogIn: toggle);

  toggle()
  {
    setState((){isLogin = !isLogin;});
  }
}