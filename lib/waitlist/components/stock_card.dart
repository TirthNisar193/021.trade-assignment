import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/stock.dart';

void showSuccessDialog(BuildContext context, String title, String message,
    Color bgColor, Color glowColor, IconData icon) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        backgroundColor: Colors.grey[800],
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: glowColor,
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: CustomPaint(
                    painter: HexagonPainter(bgColor),
                    child: Center(
                      child: Icon(icon, color: Colors.white, size: 50),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                message,
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
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class StockCard extends StatelessWidget {
  final Stock stock;
  const StockCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => showSuccessDialog(
              context,
              "Modified",
              "You have successfully modified your watchlist. Recently added ${stock.name} ",
              Colors.green,
              Colors.greenAccent.withAlpha(60),
              CupertinoIcons.exclamationmark),
          child: ListTile(
            title: Text(
              stock.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("NSE | EQ", style: TextStyle(fontSize: 12)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${stock.price}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: stock.isNegative ? Colors.red : Colors.green,
                  ),
                ),
                if (stock.change.isNotEmpty)
                  Text(
                    stock.change,
                    style: TextStyle(
                      color: stock.isNegative ? Colors.red : Colors.green,
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey[300]),
      ],
    );
  }
}
