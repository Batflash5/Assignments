import 'burnApp.dart';
import 'loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'variables and functions.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final userdata = GetStorage();
  Future<void> getAssignments() async{
    var response;
    try{
      String encodedPassword=Uri.encodeComponent(userdata.read('password'));
      String uri="https://nucleusapi.herokuapp.com/post/?rollno=${userdata.read('username')}&password=$encodedPassword";
      response =await http.get(uri);
      print(encodedPassword);
    }
    catch(error){
      print('Error is {$error}');
      userdata.write('isLogged', false);
      userdata.write('username', '');
      userdata.write('password', '');
      Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
    }
    // var response =await http.get("http://10.0.2.2:5000/post/?rollno=18pw10&password=hariprasath%405");
    // var client = http.Client();
    // var response=await client.get(new Uri.http("));
    if(userdata.read('isLogged')==true){
      var jsonObject=jsonDecode(response.body);

      if(jsonObject['page']=='/login'){
        userdata.write('isLogged', false);
        userdata.write('username', '');
        userdata.write('password', '');
        print('Wrong Password');
        Get.snackbar("Error", "Wrong Roll No / Password",snackPosition: SnackPosition.BOTTOM,animationDuration: Duration(milliseconds: 1100),duration: Duration(milliseconds: 1200),backgroundColor: Color(0xFFD71B54));
        Future.delayed(Duration(milliseconds: 2000),(){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
        });
      }
      else{
        studentName=jsonObject['query']['userDetails']['firstName'];
        if(jsonObject['query']['data'].length==0){
          return;
        }
        for(var links in jsonObject['query']['data']){
          driveLinks.add(links['question']['details']['previewLink']);
          subjectName.add(links['courseName']);
          assignmentName.add(links['title']);
          links['submissions']['submittedOn']!=null?submissionLink.add(links['submissions']['submissionDetails']['details']['previewLink']):submissionLink.add('');
          DateTime dt=DateTime.parse(links['targetDateTime']);
          dt=dt.add(Duration(hours: 05,minutes: 30));
          if(dt.hour>12){
            submissionDate.add('${dt.day}/${dt.month}/${dt.year} - ${dt.hour-12}:${dt.minute.toString().padLeft(2, '0')} PM');
          }
          else{
            submissionDate.add('${dt.day}/${dt.month}/${dt.year} - ${dt.hour}:${dt.minute.toString().padLeft(2, '0')} AM');
          }
        }
        print(driveLinks.length);
        Navigator.push(context,MaterialPageRoute(builder: (context)=>BurnApp()));
      }
    }
    else{
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    getAssignments();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCubeGrid(
        color: Color(0xFFD71B54),
        size: 100,
      ),
    );
  }
}
