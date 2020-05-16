import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String serverResponse = 'Server response';
  
  int r2 = 0;

  void _onPress() {
    _makeGetRequest();
  }

  @override
  Widget build(BuildContext context) {
  
  //simple homescreen
    return Container(
      //color: Color(0xFF022d49),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF022d49),
        Color(0xFF021d30),
      ])),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Text(
              "Control ESP8266",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Divider(
              color: Colors.white70,
            ),
            SizedBox(
              height: 30,
            ),
            //first  BUTTON
          
            Container(
              width: 200,
              height: 50,
              child: OutlineButton(
                child: Text(
                  r2 % 2 == 0 ? "OFF" : "ON",
                  style: TextStyle(
                      color: r2 % 2 == 0 ? Colors.yellowAccent : Colors.green,
                      fontSize: 18),
                ),
                onPressed: () {
                  print('Button is clicked');
                  _onPress();//calling _onPress function when button clicked
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                borderSide: BorderSide(
                  color: r2 % 2 == 0
                      ? Colors.yellowAccent
                      : Colors.green, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
              ),
            ), //
          ],
        ),
      ),
    );
  }
  //requesting ESP server 

  _makeGetRequest() async {
    Response response = await get(r2 % 2 == 0
        ? "http://127.0.0.1/LED=OFF"    //replace ip address here 
		                                //you can get ip address from arduino terminal
        : "http://127.0.0.1/LED=ON");
    r2++;
    setState(() {
      serverResponse = response.body;
    });
  }
}
