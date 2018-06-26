import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: new MyHomePage(title: 'My First Flutter Demo app!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _email;
  String _password;
  var formKey;
  var scaffoldkey;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.greenAccent,
      key: scaffoldkey,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Form(
          key: formKey,
          child: new Column(
          children: <Widget>[
            //InputTextField
           new TextFormField(
             decoration: new InputDecoration(labelText: "Email"),
             validator: (val)=>
               !val.contains('@') ? 'Invalid Email ID!' : null,
               onSaved: (val) => _email = val,
           ),
            new TextFormField(
              decoration: new InputDecoration(labelText: "Password"),
              validator: (val) =>
                val.length<6 ? 'Password is too sort': null,
              onSaved: (val) => _password = val,
            ),
            ///padding
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            // Button
            new RaisedButton(
                child: new Text("Login"),
                onPressed: _submit,
            ),
          ],
        ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  void _submit() {
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      performLogin();
    }

  }
  void performLogin(){
final snackbar =     new SnackBar(
    content: new Text("Email : $_email , Password: $_password"),
);
scaffoldkey.currentState.showSnackBar(snackbar);
  }
}
