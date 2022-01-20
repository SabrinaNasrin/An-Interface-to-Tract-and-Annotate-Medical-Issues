import 'dart:ffi';

import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  String textnote= '';
      String place1='';
      String place2='';
      String place3='';
      double throbbing = 0.0;
      double shooting = 0.0;
      double stabbing= 0.0;
      double  sharp= 0.0;
      double cramping = 0.0;
      double gnawing = 0.0;
      double burning = 0.0;
      double aching = 0.0;
      double heavy = 0.0;
      double tender = 0.0;
      double splitting = 0.0;
      double tiring = 0.0;
      double sickening = 0.0;
      double fearful = 0.0;
      double punishing= 0.0;
  Preview({Key? key,required this.place1,required this.place2,required this.place3, required this.throbbing,
    required this.shooting,required this.stabbing,required this.sharp,required this.cramping,required this.gnawing,
    required this.burning,required this.aching,required this.heavy,required this.tender,required this.splitting,
    required this.tiring,required this.sickening,required this.fearful,required this.punishing, required this.textnote}) : super(key: key);
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
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Place of pain 1: $place1',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Place of pain 2: $place2',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Place of pain 3: $place3',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Throbbing: $throbbing',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Shooting: $shooting',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Stabbing: $stabbing',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Sharp: $sharp',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Cramping: $cramping',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Gnawing: $gnawing',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Burning: $burning',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Aching: $aching',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Heavy: $heavy',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Tender: $tender',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Splitting: $splitting',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Tiring: $tiring',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Sickening: $sickening',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Fearful: $fearful',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Punishing: $punishing',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              Text('Comment: $textnote',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),





            ],
          ),
        ),
      ),
    );
  }
}

