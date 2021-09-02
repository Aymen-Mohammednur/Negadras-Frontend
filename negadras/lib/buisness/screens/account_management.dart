import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets/label.dart';

class AccManage extends StatelessWidget {
  const AccManage ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 60, 20, 10),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage('assets/images/hacker.jpeg'),
                    fit: BoxFit.fill
                  ),
                
                ),
                
              ),
              Expanded(
                child: Label(
                  label: "Account Management",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0,
                )
                
              )
            ],
          ),
          
          ],

        )

    ),
    );
  }
}