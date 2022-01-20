import 'package:flutter/material.dart';

class Male extends StatefulWidget {
  const Male({Key? key}) : super(key: key);

  @override
  _MaleState createState() => _MaleState();
}


class _MaleState extends State<Male> {
  int index = 0;
  bool _head  = false;
  bool _neck  = false;
  bool _chest  = false;
  bool _upperabdomen  = false;
  bool _lowerabdomen  = false;
  bool _leftthigh  = false;
  bool _leftknee  = false;
  bool _leftleg  = false;
  bool _leftfeet = false;
  bool _leftshoulder = false;
  bool _leftelbow = false;
  bool _lefthand = false;
  bool _leftpulm = false;
  bool _rightthigh  = false;
  bool _rightknee  = false;
  bool _rightleg  = false;
  bool _rightfeet = false;
  bool _rightshoulder = false;
  bool _rightelbow = false;
  bool _righthand = false;
  bool _rightpulm = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: Text('Pain Tracker'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white), onPressed: () { Navigator.pop(context); },
        ),
        actions: <Widget>[
          IconButton(onPressed: () => Navigator.pushNamed(context,'/painlevel'), icon: Icon(Icons.arrow_forward_ios),),
        ],

      ),
      body:Stack(
        children: [
        Container(
            //padding: EdgeInsets.fromLTRB(0, 0, 0, ),
            height: double.infinity,
            width: double.infinity,
            child: Image.asset('Assets/Screen Shot 2021-12-15 at 6.52.47 PM.png',
              fit: BoxFit.fill,),
          ),
          //head
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(350.0,20,40,10),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle light when tapped.
                      _head = !_head;
                      index=1;

                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(bottom: 200),
                    // Change button text when light changes state.
                    child: CircleAvatar(
                        backgroundColor: _head ? Colors.red : Colors.transparent,

                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),

                  ),
                ),
              ],
            ),
          ),
          //neck
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(350.0,20,40,80),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _neck = !_neck;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _neck ? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //chest
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(350.0,20,40,120),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _chest= !_chest;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _chest? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //upper abdomen
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(350.0,20,40,160),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _upperabdomen= !_upperabdomen;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _upperabdomen ? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //lower abdomen
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(350.0,20,40,220),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _lowerabdomen = !_lowerabdomen;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _lowerabdomen ? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //left thigh
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(290.0,20,40,290),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _leftthigh = !_leftthigh;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _leftthigh? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //left knee
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(280.0,20,40,370),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _leftknee = !_leftknee;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _leftknee? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //left leg
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(280.0,20,40,440),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _leftleg = !_leftleg;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _leftleg ? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //left feet
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(260.0,20,40,520),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _leftfeet = !_leftfeet;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _leftfeet? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //right thigh
          Container(

            //alignment: FractionalOffset.topCenter,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(160.0,30,60,650),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _rightthigh= !_rightthigh;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _rightthigh? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //right knee
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(280.0,20,200,370),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _rightknee = !_rightknee;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _rightknee? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //right leg
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(280.0,20,400,440),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _rightleg = !_rightleg;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _rightleg? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
         //right feet
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(260.0,20,400,520),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _rightfeet = !_rightfeet;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _rightfeet ? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          // left shoulder
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(250.0,30,40,80),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _leftshoulder = !_leftshoulder;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _leftshoulder ? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //left elbow
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(150.0,20,60,150),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _leftelbow= !_leftelbow;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _leftelbow ? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //left hand
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(120.0,20,40,180),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _lefthand = !_lefthand;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _lefthand? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //left pulm
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(70.0,20,40,230),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _leftpulm = !_leftpulm;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _leftpulm? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          // right elbow
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(220.0,20,60,350),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _rightelbow = !_rightelbow;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _rightelbow ? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //right shoulder
          Container(
            alignment: FractionalOffset.topCenter,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(170.0,0,60,230),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _rightshoulder= !_rightshoulder;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _rightshoulder? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //right hand
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(230.0,0,70,420),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _righthand = !_righthand;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _righthand ? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          //right pulm
          Container(
            //alignment: FractionalOffset.topCenter,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(230.0,0,110,500),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _rightpulm = !_rightpulm;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: CircleAvatar(backgroundColor: _rightpulm ? Colors.red : Colors.transparent,
                        radius: 7,
                        child: Text('1',style: TextStyle(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),





        ],
      ),





       );


  }


  }


