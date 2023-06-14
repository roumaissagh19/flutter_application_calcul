 // ignore_for_file: unused_import, camel_case_types, unrelated_type_equality_checks

 import 'package:flutter/material.dart';
 void main(){
  runApp(Myapp());
 }
 class Myapp  extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calcul(),
    );
  }
}
 class calcul extends StatefulWidget {
  @override
  State<calcul> createState() => _calculState();
}
class _calculState extends State<calcul> {
  String result='0';
  String finalresult='0';
  double num1=0.0;
  double num2=0.0;
  String opr='';
  buttonpressed(String btnval){
    if (btnval=='AC'){
      finalresult='0';
      num1=0.0;
      num2=0.0;
      opr='';
    }else if(btnval=='+'||btnval=='-'||btnval=='*'||btnval=='/'){
      num1=double.parse(result);
      opr=btnval;
      finalresult='0';
      result=result+btnval;
    }else if(btnval=='.'){
      if(finalresult.contains('.')){

      }else{
        finalresult=finalresult+btnval;
      }

    }else if(btnval=='+/-'){
      if(result.toString().contains('-')){
        result.toString().substring(1);
        finalresult=result;
      }else{
        result='-'+result;
        finalresult=result;

      }

    }else if(btnval=='%'){
      num2=double.parse(result);
      finalresult=(num2/100).toString();
    }else if(btnval=='='){
     num2=double.parse(result);
     if(opr=='+'){
     finalresult=(num1+num2).toString();
     }
     if(opr=='-'){
     finalresult=(num1-num2).toString();
     }
     if(opr=='/'){
     finalresult=(num1/num2).toString();
     }
     if(opr=='*'){
     finalresult=(num1*num2).toString();
     }
    }else{
      finalresult=finalresult+btnval;
    }

setState(() {
  result= double.parse(finalresult).toString();
});
  }

  
  Widget button(String text,Color textcolo,Color backgroundbutton){
    
    if(text!='='){
       return Container(
      child: RawMaterialButton(
        onPressed:() {
              buttonpressed(text);
        },
        shape:CircleBorder(),
        padding: EdgeInsets.all(8),
        fillColor: backgroundbutton,
        child:Text(text ,
        style: TextStyle(
          fontSize: 40,
          color:  textcolo
        ),),
      ),

    );

    }else{
       return Container(
      child: RawMaterialButton(
        onPressed:() {
           buttonpressed(text);
        },
        shape:StadiumBorder(),
        padding: EdgeInsets.fromLTRB(20, 10, 145, 10),
        fillColor: backgroundbutton,
        child:Text(text ,
        style: TextStyle(
          fontSize: 35,
          color:  textcolo
        ),),
      ),

    );

    }
  }
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 189, 155, 166),
      appBar: AppBar(
        title: Text('calculator roumaissa :)'),
        backgroundColor:Color.fromARGB(255, 88, 49, 83),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('$finalresult',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 50,
                ),
                )
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:<Widget> [
              button('AC',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('+/-',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('%',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('/',Color.fromARGB(255, 88, 49, 83),Colors.white),
                 
             ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:<Widget> [
              button('7',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('8',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('9',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('*',Color.fromARGB(255, 88, 49, 83),Colors.white),
                 
             ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:<Widget> [
              button('4',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('5',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('6',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('-',Color.fromARGB(255, 88, 49, 83),Colors.white),
                 
             ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:<Widget> [
              button('1',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('2',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('3',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('+',Color.fromARGB(255, 88, 49, 83),Colors.white),
                 
             ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:<Widget> [
              
              button('0',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('.',Colors.white,Color.fromARGB(255, 88, 49, 83)),
              button('=',Colors.white,Color.fromARGB(255, 88, 49, 83)),
             ],
            ),
          ],
        ),
      ),
    );
  }
}