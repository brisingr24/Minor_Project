import 'indiviual_bar.dart';

class BarData{
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
});

  List<IndiviualBar> barData = [];

  void initializeBarData(){
    barData = [
      IndiviualBar(x: 1, y: monAmount),
      IndiviualBar(x: 2, y: tueAmount),
      IndiviualBar(x: 3, y: wedAmount),
      IndiviualBar(x: 4, y: thurAmount),
      IndiviualBar(x: 5, y: friAmount),
      IndiviualBar(x: 6, y: satAmount),
      IndiviualBar(x: 7, y: sunAmount),
    ];
  }
}