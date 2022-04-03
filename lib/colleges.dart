import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colleges extends StatefulWidget {
  const Colleges({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CollegeUI'),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      // wrap with safe area
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * (1 / 1.5),
          height: MediaQuery.of(context).size.height * (1 / 2),
          alignment: Alignnment.center,
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth * (1 / 2),
              height: constraints.maxHeight * (1 / 2),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Color(0xFF2f62ba),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceAround,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 10.0,
                  children: const <Widget>[
                    Chip(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text('VT'),
                      ),
                      label: Text('Virginia Tech'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text('ASU'),
                      ),
                      label: Text('Alabama State University'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        child: Text('AC'),
                      ),
                      label: Text('Augustana College'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
