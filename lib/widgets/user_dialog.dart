import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget
{
  const UserAvatar({super.key, this.user});

  final user;

  @override
  Widget build(BuildContext context)
  {
    return Padding
    (
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ClipOval
      (
        child: user.photoURL != null ? Image.network(user.photoURL,fit: BoxFit.fitHeight) :
        Container
        (
          width: 60,
          decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.blueGrey),
          child: Center(child: Text(user.displayName[0].toUpperCase(),
          style: const TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}