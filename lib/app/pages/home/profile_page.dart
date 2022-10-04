import 'package:flutter/material.dart';

import '../../../domain/entities/user.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  const ProfilePage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),// AppBar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.2, MediaQuery.of(context).size.width * 0.2, MediaQuery.of(context).size.width * 0.2, MediaQuery.of(context).size.width * 0.1),
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(user.avatarImage.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(user.firstName+' '+user.lastName, style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(user.email, style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(user.phone, style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),),
            
          ],
        ),
      ),
    );
  }
}