import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/main.dart';
import 'package:my_notes_app/page/main_page.dart';
import 'package:my_notes_app/service/utils.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/widgets.dart';

class LoginPage extends StatefulWidget
{
  final VoidCallback onClickedRegister;

  const LoginPage({super.key, required this.onClickedRegister});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _logIn() async
  {
    showDialog
    (
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator())
    );

    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword
      (
        email: _mailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
    on FirebaseAuthException catch (e)
    {
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose()
  {
    _mailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<User?>
    (
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot)
      {
        if(snapshot.hasData)
        {
          return const MainPage();
        }
        else
        {
          return Scaffold
          (
            appBar: AppBar
            (
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: tranparentStatusBar(),
              title: Text("Giriş Yap",style: AppStyle.loginTitleStyle),
              centerTitle: true,
              toolbarHeight: 120,
            ),
            body: SingleChildScrollView
            (
              child: Padding
              (
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column
                (
                  children:
                  [
                    TextField //Mail Text
                    (
                      controller: _mailController,
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
                    TextField //Password Text
                    (
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration
                      (
                        hintText: "Parola",
                        prefixIcon: const Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: AppStyle.txtFieldBorder,
                        focusedBorder: AppStyle.txtFieldBorder,
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell //Log In Button
                    (
                      onTap: () => _logIn(),
                      child: Ink
                      (
                        height: 50,
                        decoration: BoxDecoration
                        (
                          color: Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(child: Text("Giriş Yap",
                        style: TextStyle(color: Colors.white,fontSize: 16),)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row //OR Separate
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                      [
                        Container(height: 0.4,width: 120,color: Colors.black),
                        const Text("Ya da"),
                        Container(height: 0.4,width: 120,color: Colors.black)
                      ]
                    ),
                    const SizedBox(height: 20),
                    InkWell //Log In with Google
                    (
                      onTap: () => print("Google"),
                      child: Ink
                      (
                        height: 50,
                        decoration: BoxDecoration
                        (
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Image.asset("images/google.png"),
                          const Text("Google ile devam et",
                          style: TextStyle(color: Colors.black,fontSize: 16)),
                        ])),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text.rich(TextSpan(children:
                    [
                      const TextSpan(text: "Hesabın yok mu?  "),
                      TextSpan
                      (
                        text: "Hesap oluştur",style: AppStyle.singUpTxt,
                        recognizer: TapGestureRecognizer()..onTap = widget.onClickedRegister
                      ),
                    ])),
                  ],
                ),
              ),
            ),
          );
        }
      }
    );
  }
}