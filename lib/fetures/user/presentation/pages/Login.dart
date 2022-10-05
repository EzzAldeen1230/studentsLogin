import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/fetures/user/presentation/manager/register/register_bloc.dart';
import 'package:student_app/fetures/user/presentation/widet/widet.dart';

import '../../../../injection_container.dart';

class Loginpage extends StatefulWidget {

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textpassword = TextEditingController();
  bool loding=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocProvider(
              create: (context) => sl<RegisterBloc>(),
              child: BlocConsumer<RegisterBloc, RegisterState>(
                listener: (_context, state) {
                  if (state is RegisterError) {
                    print(state.message);
                    setState(() {
                      loding=false;
                    });
                  }

                  if (state is RegisterLoaded) {

                    print(state.message);
                    setState(() {
                      loding=false;
                    });
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) =>
                            Loginpage()), (Route<dynamic> route) => false);
                  }
                },

                builder: (_context, state) {
                  return

                    Center(
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        child: Form(
                        key: formkey,
                        child: ListView(
                          padding: EdgeInsets.all(30),

                          children: [

                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: textEmail,
                              validator: (val) =>
                              val!.isEmpty
                                  ? 'invalid email address'
                                  : null,

                              decoration: kInputDecoration("email"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: textpassword,
                                validator: (val) =>
                                val!.length < 6
                                    ? 'Required at least 6 char'
                                    : null,
                                obscureText: true,

                                decoration: kInputDecoration("password")
                            ),

                            SizedBox(
                              height: 10,
                            ),


                            loding ? Center(child: CircularProgressIndicator()) :
                            kTextButton('login', () {

                              print(textEmail.text.runtimeType);
                              print(textpassword.text.runtimeType);
                              if (formkey.currentState!.validate()) {
                                BlocProvider.of<RegisterBloc>(_context).add(
                                    LoginRequest(email: textEmail.text.toString(), password: textpassword.text.toString()));
                                setState(() {
                                  loding = true;
                                });
                              }
                            }
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("do not have account ?"),
                                GestureDetector(
                                  child: Text("regisrter",
                                    style: TextStyle(color: Colors.blue),),
                                  onTap: () {

                                  },
                                )
                              ],
                            )

                          ],
                        ),
                  ),
                      ),
                    );
                },
              ),
            )
          ],
        ),
      ),
    );
  }}