import 'package:flutter/material.dart';
import 'package:sleepscheduling/constants.dart';
import 'package:fl_chart/fl_chart.dart';

class TemperatureDetails extends StatefulWidget {
  @override
  _TemperatureDetailsState createState() => _TemperatureDetailsState();
}

class _TemperatureDetailsState extends State<TemperatureDetails> {
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
        title: Text('Body Temperature Details', style: kTitleText,),
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
                      Color(0xffB7F8DB ),
                      Color(0xff50A7C2),
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
                          'Body Temperature',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
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
                  Text('Todays Body Temperature: 100°F', style: kNormalText,),
                  Text('Average Body Temperature: 97.4°F', style: kNormalText,),
                  Text('Body Temperature this week: 97°F', style: kNormalText,),
                  Text('Average Body Temperature last month: 99°F', style: kNormalText,),
                  Text('Normal Body temperature > 97.4°F', style: kNormalText,),
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
                  Text('Your body looks hotter than average.', style: kNormalText,textAlign: TextAlign.center,),
                  Text('Try Hydrating or turning temperature down.', style: kNormalText,),
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
                  Text('Check How Temperature affects sleep.', style: kNormalBoldText,),
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
          fontSize: 14,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '94°F';
            case 2:
              return '96°F';
            case 3:
              return '98°F';
            case 4:
              return '100°F';
            case 5:
              return '102°F';
            case 6:
              return '104°F';
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
    maxY: 6,
    minY: 0,
    lineBarsData: linesBarData1(),
  );
}
List<LineChartBarData> linesBarData1() {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(1,3),
      FlSpot(7,4.1),
      FlSpot(14,4.6),
      FlSpot(21,3.2),
      FlSpot(30,5.2),

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
      FlSpot(1,3.5),
      FlSpot(7,5),
      FlSpot(14,5.1),
      FlSpot(21,5.2),
      FlSpot(30,4.0),
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
      FlSpot(1,4.5),
      FlSpot(7,4.5),
      FlSpot(14,4.5),
      FlSpot(21,4.5),
      FlSpot(30,4.5),
      //recommended
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
          fontSize: 14,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '94°F';
            case 2:
              return '96°F';
            case 3:
              return '98°F';
            case 4:
              return '100°F';
            case 5:
              return '102°F';
            case 6:
              return '104°F';
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
    maxY: 6,
    minY: 0,
    lineBarsData: linesBarData2(),
  );
}
List<LineChartBarData> linesBarData2() {
  return [
    LineChartBarData(
      spots: [
        FlSpot(1,3),
        FlSpot(7,4.1),
        FlSpot(14,4.6),
        FlSpot(21,3.2),
        FlSpot(30,5.2),
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
        FlSpot(1,3.5),
        FlSpot(7,5),
        FlSpot(14,5.1),
        FlSpot(21,5.2),
        FlSpot(30,4.0),
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
        FlSpot(1,4.5),
        FlSpot(7,4.5),
        FlSpot(14,4.5),
        FlSpot(21,4.5),
        FlSpot(30,4.5),
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
