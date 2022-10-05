import 'package:flutter/material.dart';
import 'package:student_app/fetures/user/presentation/pages/Login.dart';
import 'injection_container.dart' as dd;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dd.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Loginpage()
    );
  }
}

