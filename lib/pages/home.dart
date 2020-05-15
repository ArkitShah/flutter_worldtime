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
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[900];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
            )
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
            child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed:() async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.grey,
                  ),
                  label: Text(
                      'Change Location',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 16,
                        letterSpacing: 1.0,
                      ),
                  ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      letterSpacing: 2.5,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                ),
              )
            ],
          )
          ),
        ),
      ),
    );
  }
}
