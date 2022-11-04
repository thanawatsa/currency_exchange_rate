import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//create prototype container
class moneyBox extends StatelessWidget {

  String title;
  double amount;
  Color color;
  double size;

  moneyBox(this.title,this.amount,this.color,this.size);


  @override
  Widget build(BuildContext context) {
    return Container(
      //Balanced
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10)),
      height: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              '${NumberFormat("#,###.##").format(amount)}',
              style: TextStyle(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
