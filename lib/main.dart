import 'package:flutter/material.dart';
import 'moneyboxs.dart';
import 'package:http/http.dart' as http;
import 'exchangeRate.dart';

void main() {
  runApp(MyApp());
}

// create stless widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Currency Exchange",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late ExchangeRate datafromAPI;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRate();
  }

  Future<ExchangeRate> getRate() async {
    print("Loading Exchang data...");
    var url = Uri.parse(
        "https://v6.exchangerate-api.com/v6/23e4b05d04af4ecc460228f8/latest/USD");
    var response = await http.get(url);
    datafromAPI = exchangeRateFromJson(response.body); //json => dart
    return datafromAPI;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Exchange Rate",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
          future: getRate(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var result = snapshot.data;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    moneyBox("USD", 1 , Colors.lightBlue, 135),
                    SizedBox(height: 10,),
                    moneyBox("AED", result.conversionRates["AED"], Colors.redAccent, 125),
                    SizedBox(height: 10,),
                    moneyBox("AFN", result.conversionRates["AFN"], Colors.greenAccent, 125),
                    SizedBox(height: 10,),
                    moneyBox("ALL", result.conversionRates["ALL"], Colors.orangeAccent, 125),
                    SizedBox(height: 10,),
                    moneyBox("AMD", result.conversionRates["AMD"], Colors.blueAccent, 125),

                  ],
                ),
              );
            }
            return LinearProgressIndicator();
          },
        ));
  }
}
