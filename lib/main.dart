import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //State class
  int _page = 0; //initialize page index
  GlobalKey _bottomNavigationKey = GlobalKey(); // key for the bottomNavBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Flutter App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
          color: Colors.blueAccent,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                Text(
                  _page.toString(),
                  textScaleFactor: 10.0,
                ),
                RaisedButton(
                  child: Text('Go to page of index 2'),
                  onPressed: () {
                    //Page change using state does the same as clicking index 1 navigation button
                    final CurvedNavigationBarState navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState.setPage(2);
                  },
                )
              ],
            ),
          )),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey, // puting the key that we created before
        color: Colors.white, // this color is the main nav Bar color
        backgroundColor: Colors
            .blueAccent, // this color is the color that will blend with body
        buttonBackgroundColor:
            Colors.white, // this color is the icons background color
        height: 50, // nav bar's height
        items: [
          Icon(
            Icons.home,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.search,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.add,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.list,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.favorite,
            size: 20,
            color: Colors.black,
          ),
        ],
        animationDuration: Duration(milliseconds: 200), //animation duration
        animationCurve: Curves.ease, //animation style
        index: 2, //which index will be selected declared here
        onTap: (index) {
          //Handle button tap
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
