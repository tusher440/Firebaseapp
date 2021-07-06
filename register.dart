import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registerpage extends StatefulWidget {
  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _email;
  String _password;

  Future<void> register() async {

    final formstate = formkey.currentState;

    if(formstate.validate()){
      formstate.save();

       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Register Page")),
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
                    register();
                  });
                },
                child: Text("Register"),
              ),

              SizedBox(height: 20,),




            ],
          )
      ),

    );
  }
}
