import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../common/widget/subject-card.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Àreas de estudo"),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white
              ),
              onPressed: () {
                const storage = FlutterSecureStorage();
                storage.delete(key: "jwt");
                Modular.to.navigate("/auth/sign-in");
              },
              child: const Text('Logout', style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Modular.to.navigate('/programs/1'),
                child: SubjectCard(imgPath: 'lib/assets/images/feature/mechanic.png', text: 'Mecânica',)
              ),
              SizedBox(height: 16.0),
              SubjectCard(imgPath: 'lib/assets/images/feature/light.png', text: 'Elétrica                                   EM BREVE'),
              SizedBox(height: 16.0),
              SubjectCard(imgPath: 'lib/assets/images/feature/termometer.png', text: 'Termodinâmica                    EM BREVE'),
              SizedBox(height: 16.0),
              SubjectCard(imgPath: 'lib/assets/images/feature/optical.png', text: 'Óptica                                     EM BREVE'),
            ],
          ),
        )
      )
    );
  }

}