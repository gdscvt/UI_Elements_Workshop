import 'package:flutter/material.dart';

import 'college.dart';

void main() {
  //Need Material App to get MediaQuery Data
    runApp(MaterialApp(
      /* InitialRoute is the first route that is loaded
         Route mapping behaves like a Do-While loop
      */
      initialRoute: '/home',
        // Route is a string that acts like a code
        // to run widget
        routes: {
          '/home': (context) => const Home()

        },
    ));
}

class Home extends StatefulWidget{
    const Home({Key? key}) : super(key: key);

    @override
    _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home>{
  final collegeNameContr = TextEditingController();
  final collegeInitialsContr = TextEditingController();
  List<College> listOfColleges = [];
  final ScrollController controller = new ScrollController();

  @override
  void initState(){
      super.initState();
  }

  void addCollege(String collegeName, String collegeID) {
    setState(() {
      listOfColleges.add(College(
          collegeName: collegeName,
          collegeID: collegeID));
    });
  }
  Future alert(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        title: const Text('Fill In Both Fields'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ok');
            },
            child: const Text('Ok'),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold has appBar and body attributes
    return Scaffold(
        //appBar is red bar at top of screen
        appBar: AppBar(
            centerTitle: true,
            title: const Text("College List"),
            backgroundColor: Colors.red,
            actions: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*(1/6),
                child: Builder(builder: (BuildContext context){
                  return IconButton(onPressed: () {
                    setState(() {
                      listOfColleges.removeLast();
                    });
                  }, icon: Icon(
                    Icons.delete
                  ));
                },)
              )
            ],
        ),
        //Body is below the app bar on screen
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width*(1/1.25),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter College Name",
                      ),
                      controller: collegeNameContr,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width*(1/1.25),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter College Initials",
                      ),
                      controller: collegeInitialsContr,
                    ),
                  ),
                  RaisedButton(
                      child: const Text('Add College'),
                      onPressed: () {
                          if(collegeNameContr.text != "" && collegeInitialsContr.text != ""){
                          addCollege(collegeNameContr.text, collegeInitialsContr.text);
                          }
                          else{
                              setState(() {
                              alert(context);
                              });
                          }
                        }
                  ),

                ],
              ),
                ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: listOfColleges.length,
                    reverse: true,
                    itemBuilder: (context, index){
                  return ListTile(
                    title: Text(listOfColleges[index].collegeID + ' ' + listOfColleges[index].collegeName),
                  );
                }
                ),
              ],
          ),
          ),
        ),
    );
  }





    
}