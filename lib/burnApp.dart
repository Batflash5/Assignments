import 'loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'iconBut.dart';
import 'variables and functions.dart';
import 'stepsCardDesign.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class BurnApp extends StatefulWidget {
  @override
  _BurnAppState createState() => _BurnAppState();
}

class _BurnAppState extends State<BurnApp> {

  bool sub=false;

  @override
  void initState(){
    super.initState();
  }

  final userdata = GetStorage();

  bool checkLinkExists(int i){
    if(submissionLink[i]=='' && sub==true){
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:false,
        extendBodyBehindAppBar: true,
        drawer: Drawer(
          child: ListView(
            children: [
              Image(
                image: AssetImage("images/assignmentalert.png"),
              ),
              SizedBox(
                height: height/30,
              ),
              ListTile(
                onTap: (){
                  setState(() {
                    sub=false;
                  });
                  Get.back();
                },
                leading: Icon(
                    Icons.assignment_rounded
                ),
                title: Text(
                  "Assignments",
                  style: TextStyle(
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
              ListTile(
                onTap: (){
                  setState(() {
                    sub=true;
                  });
                  Get.back();
                },
                leading: Icon(
                    Icons.done
                ),
                title: Text(
                  "Submissions",
                  style: TextStyle(
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
              ListTile(
                onTap: (){
                  userdata.write('isLogged', false);
                  userdata.write('username', '');
                  userdata.write('password', '');
                  driveLinks=[];
                  assignmentName=[];
                  subjectName=[];
                  submissionDate=[];
                  submissionLink=[];
                  Get.offAll(Login());
                },
                leading: Icon(
                    Icons.logout
                ),
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:IconBut(),
          title: Text(
            "Assignment Alert",
            style: TextStyle(
              fontFamily: "WorkSans",
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/orangeBackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(right: width/5,top: height/10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, $studentName.",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "WorkSans",
                            fontSize: height/35,
                          ),
                        ),
                        SizedBox(
                          height: height/25,
                        ),
                        Text(
                          "New Day New Opportunities.",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "WorkSans",
                            fontSize: height/54,
                          ),
                        ),
                        SizedBox(
                          height: height/5,
                        ),
                        Text(
                          "TODAY - ${dateParse.day} ${getMonthInString()}, ${dateParse.year}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "WorkSans",
                            fontSize: height/54,
                          ),
                        ),
                        SizedBox(
                          height: height/40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:  assignmentName.length,
                  itemBuilder: (context,index){
                    return checkLinkExists(index)?Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        height: height/2.3,
                        width: width/1.3,
                        child: Card(
                          elevation: 10,
                          child: CardDesign(index:index,sub: sub,),
                        ),
                      ),
                    ):Container();
                  },
                  padding: EdgeInsets.only(bottom: height/30,left: width/20),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}