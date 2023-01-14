import 'package:flutter/material.dart';
import 'package:my_notes_app/page/login_page.dart';
import 'package:my_notes_app/page/register_page.dart';

class UserFormPage extends StatefulWidget
{
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage>
{
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin ?
  LoginPage(onClickedRegister: toggle) :
  RegisterPage(onClickedLogIn: toggle);

  toggle()
  {
    setState(()=>isLogin = !isLogin);
  }
}