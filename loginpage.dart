import 'package:firebaseapp/homepage.dart';
import 'package:firebaseapp/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _email;
  String _password;

  Future<void> login() async {
    final formstate = formkey.currentState;


    if(formstate.validate()){
      formstate.save();
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Page")),
      ),

      body: Form(
        key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),

                  keyboardType: TextInputType.emailAddress,

                  onSaved: (input){
                    input = _email;
                  },

                  validator: (input){
                    if(input.isEmpty){
                      return "Input is Empty";
                    }
                    return null;
                  },

                ),
              ),

              Padding(
                  padding: EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password"
                  ),

                  obscureText: true,

                  onSaved: (input){
                    input = _password;
                  },

                  validator: (input){
                    if(input.length<6){
                      return "Password is too low";
                    }
                    return null;
                  },

                ),

              ),

              FlatButton(
                color: Colors.green,
                  onPressed: (){
                  setState(() {
                    login();
                  });
                  },
                  child: Text("Login"),
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an Account?"),
                  SizedBox(width: 10,),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Registerpage()));
                    },
                    child: Text("Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              )


            ],
          )
      ),

    );
  }
}
