import 'package:flutter/material.dart';
import 'package:y/const.dart';
import 'package:y/home_page.dart';
import 'package:y/login_page.dart';
import 'package:y/navigate.dart';

class signUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          Image.asset('assets/mount.png'),
          SizedBox(height: 15,),
          Text('Create your account'),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
              enabledBorder: eBorderInputDecoration,
              focusedBorder: fBorderInputDecoration,
            ),
          ),

          SizedBox(height: 10,),

          TextFormField(
            decoration: InputDecoration(
              hintText: 'Password',
              enabledBorder: eBorderInputDecoration,
              focusedBorder: fBorderInputDecoration,
            ),
          ),
        
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            enabledBorder: eBorderInputDecoration,
            focusedBorder: fBorderInputDecoration,
          ),
        ),

        SizedBox(height: 20,),

        ElevatedButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> NavigationPage()));
        }, child: Text('Sign Up')),


        SizedBox(height: 20,),

        Row(
          children:[
            Text('Already have an account'),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => signIn()));
              },
              child: Text("Sign In", style: TextStyle(color: Colors.blue),)),
          ]
        )

        ],
      ),
    );
  }
}