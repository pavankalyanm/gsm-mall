import 'package:flutter/material.dart';

class SizeChart extends StatefulWidget {
  @override
  _SizeChartState createState() => _SizeChartState();
}

class _SizeChartState extends State<SizeChart> {
  bool inch = true, cm = false;

  _changeSelected(String value) {
    if (value == 'inch') {
      setState(() {
        inch = true;
        cm = false;
      });
    } else {
      setState(() {
        inch = false;
        cm = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SIZE CHART',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Jost',
            fontSize: 18.0,
            letterSpacing: 1.7,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _changeSelected('inch');
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: (inch)
                          ? Border.all(color: Colors.red)
                          : Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      'INCH',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight:
                            (inch) ? FontWeight.bold : FontWeight.normal,
                        fontSize: 15.0,
                        letterSpacing: 1.5,
                        color: (inch) ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  onTap: () {
                    _changeSelected('cm');
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: (cm)
                          ? Border.all(color: Colors.red)
                          : Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      'CM',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: (cm) ? FontWeight.bold : FontWeight.normal,
                        fontSize: 15.0,
                        letterSpacing: 1.5,
                        color: (cm) ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Table(
            border: TableBorder.all(
              color: Colors.black26,
              width: 1,
              style: BorderStyle.solid,
            ),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'SIZE',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.7,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'CHEST',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.7,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'XS',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (inch) ? '33.0' : '83.8',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'S',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (inch) ? '36.3' : '92.2',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'M',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (inch) ? '39.5' : '100.3',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'L',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (inch) ? '42.5' : '108.0',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'XL',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (inch) ? '45.5' : '115.6',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'XXL',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (inch) ? '48.8' : '124.0',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'HOW TO MEASURE YOURSELF',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    letterSpacing: 0.7,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Divider(),

                Image.asset('assets/size_charts.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
