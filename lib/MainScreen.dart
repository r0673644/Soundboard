import 'package:flutter/material.dart';
import 'package:reniers_soundboard/SoundPlayer.dart';
import 'package:reniers_soundboard/SoundStorage.dart';

class MainScreen extends StatefulWidget{

  State<StatefulWidget> createState() => new MainScreenState();

}

class MainScreenState extends State<StatefulWidget>{

  SoundPlayer player;

  List<String> soundFilePath;

  @override
  void initState() {
    super.initState();
    player = new SoundPlayer();
  }

  Widget getFuture(){
    return new FutureBuilder<List<String>>(
      future: new SoundStorage().loadSounds(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {

        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Awaiting result...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else{
              soundFilePath = snapshot.requireData;
              print('Loading completed. ${soundFilePath.length} sounds loaded');
              return getLoadedBody();
            }
        }

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white30,
      appBar: new AppBar( centerTitle: true,title: new Text('ZET MA OPEN!'), leading: new Icon(Icons.music_note)),
      body: getFuture()
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  Widget getLoadedBody(){

    final space = Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0));

    return new SingleChildScrollView(
    child: new Column(children: <Widget>[
      space,
    new SizedBox(
    width: 400.0,
    height: 100.0,
    child: FlatButton(
        color: Colors.grey,
          padding: EdgeInsets.all(30.0),
              onPressed: () => player.play(soundFilePath[0]),
              child: new Text("WAAR HEBDE GIJ GEZETE!"),
          shape: new RoundedRectangleBorder(side: BorderSide(color: Colors.black))
      )),
    new SizedBox(
    width: 400.0,
    height: 100.0,
    child: FlatButton(
          padding: EdgeInsets.all(30.0),
          color: Colors.grey,
              onPressed: () => player.play(soundFilePath[1]),
          child: new Text("GASTHUISBERG!"),
        shape: new RoundedRectangleBorder(side: BorderSide(color: Colors.black))
      )),
      new SizedBox(
        width: 400.0,
        height: 100.0,
        child: FlatButton(
                padding: EdgeInsets.all(30.0),
                color: Colors.grey,
                    onPressed: () => player.play(soundFilePath[2]),
                  child: new Text("WETE GIJ WA DA DA IS!"),
            shape: new RoundedRectangleBorder(side: BorderSide(color: Colors.black))
      )),
      new SizedBox(
          width: 400.0,
          height: 100.0,
          child: FlatButton(
              padding: EdgeInsets.all(30.0),
              color: Colors.grey,
              onPressed: () => player.play(soundFilePath[3]),
              child: new Text("MOEGD!"),
              shape: new RoundedRectangleBorder(side: BorderSide(color: Colors.black))
          )),
      new SizedBox(
          width: 400.0,
          height: 100.0,
          child: FlatButton(
              padding: EdgeInsets.all(30.0),
              color: Colors.grey,
              onPressed: () => player.play(soundFilePath[4]),
              child: new Text("EHLA BLEEEUH"),
              shape: new RoundedRectangleBorder(side: BorderSide(color: Colors.black))
          )),
      new SizedBox(
          width: 400.0,
          height: 100.0,
          child: FlatButton(
              padding: EdgeInsets.all(30.0),
              color: Colors.grey,
              onPressed: () => player.play(soundFilePath[5]),
              child: new Text("SIEBERT MAATJE"),
              shape: new RoundedRectangleBorder(side: BorderSide(color: Colors.black))
          )),
      space,

    ]));

  }


}