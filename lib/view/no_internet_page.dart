import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NoInternetPage extends StatefulWidget
{
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: Center
      (
        child: Padding
        (
          padding: const EdgeInsets.all(70),
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              const Spacer(),
              Image.asset("images/no-wifi.png"),
              const Spacer(),
              const Text("İnternet bağlantınız yok!"),
              const Spacer(flex: 3),
              ElevatedButton(onPressed: (){}, child: const Text("Tekrar Dene"))
            ],
          ),
        ),
      ),
    );
  }
}