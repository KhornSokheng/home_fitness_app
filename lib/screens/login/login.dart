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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end:Alignment.bottomRight,
            colors: [
              Color(0xFFAAAAAA),
              Color(0xFFBBBBBB),
              Color(0xFFEEEEEE),
            ]
          )
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Image.network(
              "https://s.isanook.com/he/0/rp/rc/w700h366/yacxacm1w0/aHR0cHM6Ly9zLmlzYW5vb2suY29tL2hlLzAvdWQvMC8yNDczL3J1bm5pbmdfMS5qcGc=.jpg"
            ),
              SizedBox(height: 15,),
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
              SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an Account ?",
                style:
                TextStyle(fontWeight:FontWeight.bold,fontSize: 10)),
              SizedBox( height: 15,
                child: ElevatedButton(child: Text("Sign in",style: TextStyle(fontSize: 10)),
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