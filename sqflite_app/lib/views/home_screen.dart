import 'package:flutter/material.dart';
import 'package:flutter_widget/databases/information_database.dart';
import 'package:flutter_widget/models/information_model.dart';
import 'package:flutter_widget/resources/strings.dart';
import 'package:flutter_widget/resources/widgets/information_card.dart';
import 'package:flutter_widget/resources/widgets/text_input_widget.dart';
import 'package:flutter_widget/views/information_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'information_from_sqflite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //1. Tao ra State , gan context vao state
  @override
  _HomeScreenState createState() => _HomeScreenState();
  //2. mounted = true
}

class _HomeScreenState extends State<HomeScreen> {
  //3 khoi tao State
  TextEditingController? mathMarkController, liteMarkController, englishMarkController;
  String averageMarkText = "Not defined" ;
  String adjustmentResult = "Not defined" ;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final informationDB = InformationDatabase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mathMarkController = TextEditingController();
    liteMarkController = TextEditingController();
    englishMarkController = TextEditingController();
  }
  //4. did change dependency - chay ngay sau initstate
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

//5. Ham build
  @override
  Widget build(BuildContext context) {
    if(mounted) print("Widget nay da co state");
    return Scaffold(
      appBar: AppBar(
        title: Text(STUDENT_ADJUSTMENT),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextInputWidget(
                  labelText: "Math Mark",
                  hintText: "Input your Math Mark",
                  controller: mathMarkController!
              ),
              TextInputWidget(
                  labelText: "Litetuare Mark",
                  hintText: "Input your Litetuare Mark",
                  controller: liteMarkController!
              ),
              TextInputWidget(
                  labelText: "English Mark",
                  hintText: "Input your English Mark",
                  controller: englishMarkController!
              ),
              ElevatedButton(
                  onPressed: (){
                   setState(() {
                     averageMarkText = getAverageMarkText(
                         mathMarkText: mathMarkController!.text,
                         liteMarkText: liteMarkController!.text,
                         englishMarkText: englishMarkController!.text);
                     adjustmentResult = getAdjustment(averageMarkText: averageMarkText);
                   });
                   saveInformationToSQFLiteDB(averageMark: averageMarkText, adjustment: adjustmentResult);
                   saveInformation(averageMarkText: averageMarkText, adjustmentResult: adjustmentResult);

                  },
                  child: Text(CONFIRM)),
              InformationCard(averageMark: averageMarkText, adjustmentResult: adjustmentResult),
              TextButton(
                  onPressed: (){
                    var route = MaterialPageRoute(builder: (context)=> InformationFromSQFliteScreen());
                    Navigator.push(context, route);
                  },
                  child: Text("Show Information"))

            ],
          ),
        ),
      ),
    );

  }

  saveInformationToSQFLiteDB({required String averageMark, required String adjustment}) async {
    InformationModel informationModel = InformationModel(id: null, average_mark: averageMark, adjustment: adjustment);
    print("Saving to SQFLite") ;
    await informationDB.addInformation(informationModel);

  }

  saveInformation({ required String averageMarkText, required String adjustmentResult}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("information", "Average Mark: " +  averageMarkText + "\n"
                    + "Adjustment Result: " + adjustmentResult
                   );
  }

  String getAverageMarkText({ required String mathMarkText, required String liteMarkText, required String englishMarkText })
  {
    double averageMark = (double.parse(mathMarkText) + double.parse(liteMarkText) +double.parse(englishMarkText) )/3;
    return averageMark.toStringAsFixed(3);
  }

  String getAdjustment({required String averageMarkText})
  {
    double averageMark = double.parse(averageMarkText);
    if(averageMark < 5) return "Bad Level";
    else if(averageMark < 8) return "Good Level";
    else return "Excellent" ;
  }

  // 6. didUpdateWidget@override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  //7. setState : Chay lai ham build

  //8. deactivate : dung cai State
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
  // 9. dispose : Huy State di
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mathMarkController!.dispose();
    liteMarkController!.dispose();
    englishMarkController!.dispose();
  }
  //10. mounted = false;



}
