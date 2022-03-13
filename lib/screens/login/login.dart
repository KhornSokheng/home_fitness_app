import 'package:flutter/material.dart';
import 'package:home_fitness/screens/Reg/reg.dart';
import 'package:home_fitness/screens/menu/launcher.dart';

class loginreg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,50,10,0),
          child: Column(
            children: [
              Image.network(
                'https://st2.depositphotos.com/4366957/6625/i/600/depositphotos_66253287-stock-photo-muscular-bodybuilder-guy-close-up.jpg'
               ),
               SizedBox(

               ),
            SizedBox(
              child: 
              ElevatedButton.icon(
              icon: Icon(Icons.login),
              label : Text("Login in",style: TextStyle(fontSize: 20)),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder:(context){
                    return Launcher();
                })
              );
              },
              ),
            ),
            SizedBox(
               
            ),
            SizedBox(
              child: 
              ElevatedButton.icon(
              icon: Icon(Icons.add),
              label : 
              Text("สร้างบัญชี",style: TextStyle(fontSize: 20)),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder:(context){
                    return Reg();
                })
              );
              },
              ),
            )
            ],
        ),
      )
    );
  }
}