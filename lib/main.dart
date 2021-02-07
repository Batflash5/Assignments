import 'loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'loginPage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Assignment Alert',
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final userdate = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userdate.writeIfNull('isLogged', false);
    Future.delayed(Duration.zero,() async{
      checkiflogged();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child:  CircularProgressIndicator()
        ),
      ),
    );
  }
  void checkiflogged() {
    userdate.read('isLogged') ? Get.offAll(LoadingScreen(),popGesture:false) : Get.offAll(Login(),popGesture:false);
  }

}
