import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(home: HomePage()));
}
class HomePage extends StatelessWidget {

  List<String> listA = ['John','Anna'];
  List<String> listB = ['Maria','Alex','Albert'];
  List<String> listC = ['Berry','Allen','Harry','Ruport'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: CustomScrollView(
          slivers: [
            //AppBar
            SliverAppBar(
              expandedHeight: 250,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(title: Text('Flexibale AppBar'),
              background: Image.asset("assets/images/burger1.jpg",fit: BoxFit.cover,),
                stretchModes: <StretchMode>[
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                  StretchMode.zoomBackground
                ],
              ),
            ),
            // Apply text
            SliverToBoxAdapter(
           // it is used to take a text
           child: Text('Team A',style: customStyle(),),
         ),
           // SliverList
            SliverList(delegate: SliverChildBuilderDelegate((context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.tealAccent,
                  title: Text("${listA[index]}"),
                  leading: Icon(Icons.people),
                ),
              );
            },childCount: listA.length
            )),
            // Text
            SliverToBoxAdapter(
              // it is used to take a text
              child: Text('Team B',style: customStyle(),),
            ),
            // ListView
            SliverList(delegate: SliverChildBuilderDelegate((context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.tealAccent,
                  title: Text("${listB[index]}"),
                  leading: Icon(Icons.people),
                ),
              );
            },childCount: listB.length
            )),
            // textView
            SliverToBoxAdapter(
              // it is used to take a text
              child: Text('Team C',style: customStyle(),),
            ),
            // GridView
            SliverGrid(delegate: SliverChildBuilderDelegate((context,index){
              return Container(
                alignment: Alignment.center,
                color: Colors.tealAccent,
                child: GridTile(child: Text("${listC[index]}"),),
              );
            },childCount: listC.length), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             mainAxisSpacing: 20.0,crossAxisSpacing: 20.0))
          ],
        ),
      ),
    );
  }
  TextStyle customStyle(){
    return const TextStyle(fontSize: 25,fontWeight: FontWeight.bold);
  }
}
