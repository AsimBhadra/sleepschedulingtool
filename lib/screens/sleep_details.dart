import 'package:flutter/material.dart';
import 'package:sleepscheduling/constants.dart';
import 'package:fl_chart/fl_chart.dart';

class SleepDetails extends StatefulWidget {
  @override
  _SleepDetailsState createState() => _SleepDetailsState();
}

class _SleepDetailsState extends State<SleepDetails> {
  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Sleep Details',
          style: kTitleText,
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                    colors: const [
                      Color(0xff2c274c),
                      Color(0xff46426c),
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
                          'Sleep Data',
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
                            padding:
                                const EdgeInsets.only(right: 16.0, left: 6.0),
                            child: LineChart(
                              isShowingMainData ? sampleData1() : sampleData2(),
                              swapAnimationDuration:
                                  const Duration(milliseconds: 250),
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
                        color: Colors.white
                            .withOpacity(isShowingMainData ? 1.0 : 0.5),
                      ),
                      onPressed: () {
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
            Column(
                children: [
                  Container(
                      width: width-25.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1a1728),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text('Todays sleep Duration: 8h 12m', style: kNormalText,),
                          Text('Average sleep Duration: 7h 10m', style: kNormalText,),
                          Text('Sleep Duration this week: 8h 2m', style: kNormalText,),
                          Text('Average sleep Duration last month: 7h 12m', style: kNormalText,),
                          Text('Recommended Sleep Duration > 8h', style: kNormalText,),
                          Text('Average Bed time: 22:30', style: kNormalText,),
                          Text('Average Wakeup time: 6:16', style: kNormalText,),
                        ],
                      ),
                  ),
                ],
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
                  Text('Maintain constant sleep duration you seem to have uneven sleep duration.', style: kNormalText,textAlign: TextAlign.center,),
                  Text('Trying going to bed at same time everyday.', style: kNormalText,),
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
                  Text('How to Improve Sleep?', style: kNormalBoldText,),
                  Text('Maintaining constant sleep and wake hours.', style: kNormalText,),
                  Text('Maintaining constant duration of Sleep', style: kNormalText,),
                  Text('Usage of Ear Plugs', style: kNormalText,),
                  Text('Minimization of usage of digital devices', style: kNormalText,),
                  Text('Usage of Blue Light filter and LEDs', style: kNormalText,),
                ],
              ),
            ),

          ],

        ),
      ),
    );
  }
}

LineChartData sampleData1() {
  return LineChartData(
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
      ),
      touchCallback: (LineTouchResponse touchResponse) {},
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
              return '1H';
            case 2:
              return '2H';
            case 3:
              return '3H';
            case 4:
              return '4H';
            case 5:
              return '5H';
            case 6:
              return '6H';
            case 7:
              return '7H';
            case 8:
              return '8H';
            case 9:
              return '9H';
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
    maxY: 9,
    minY: 0,
    lineBarsData: linesBarData1(),
  );
}

List<LineChartBarData> linesBarData1() {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(1, 7),
      FlSpot(7, 6.5),
      FlSpot(14, 8.1),
      FlSpot(21, 8.0),
      FlSpot(
        30,
        9,
      )

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
      FlSpot(1, 6.2),
      FlSpot(7, 5.5),
      FlSpot(14, 9),
      FlSpot(21, 8.0),
      FlSpot(30, 5.0),
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
      FlSpot(1, 8),
      FlSpot(7, 8),
      FlSpot(14, 8),
      FlSpot(21, 8),
      FlSpot(30, 8),
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
              return '1H';
            case 2:
              return '2H';
            case 3:
              return '3H';
            case 4:
              return '4H';
            case 5:
              return '5H';
            case 6:
              return '6H';
            case 7:
              return '7H';
            case 8:
              return '8H';
            case 9:
              return '9H';
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
    maxY: 9,
    minY: 0,
    lineBarsData: linesBarData2(),
  );
}

List<LineChartBarData> linesBarData2() {
  return [
    LineChartBarData(
      spots: [
        FlSpot(1, 7),
        FlSpot(7, 6.5),
        FlSpot(14, 8.1),
        FlSpot(21, 8.0),
        FlSpot(
          30,
          9,
        )
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
        FlSpot(1, 6.2),
        FlSpot(7, 5.5),
        FlSpot(14, 9),
        FlSpot(21, 8.0),
        FlSpot(30, 5.0),
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
        FlSpot(1, 8),
        FlSpot(7, 8),
        FlSpot(14, 8),
        FlSpot(21, 8),
        FlSpot(30, 8),
      ],
      isCurved: true,
      curveSmoothness: 0,
      colors: const [
        Color(0x4427b6fc),
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
