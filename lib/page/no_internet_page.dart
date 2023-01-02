import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/page/main_page.dart';

class NoInternetPage extends StatelessWidget
{
  const NoInternetPage({super.key});

  _netCheck(context) async
  {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult != ConnectivityResult.none)
    {
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
      (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold
  (
    body: Center
    (
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          SizedBox
          (
            height: 140,
            width: 140,
            child: Image.asset("images/no-internet.png")
          ),
          const SizedBox(height: 30),
          const Text("İnternet bağlantınız yok!"),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: (){_netCheck(context);}, child: const Text("Tekrar Dene"))
        ],
      ),
    ),
  );
}