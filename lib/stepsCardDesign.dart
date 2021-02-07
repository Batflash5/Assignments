import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'variables and functions.dart';

class CardDesign extends StatefulWidget {
  final int index;
  final bool sub;
  CardDesign({this.index,this.sub});

  @override
  _CardDesignState createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width/20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${subjectName[widget.index]}",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "WorkSans",
              fontWeight: FontWeight.bold,
              fontSize: height/50,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height/10),
            child: Text(
              "${assignmentName[widget.index]}",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Merriweather",
                fontSize: height/50,
              ),
            ),
          ),
          widget.sub?SizedBox(
            height: height/50,
          ):Padding(
            padding: EdgeInsets.only(top: height/100,bottom: height/60),
            child: Text(
              "${submissionDate[widget.index]}",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "WorkSans",
                fontWeight: FontWeight.bold,
                fontSize: height/60,
              ),
            ),
          ),
          RaisedButton(
            elevation: 10,
            textTheme: ButtonTextTheme.primary,
            color: Color(0xFFD71B54),
            onPressed: ()async{
              var url = widget.sub==false?"${driveLinks[widget.index]}":"${submissionLink
              [widget.index]}";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text(
              widget.sub==false?'VIEW ASSIGNMENT':'VIEW SUBMISSION',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "WorkSans",
              ),
            ),
          ),
        ],
      ),
    );
  }
}