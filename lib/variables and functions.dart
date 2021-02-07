import 'package:flutter/material.dart';

var date=new DateTime.now().toString();
var dateParse=DateTime.parse(date);

List<String> driveLinks=[];
List<String> assignmentName=[];
List<String> subjectName=[];
List<String> submissionDate=[];
List<String> submissionLink=[];

String studentName;


String getMonthInString(){
  switch(dateParse.month){
    case 1: {return "January";}
    break;
    case 2: {return "February";}
    break;
    case 3: {return "March";}
    break;
    case 4: {return "April";}
    break;
    case 5: {return "May";}
    break;
    case 6: {return "June";}
    break;
    case 7: {return "July";}
    break;
    case 8: {return "August";}
    break;
    case 9: {return "September";}
    break;
    case 10: {return "October";}
    break;
    case 11: {return "November";}
    break;
    case 12: {return "December";}
    break;
  }
  return "";
}
final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);