import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:api_app/API.dart';
import 'package:api_app/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API FETCH',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var users = new List<User>();
  var avatar = 'https://api.adorable.io/avatars/285/abott@adorable.png';
  getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, 
                new MaterialPageRoute(builder: (context)=>Details(users[index])));
              },
              child: Card(
                elevation: 2,
                  child: Column(
                children:<Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.blue,
                      backgroundImage: NetworkImage(avatar),
                    ),
                  title: Text(users[index].name),
                   subtitle: Text(users[index].email),
              )
              ])

              ),
            );
          },
        ));
  }
}

class Details extends StatelessWidget{
  final User user;
  Details(this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name+"'s"+" page"),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 4.0,
            child: Text(user.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Card(
            elevation: 4.0,
            child: Text(user.username, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Card(
            elevation: 4.0,
            child: Text(user.email, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Card(
            elevation: 4.0,
            child: Text(user.phone, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }

}

