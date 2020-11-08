//import 'dart:html';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //Background
    String bg_image = data['daytime'] ? 'day.jpg' : 'night.jpg';
    Color bg_color = data['daytime'] ? Colors.indigo : Colors.black;


    return Scaffold(
      backgroundColor: bg_color,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/$bg_image'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/Location');
                        setState(() {
                          data= {
                            'time': result['time'],
                            'location': result['location'],
                            'flag': result['flag'],
                            'daytime': result['daytime']
                          };
                        });
                      },
                      icon: Icon(Icons.edit_location,color: Colors.white,),
                      label: Text('Edit Location',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          letterSpacing: 2.0
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 66.0
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
