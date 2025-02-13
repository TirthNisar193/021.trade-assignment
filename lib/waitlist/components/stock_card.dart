import 'package:flutter/material.dart';
import '../model/stock.dart';

class StockCard extends StatelessWidget {
  final Stock stock;
  const StockCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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
        Divider(color: Colors.grey[300]),
      ],
    );
  }
}
