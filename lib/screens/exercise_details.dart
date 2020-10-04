import 'package:flutter/material.dart';
import 'package:sleepscheduling/constants.dart';
import 'package:fl_chart/fl_chart.dart';

class ExerciseDetails extends StatefulWidget {
  @override
  _ExerciseDetailsState createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
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
        title: Text('Exercise Details', style: kTitleText,),
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
                      Color(0xfffeada6),
                      Color(0xfff5efef),
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
                          'Exercise Duration Data',
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
                  Text('Todays exercise Duration: 100m', style: kNormalText,),
                  Text('Average exercise Duration: 110m', style: kNormalText,),
                  Text('Exercise Duration this week: 117m', style: kNormalText,),
                  Text('Average Exercise Duration last month: 112m', style: kNormalText,),
                  Text('Recommended Exercise Duration > 120m', style: kNormalText,),
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
                  Text('Try exercising close to recommended duration.', style: kNormalText,textAlign: TextAlign.center,),
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
                  Text('Exercises', style: kNormalBoldText,),
                  Text('Look at recommended exercises.', style: kNormalText,textAlign: TextAlign.center,),
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
              return '20m';
            case 2:
              return '40m';
            case 3:
              return '60m';
            case 4:
              return '80m';
            case 5:
              return '100m';
            case 6:
              return '120m';
            case 7:
              return '140m';
            case 8:
              return '160m';
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
    maxY: 8,
    minY: 0,
    lineBarsData: linesBarData1(),
  );
}
List<LineChartBarData> linesBarData1() {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(1,6),
      FlSpot(7,6.5),
      FlSpot(14,8),
      FlSpot(21,5),
      FlSpot(30,7),

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
      FlSpot(1,6),
      FlSpot(7,5),
      FlSpot(14,7.8),
      FlSpot(21,8.0),
      FlSpot(30,5.0),
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
      FlSpot(1,6),
      FlSpot(7,6),
      FlSpot(14,6),
      FlSpot(21,6),
      FlSpot(30,6),
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
              return '20m';
            case 2:
              return '40m';
            case 3:
              return '60m';
            case 4:
              return '80m';
            case 5:
              return '100m';
            case 6:
              return '120m';
            case 7:
              return '140m';
            case 8:
              return '160m';
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
    maxY: 8,
    minY: 0,
    lineBarsData: linesBarData2(),
  );
}
List<LineChartBarData> linesBarData2() {
  return [
    LineChartBarData(
      spots: [
        FlSpot(1,6),
        FlSpot(7,6.5),
        FlSpot(14,8),
        FlSpot(21,5),
        FlSpot(30,7),],
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
        FlSpot(1,6),
        FlSpot(7,5),
        FlSpot(14,7.8),
        FlSpot(21,8.0),
        FlSpot(30,5.0),
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
        FlSpot(1,6),
        FlSpot(7,6),
        FlSpot(14,6),
        FlSpot(21,6),
        FlSpot(30,6),
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

