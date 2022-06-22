import 'package:flutter/material.dart';
import 'package:y/arkopage.dart';

import 'dart:ui';

import 'const.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

var mytxt = '', mytxt1 = '';

/////////////////
class MyApp extends StatefulWidget {
  bool passwordObscure = true;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                customtext(
                  hintText: 'email',
                  prefixIcons: Icons.mail,
                  //  suffixIcon: Icons.mail,
                ),
                const SizedBox(
                  height: 32,
                ),
                customtext(
                  prefixIcons: Icons.reddit,
                  hintText: 'username',
                  controller: usernamecontroller,

                  //  suffixIcon: Icons.reddit
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordcontroller,
                    obscureText: widget.passwordObscure,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        enabledBorder: eBorderInputDecoration,
                        focusedBorder: fBorderInputDecoration,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.green,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            widget.passwordObscure
                                ? widget.passwordObscure = false
                                : widget.passwordObscure = true;
                            setState(() {});
                          },
                          icon: widget.passwordObscure
                              ? const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.green,
                                ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      mytxt = usernamecontroller.text.toString();
                      mytxt1 = passwordcontroller.text.toString();
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => arkopage()));
                    print(passwordcontroller.text.toString());
                  },
                  child: Text('login'),
                ),

                Container(
                  child: Column(
                    children: [
                      Container(child: Text(mytxt)),
                      Container(
                        child: Text(mytxt1),
                      )
                    ],
                  ),
                )

                // Container(
                //   child: Textusernamecontroller.text.toString());
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class customtext extends StatelessWidget {
  final String hintText;
  final IconData prefixIcons;
  final IconData? suffixIcon;
  final controller;

  customtext(
      {required this.prefixIcons,
      required this.hintText,
      this.suffixIcon,
      this.controller});

  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: eBorderInputDecoration,
          focusedBorder: fBorderInputDecoration,
          labelText: hintText,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(suffixIcon),
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(prefixIcons),
          ),
        ),
      ),
    );
  }
}
