import 'package:flutter/material.dart';

class ChartElement extends StatefulWidget {
  String title;
  double count;
  double procentCount;

  ChartElement({
    Key? key,
    required this.title,
    required this.count,
    required this.procentCount,
  }) : super(key: key);

  @override
  _ChartElementState createState() => _ChartElementState();
}

class _ChartElementState extends State<ChartElement> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          FittedBox(
            child: Text("${widget.count.toStringAsFixed(2)} руб."),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 10,
              height: 60,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: widget.procentCount,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(widget.title)
        ],
      ),
    );
  }
}
