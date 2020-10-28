import 'package:flutter/material.dart';

void main()
{
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: homepage(),
    );
  }
}
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int firstnum;
  int secondnum;
  String result= "";
  String res="";
  String oper;
  void perform(String btnval)
  {
    if(btnval=="C")
    {
      firstnum=0;
      secondnum=0;
      res="";
      result="";
    }
    else if(btnval=='*' || btnval=='+' || btnval == '-'|| btnval =='/')
    {
      firstnum = int.parse(res);
      oper = btnval;
      res="";
    }
    else if(btnval == '=')
    {
      secondnum = int.parse(result);
      if(oper =='*'){
        res = (firstnum*secondnum).toString();
      }
      if(oper =='+'){
        res = (firstnum+secondnum).toString();
      }
      if(oper =='-'){
        res = (firstnum-secondnum).toString();
      }
      if(oper =='/'){
        res = (firstnum/secondnum).toString();
      }
    }
  else
        res = int.parse(res + btnval).toString();
  setState(() {
    result = res;
  });
    

  }
  Widget calbutton(String btnval)
  {
    return Expanded(
      child: OutlineButton(onPressed: () => perform(btnval),
        padding: EdgeInsets.all(25.0),
        child: Text(btnval,
        style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 25.0)
        )

      ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator",
        style: TextStyle(fontFamily: "cursive",
        fontSize: 30.0),
        )
      ),
      body: Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$result",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              calbutton("9"),
              calbutton("8"),
              calbutton("7"),
              calbutton("+"),
              
            ]
          ),
          Row(
            children: <Widget>[
              calbutton("6"),
              calbutton("5"),
              calbutton("4"),
              calbutton("-"),
              
            ]
          ),
          Row(
            children: <Widget>[
              calbutton("3"),
              calbutton("2"),
              calbutton("1"),
              calbutton("*"),
              
            ]
          )
          ,Row(
            children: <Widget>[
              calbutton("C"),
              calbutton("0"),
              calbutton("/"),
              calbutton("="),
              
            ]
          )
        ]
      ),
      )
    );
  }
}