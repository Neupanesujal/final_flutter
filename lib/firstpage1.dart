import 'package:flutter/material.dart';
import 'package:y/login_page.dart';

class startPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 113, 195, 234),
    body: 
     Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Image.asset('assets/mount.png'),
                SizedBox(height: 50,),
                ElevatedButton(onPressed:(){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  signIn()),
                  );
                } ,
                 child: Container(
                  width: double.infinity,
                  child: Text("login",textAlign: TextAlign.center,),
                  color: Colors.blue),
                        
                 ),
               
               SizedBox(height: 10,),
                 ElevatedButton(onPressed:(){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  signIn()),
                  );
                } ,
                 child: SizedBox(
                  width: double.infinity,

                  child: Text("login",textAlign: TextAlign.center,)
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white60,
                  ), 
                 )


          ],
          ),
     ),
    );
  }
}