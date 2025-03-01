import 'package:flutter/material.dart';
import 'dart:math';

/*   
instrument string like compoany name  =
product is string cnc,intraday,nrml   =
entry side is buy or sell             =
type stoploss or limit                =
ltp is double                         =
exit trigger, exit limit is double,   =
qty is int, 
pnl decimal pnl% 0-100 , 
status is rejected executed.
*/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConfirmationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Start a 60-second timer
    // Future.delayed(Duration(seconds: 30), () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => MyHomePage()),
    //   );
    // });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 32, 57, 87),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                Center(
                    child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0xff549290),
                        blurRadius: 2,
                        spreadRadius: 2),
                  ], borderRadius: BorderRadius.circular(50)),
                  child:
                      Icon(Icons.error_outline, color: Colors.green, size: 80),
                )),
                SizedBox(height: 20),
                Text("Error",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Your Order for 1xReliance is not placed",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 96, 39, 253),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Text('Close',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => showSuccessDialog(context),
              child: Text("Show Dialog"),
            ),
          ),
        ],
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: Colors.grey[800], // Dark gray background
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Hexagon with Glow Effect
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.greenAccent.withOpacity(0.6), // Glow color
                        blurRadius: 20, // Glow spread
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: CustomPaint(
                    size: Size(70, 70), // Size of the hexagon
                    painter: HexagonPainter(Colors.green[400]!),
                    child: Center(
                      child: Icon(Icons.check, color: Colors.white, size: 35),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Success",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Your Order for 1xReliance is placed",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text("Close", style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// 🎨 Custom Painter for Hexagonal Shape
class HexagonPainter extends CustomPainter {
  final Color color;
  HexagonPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final Path path = Path();

    double width = size.width;
    double height = size.height;
    double x = width / 2;
    double y = height / 2;
    double radius = width / 2;

    for (int i = 0; i < 6; i++) {
      double angle = pi / 3 * i;
      double dx = x + radius * cos(angle);
      double dy = y + radius * sin(angle);
      if (i == 0) {
        path.moveTo(dx, dy);
      } else {
        path.lineTo(dx, dy);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
