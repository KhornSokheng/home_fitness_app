import 'package:flutter/material.dart';
import 'package:home_fitness/screens/Reg/reg.dart';
import 'package:home_fitness/screens/menu/launcher.dart';

class loginreg extends StatefulWidget {
  @override
  State<loginreg> createState() => _loginregState();
}

class _loginregState extends State<loginreg> {
 final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("E-mail : ",style: TextStyle(fontSize: 20)),
              TextFormField(),
              SizedBox(height: 15,),
              Text("Password : ",style: TextStyle(fontSize: 20)),
              TextFormField(
                obscureText: true,
              ),
               SizedBox(
                 height: 15,),
              SizedBox(
                child: ElevatedButton(child: Text("Login"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                  builder:(context){
                    return Launcher();
                  })
                  );
                
                },
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an Account ?",
                style:
                TextStyle(fontWeight:FontWeight.bold,fontSize: 10)),
              SizedBox(
                child: ElevatedButton(child: Text("Login",style: TextStyle(fontSize: 5)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                  builder:(context){
                    return reg();
                  })
                  );
                },
                ),
              ),
              ],
            )
            ],
         
            ),
            ),
            ),
            

      ),
    );
  }
}