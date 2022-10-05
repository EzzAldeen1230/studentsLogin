
import 'package:flutter/material.dart';
InputDecoration kInputDecoration(String label){
  return InputDecoration(
      labelText:label,
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.black))
  );
}


TextButton kTextButton(String name,Function onPressed){

  return   TextButton(
    onPressed: () {

      return onPressed();
    },
    child: Text(name,style: TextStyle(color: Colors.white),),
    style:ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 10))
    ) ,
  );
}

//

Row kloginRegisterHint(String text, String label ,Function onTap){

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
        child: Text(label,style: TextStyle(color: Colors.blue),),
        onTap: (){

        },
      )
    ],
  );

}