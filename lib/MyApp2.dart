import 'package:flutter/material.dart';
class MyApp extends StatefulWidget{
  String? name;
  int? age;
  MyApp({this.name, this.age});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}
class _MyAppState extends State<MyApp>{

  String? _email;
  final emailEditingController = TextEditingController();
  @override
  void initState(){
    super.initState();
    print("run initstate");
  }
  @override
  void dispose(){
    super.dispose();
    emailEditingController.dispose();
    print("run dispose");
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeDependencies();
    if(state==AppLifecycleState.paused){
      print("App is in Background mode");
    }else if(state==AppLifecycleState.resumed){
      print("App in Foreground mode");
    }

  }
  @override
  Widget build(BuildContext context) {
    print("run build()");
    // TODO: implement build
    return MaterialApp(
        title: "This is StatefulWidget",
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: TextField(
                    controller: emailEditingController,
                    onChanged: (text){
                      this.setState(() {
                        _email = text;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(30)
                            )
                        ),
                        labelText: 'Enter your email'
                    ),
                  ),
                )
                ,

                Text("See Result Here:",style: TextStyle(fontSize: 30,color: Colors.blue)
                ),
                Text(_email ?? "No email entered"
                    ,style: TextStyle(fontSize: 30,color: Colors.red)
                ),
              ],
            ),
          ),
        )
    );
  }
}