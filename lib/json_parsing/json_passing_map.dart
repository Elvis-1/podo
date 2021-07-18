import 'package:flutter/material.dart';
//import 'package:podo/json_parsing/network.dart';
import 'package:podo/model/PostLists.dart';
import 'package:podo/model/Post.dart';
import 'package:podo/json_parsing/network.dart';

class JsonParsingMap extends StatefulWidget {
  const JsonParsingMap({Key? key}) : super(key: key);

  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  Future<PostList>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network(url: "https://jsonplaceholder.typicode.com/posts");
    data = network.loadPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PODO"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<PostList> snapshop){
              List<Post>? allPosts;

              if(snapshop.hasData){
                allPosts = snapshop.data!.posts;
                return createListView(allPosts!, context);
              }else{

                return CircularProgressIndicator();
              }

          },),
        ),
      ),
    );
  }
  Widget createListView(List<Post> data, BuildContext context){
     return Container(
       child: ListView.builder(
           itemCount: data.length,
           itemBuilder: (context,int index){
             return Column(
               children: [
                 Divider(height: 5.6,),
                 ListTile(
                   title: Text("${data[index].title}"),
                   subtitle: Text("${data[index].body}"),
                   leading: Column(
                     children: [
                       CircleAvatar(
                         backgroundColor: Colors.amber,
                         radius: 23,
                         child: Text("${data[index].id}"),
                       ),
                     ],
                   ),
                 ),

               ],
             );

       }),
     );
  }
}
