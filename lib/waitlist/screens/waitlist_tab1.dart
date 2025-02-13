import 'package:flutter/material.dart';
import '../components/stock_card.dart';
import '../model/stock.dart';

class WatchlistTab extends StatelessWidget {
  const WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<Stock> stocks = [
      Stock(name: "RELIANCE", price: '3,000.00', change: "+5.35 (+0.12%)", isNegative: false),
      Stock(name: "MRF", price: '1,23,000.00', change: "-300.35 (-0.21%)", isNegative: true),
      Stock(name: "TATAINVEST", price: '3,600.00', change: "+15.35 (+0.18%)", isNegative: false),
      Stock(name: "TATASTEEL", price: '1,600.00', change: "+5.35 (+0.12%)", isNegative: false),
      Stock(name: "ADANIENT", price: '3,500.00', change: "+1.60 (+0.06%)", isNegative: false),
      Stock(name: "PAYTM", price: '500.00', change: "-5.35 (-0.12%)", isNegative: true),
      Stock(name: "NYKAA", price: '1000.00', change: "+8.95 (+0.08%)", isNegative: false),
      Stock(name: "ASIANPAINT", price: '3,000.00', change: "", isNegative: true),
    ];

    return ListView.builder(
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        return StockCard(stock: stocks[index]);
      },
      shrinkWrap:true,
    );
  }
}
