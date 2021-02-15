import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import 'check.dart';

class RazorpayPage extends StatefulWidget {
  String specialityName;
  int amount;
  RazorpayPage({this.specialityName, this.amount});

  @override
  _RazorpayPageState createState() => _RazorpayPageState();
}

class _RazorpayPageState extends State<RazorpayPage> {

  String jwtToken;
  getJwtTokenValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwtTokenValue = prefs.getString('jwtTokenValue') ?? '' ;
    setState(() {
      jwtToken = jwtTokenValue;
    });
    return jwtTokenValue;
  }
  @override
  void initState() {
    getJwtTokenValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Payment Page'),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  primaryColor,
                  Colors.pink
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        padding: const EdgeInsets.all(30.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.specialityName,textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("AMOUNT TO PAY  -   ${widget.amount}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 80.0),
             /*   FutureBuilder(
                  future: getPatientDetails(jwtToken),
                  // ignore: missing_return
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(snapshot.connectionState == ConnectionState.done){
                      return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text( "Phone No  -  "+ snapshot.data.phoneNo.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text( "Email  -  "+ snapshot.data.email),
                            ),
                            SizedBox(height: 50,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.white,
                                  textColor: Colors.pink.withOpacity(0.8),
                                  child: Text("CANCEL"),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.pink.withOpacity(0.8),
                                  textColor: Colors.white,
                                  child: Text("P A Y"),
                                  onPressed: (){
                                    getPatientDetails(jwtToken);
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => CheckRazor(
                                            speciality: widget.specialityName,amount: widget.amount,
                                            email: snapshot.data.email, phnNo: snapshot.data.phoneNo,
                                          ),
                                        )
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                    }else if(snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator(backgroundColor: primaryColor,);
                    }
                  },
                )
                */
              ],),
          ),
        ),
      ),
    );
  }
}
/*
 */