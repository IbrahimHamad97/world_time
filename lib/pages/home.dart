import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? 'assets/day.png' : 'assets/night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(bgImage),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
              child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/locations');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'flag': result['flag'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                    };
                  });
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.yellow,
                  primary: Colors.yellow,
                ),
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.red,
                ),
                label: Text(
                  "Go to locations",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ],
          )),
        ),
      )),
    );
  }
}
