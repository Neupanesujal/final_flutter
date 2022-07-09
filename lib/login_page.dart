import 'package:flutter/material.dart';
import 'package:y/const.dart';
import 'package:y/home_page.dart';
import 'package:y/signup_page.dart';
import 'package:y/navigate.dart';

class signIn extends StatelessWidget {
  
 bool? isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Image.asset('assets/mount.png'),
          SizedBox(height: 20,),
          Text('Login to your account',
          textAlign: TextAlign.left,),
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
          
          Row(
            children: <Widget>[
              Checkbox(value: isChecked, 
              onChanged:(value){
                isChecked=value;
              }),
              Text('Remember me'),
              Spacer(),
              Text('Forgot password?  ',style: TextStyle(color: Colors.blue),),
            ],
          ),
         ElevatedButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage()));
         },
          child: Text('Sign In')
          ),

         SizedBox(height: 50,),
         
         Row(
          children: [
             Text("Don't have an account?"),
             GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => signUp()));
              },
              child: Text('Sign Up',style: TextStyle(color: Colors.blue),))
          ],
         )
         
        ],
      ),
    );
  }
}