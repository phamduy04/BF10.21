import 'package:flutter/material.dart';
import 'package:flutter_widget/databases/information_database.dart';
import 'package:flutter_widget/models/information_model.dart';
import 'package:flutter_widget/resources/strings.dart';
import 'package:flutter_widget/resources/widgets/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
class InformationFromSQFliteScreen extends StatefulWidget {
  const InformationFromSQFliteScreen({Key? key}) : super(key: key);

  @override
  _InformationFromSQFliteScreenState createState() => _InformationFromSQFliteScreenState();
}

class _InformationFromSQFliteScreenState extends State<InformationFromSQFliteScreen> {
  final informationDB = InformationDatabase();
  Future<List<InformationModel>>? informationList;

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
        child: FutureBuilder<List<InformationModel>>(
            future: informationList,
            builder: (context, snapshot)
            {
              if(snapshot.hasError) return Center(
                  child: Text("Data got Error!!"));
              if(!snapshot.hasData) return Center(
                  child: CircularProgressIndicator()
              );
              List<InformationModel> informations = snapshot.data!;
              return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: informations.length,
                itemBuilder: (BuildContext context, int index) {
                InformationModel information = informations[index];
                  return Container(
                    height: 50,
                    child: Column(
                      children: [
                        Text(information!.average_mark!),
                        Text(information!.adjustment!)
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              );
            }),
      ),


    );
  }

  getInformation()  {
   informationList = informationDB.fetchAll();
  }
}


