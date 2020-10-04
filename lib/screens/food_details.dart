import 'package:flutter/material.dart';
import 'package:sleepscheduling/constants.dart';
import 'package:fl_chart/fl_chart.dart';

class FoodDetails extends StatefulWidget {
  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  bool isShowingMainData;

  @override
  void initState(){
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Food Details', style: kTitleText,),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.23,
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                    colors: const[
                      Color(0xff09203f),
                      Color(0xff537895),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(
                          height: 37,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          'Food Data',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 37,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                            child: LineChart(
                              isShowingMainData ? sampleData1() : sampleData2(),
                              swapAnimationDuration: const Duration(milliseconds: 250),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.white.withOpacity(isShowingMainData? 1.0 : 0.5 ),
                      ),
                      onPressed: (){
                        setState(() {
                          isShowingMainData = !isShowingMainData;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
                  width: width-25.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF1a1728),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text('Todays Calorie Count: 3000kCal', style: kNormalText,),
                      Text('Average Calorie Count: 3200kCal', style: kNormalText,),
                      Text('Calorie Count this week: 2998kCal', style: kNormalText,),
                      Text('Average Calorie Count last month: 3100kCal', style: kNormalText,),
                      Text('Recommended Calorie Count > 3000kCal', style: kNormalText,),
                    ],
                  ),
                ),
            SizedBox(height: 20.0,),
            Container(
              width: width-25.0,
              decoration: BoxDecoration(
                color: Color(0xFF1a1728),
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text('Personalized Recommendation', style: kNormalBoldText,),
                  Text('Try getting over the recommended calorie count.', style: kNormalText,textAlign: TextAlign.center,),
                  Text('Sodium intake seems to be excessive.', style: kNormalText,),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              width: width-25.0,
              decoration: BoxDecoration(
                color: Color(0xFF1a1728),
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text('Check How to have a balanced diet.', style: kNormalBoldText,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
LineChartData sampleData1(){
  return LineChartData(
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
      ),
      touchCallback: (LineTouchResponse touchResponse){},
      handleBuiltInTouches: true,
    ),
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        textStyle: const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        margin: 10,
        getTitles: (value) {
          switch (value.toInt()) {
            case 5:
              return 'WEEK 1';
            case 12:
              return 'WEEK 2';
            case 19:
              return 'WEEK 3';
            case 26:
              return 'WEEK 4';
          }
          return '';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 8,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '1000kCal';
            case 2:
              return '2000kCal';
            case 3:
              return '3000kCal';
            case 4:
              return '4000kCal';
            case 5:
              return '5000kCal';
          }
          return '';
        },
        margin: 8,
        reservedSize: 30,
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(
          color: Color(0xff4e4965),
          width: 4,
        ),
        left: BorderSide(
          color: Colors.transparent,
        ),
        right: BorderSide(
          color: Colors.transparent,
        ),
        top: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    minX: 0,
    maxX: 30,
    maxY: 5,
    minY: 0,
    lineBarsData: linesBarData1(),
  );
}
List<LineChartBarData> linesBarData1() {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(1,3.1),
      FlSpot(7,4),
      FlSpot(14,5),
      FlSpot(21,4.1),
      FlSpot(30,4.9),

      // this month data
    ],
    isCurved: true,
    colors: [
      const Color(0xff4af699),
    ],
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
    ),
  );
  final LineChartBarData lineChartBarData2 = LineChartBarData(
    spots: [
      FlSpot(1,4.8),
      FlSpot(7,3.1),
      FlSpot(14,4.0),
      FlSpot(21,3.8),
      FlSpot(30,4.7),
      //Average last month
    ],
    isCurved: true,
    colors: [
      const Color(0xffaa4cfc),
    ],
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x00aa4cfc),
    ]),
  );
  final LineChartBarData lineChartBarData3 = LineChartBarData(
    spots: [
      FlSpot(1,3.5),
      FlSpot(7,3.5),
      FlSpot(14,3.5),
      FlSpot(21,3.5),
      FlSpot(30,3.5),

    ],
    isCurved: true,
    colors: const [
      Colors.red,
    ],
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
    ),
  );
  return [
    lineChartBarData1,
    lineChartBarData2,
    lineChartBarData3,
  ];
}
LineChartData sampleData2() {
  return LineChartData(
    lineTouchData: LineTouchData(
      enabled: false,
    ),
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        textStyle: const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        margin: 10,
        getTitles: (value) {
          switch (value.toInt()) {
            case 5:
              return 'WEEK 1';
            case 12:
              return 'WEEK 2';
            case 19:
              return 'WEEK 3';
            case 26:
              return 'WEEK 4';
          }
          return '';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 8,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '1000kCal';
            case 2:
              return '2000kCal';
            case 3:
              return '3000kCal';
            case 4:
              return '4000kCal';
            case 5:
              return '5000kCal';
          }
          return '';
        },
        margin: 8,
        reservedSize: 30,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        )),
    minX: 0,
    maxX: 30,
    maxY: 5,
    minY: 0,
    lineBarsData: linesBarData2(),
  );
}
List<LineChartBarData> linesBarData2() {
  return [
    LineChartBarData(
      spots: [
        FlSpot(1,3.1),
        FlSpot(7,4),
        FlSpot(14,5),
        FlSpot(21,4.1),
        FlSpot(30,4.9),
      ],
      isCurved: true,
      curveSmoothness: 0,
      colors: const [
        Color(0x444af699),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    ),
    LineChartBarData(
      spots: [
        FlSpot(1,4.8),
        FlSpot(7,3.1),
        FlSpot(14,4.0),
        FlSpot(21,3.8),
        FlSpot(30,4.7),
      ],
      isCurved: true,
      colors: const [
        Color(0x99aa4cfc),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: true, colors: [
        const Color(0x33aa4cfc),
      ]),
    ),
    LineChartBarData(
      spots: [
        FlSpot(1,3.5),
        FlSpot(7,3.5),
        FlSpot(14,3.5),
        FlSpot(21,3.5),
        FlSpot(30,3.5),
      ],
      isCurved: true,
      curveSmoothness: 0,
      colors: const [
        Colors.red,
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(
        show: false,
      ),
    ),
  ];
}

