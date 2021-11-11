import 'package:flutter/material.dart';
import 'package:flutter_widget/resources/strings.dart';
import 'package:flutter_widget/resources/widgets/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String>? information;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(STUDENT_INFORMATION),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: FutureBuilder<String>(
            future: information,
            builder: (context, snapshot)
        {
          if(snapshot.hasError) return Center(
              child: Text("Data got Error!!"));
          if(!snapshot.hasData) return Center(
            child: CircularProgressIndicator()
          );
          String informationText = snapshot.data!;
          return Card(
            child: Text(informationText),
          );
        }),
      ),


    );
  }

  getInformation() async {
    information = _prefs.then((pref){
      return pref.getString("information")??"Not defined" ;
    });
  }
}


