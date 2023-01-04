import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/main.dart';
import 'package:my_notes_app/service/utils.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/widgets.dart';

class RegisterPage extends StatefulWidget
{
  final VoidCallback onClickedLogIn;

  const RegisterPage({super.key, required this.onClickedLogIn,});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _register() async
  {
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    showDialog
    (
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator())
    );

    try
    {
      await FirebaseAuth.instance.createUserWithEmailAndPassword
      (
        email: _mailController.text.trim(),
        password: _passwordController.text.trim()
      ).then((value) => value.user!.updateDisplayName(_nameController.text.trim()).then((value)
      => navigatorKey.currentState!.popUntil((route) => route.isFirst)));
    }
    on FirebaseAuthException catch (e)
    {
      Utils.showSnackBar(e.message);
    }

    ;
  }

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
        child: Padding
        (
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form
          (
            key: formKey,
            child: Column
            (
              children:
              [
                TextFormField //Name Text
                (
                  controller: _nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (name) => name != null && name.length < 2 ? "Geçerli bir isim girin!" : null,
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
                TextFormField //Mail Text
                (
                  controller: _mailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) => email != null && !EmailValidator.validate(email)
                  ? "Geçerli olan bir e-posta adresi girin" : null,
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
                TextFormField //Password Text
                (
                  controller: _passwordController,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                  ? "Parola en az 6 karakter olmalı!" : null,
                  decoration: InputDecoration
                  (
                    hintText: "Parola (En az 6 karakter)",
                    prefixIcon: const Icon(Icons.key),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: AppStyle.txtFieldBorder,
                    focusedBorder: AppStyle.txtFieldBorder,
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField //Password Confirm Text
                (
                  controller: _passwordConfirmController,
                  obscureText: true,
                  validator: (value) => value != null && value != _passwordController.text
                  ? "Parola aynı değil" : null,
                  decoration: InputDecoration
                  (
                    hintText: "Parolayı doğrula",
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
                  onTap: () => _register(),
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
                    recognizer: TapGestureRecognizer()..onTap = widget.onClickedLogIn
                  ),
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}