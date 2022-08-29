import 'package:flutter/material.dart';
import 'package:flutter_application_2/PremiereLeagueModel.dart';
import 'package:flutter_application_2/listLegueSpain.dart';
import 'dart:convert';
import 'asset.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class Spaindetail extends StatefulWidget {

  Spaindetail({Key? key, required this.teams}) : super(key: key);
  Teamsku teams;

  @override
  State<Spaindetail> createState() => _SpaindetailState();
}

class _SpaindetailState extends State<Spaindetail> {

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Club"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                widget.teams.strTeamBadge.toString(),
                width: 200,
                height: 250,
              ),
              Container(
                padding: EdgeInsets.all(20),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text("Name Club : " + widget.teams .strTeam.toString(),textAlign: TextAlign.left,),
                    Text("\nFormed Year: " + widget.teams.intFormedYear.toString(),textAlign: TextAlign.left,),
                    Text("\nStadion Name: "+widget.teams.strStadium.toString(),textAlign: TextAlign.left,),
                    Text("\nStadion Capacity: "+widget.teams.intStadiumCapacity.toString(),textAlign: TextAlign.left,),
                    Text("\nSocial Media:"),
                    Container(


                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          Column(

                            children: [
                              IconButton(onPressed: (){
                                var myUrl = "https://" + widget.teams.strTwitter.toString();
                                _launchInBrowser(myUrl);
                              },
                                  icon: SvgPicture.asset(twitter)),
                              Text("Twitter")
                            ],
                          ),

                          Column(
                            children: [
                              IconButton(onPressed: (){
                                var myUrl = "https://" + widget.teams.strWebsite.toString();
                                _launchInBrowser(myUrl);
                              },

                                icon: Icon(Icons.web_sharp),),
                              Text("Website")
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(onPressed: (){
                                var myUrl = "https://" + widget.teams.strFacebook.toString();
                                _launchInBrowser(myUrl);
                              },
                                  icon: Image.asset("lib/img/Facebook.png")),
                              Text("Facebook")
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(onPressed: (){
                                var myUrl = "https://" + widget.teams.strInstagram.toString();
                                _launchInBrowser(myUrl);
                              },
                                  icon: Image.asset("lib/img/instagram.png")),
                              Text("Instagram")
                            ],
                          ),
                        ],
                      ),
                    ),


                    Text("\nStadion Description"),
                    Text(""),
                    Text(widget.teams.strStadiumDescription.toString(),textAlign: TextAlign.left,),
                    Text("\nClub Description", textAlign: TextAlign.left,),
                    Text(""),
                    Text(widget.teams.strDescriptionEN.toString(), textAlign: TextAlign.left,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
