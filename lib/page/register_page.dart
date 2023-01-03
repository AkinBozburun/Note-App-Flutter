import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/page/login_page.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/widgets.dart';

class RegisterPage extends StatefulWidget
{
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: tranparentStatusBar(),
        title: Text("Hesap Oluştur",style: AppStyle.loginTitleStyle),
        centerTitle: true,
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView
      (
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column
          (
            children:
            [
              TextField //Mail Text
              (
                decoration: InputDecoration
                (
                  hintText: "Adın",
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: AppStyle.txtFieldBorder,
                  focusedBorder: AppStyle.txtFieldBorder,
                ),
              ),
              const SizedBox(height: 15),
              TextField //Mail Text
              (
                decoration: InputDecoration
                (
                  hintText: "Email Adresi",
                  prefixIcon: const Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: AppStyle.txtFieldBorder,
                  focusedBorder: AppStyle.txtFieldBorder,
                ),
              ),
              const SizedBox(height: 15),
              TextField //Mail Text
              (
                decoration: InputDecoration
                (
                  hintText: "Parola",
                  prefixIcon: const Icon(Icons.key),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: AppStyle.txtFieldBorder,
                  focusedBorder: AppStyle.txtFieldBorder,
                ),
              ),
              const SizedBox(height: 30),
              InkWell
              (
                onTap: () => print("Register"),
                child: Ink
                (
                  height: 50,
                  decoration: BoxDecoration
                  (
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(child: Text("Hesabı Oluştur",
                  style: TextStyle(color: Colors.white,fontSize: 16),)),
                ),
              ),
              const SizedBox(height: 30),
              Text.rich(TextSpan(children:
              [
                const TextSpan(text: "Zaten bir hesabın mı var?  "),
                TextSpan
                (
                  text: "Giriş Yap",style: AppStyle.singUpTxt,
                  recognizer: TapGestureRecognizer()..onTap=() =>
                  Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}