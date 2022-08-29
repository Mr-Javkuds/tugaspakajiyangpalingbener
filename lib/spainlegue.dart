import 'package:flutter/material.dart';
import 'package:flutter_application_2/Spaindetail.dart';
import 'package:flutter_application_2/listLegueSpain.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class spainlegue extends StatefulWidget {
  const spainlegue({Key? key}) : super(key: key);

  @override
  State<spainlegue> createState() => _spainlegueState();
}

class _spainlegueState extends State<spainlegue> {
  ListLegueSpain? listLegueSpain;
  bool isloaded = true;

  void getleguesapain() async {
    setState(() {
      isloaded = false;
    });
    final res1 = await http.get(
      Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?s=Soccer&c=Spain"),
    );
    print("status code " + res1.statusCode.toString());
    listLegueSpain =
        ListLegueSpain.fromJson(json.decode(res1.body.toString()));
    print("team 0 : " + listLegueSpain!.myteams![0].strTeam.toString());
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getleguesapain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: isloaded == true
              ? ListView.builder(
              itemCount: listLegueSpain!.myteams!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Spaindetail(
                              teams:listLegueSpain!.myteams![index])),
                    );
                  },
                  child: Card(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 20),
                              width: 50,
                              height: 50,
                              child: Image.network(listLegueSpain!.myteams![index].strTeamBadge.toString())),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listLegueSpain!
                                  .myteams![index].strTeam
                                  .toString()),
                              Text(listLegueSpain!
                                  .myteams![index].strStadium
                                  .toString()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
