import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_task/model/post_model.dart';
import 'package:mobile_task/provider/post_provider.dart';
import 'package:mobile_task/utils/loading_action.dart';
import 'package:provider/provider.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> postList = [];
  Future<List<PostModel>> getPost() async {
    QuerySnapshot post = await firestore.collection('Post').get();
    post.docs.forEach((element) {
      postList.add(PostModel.fromMap(element.data() as dynamic));
      setState(() {});
      print(postList);
    });

    return postList;
  }

  @override
  void initState() {
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: postList.length,
                itemBuilder: ((context, index) => Column(
                      children: [
                        Text(
                          postList[index].username,
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          postList[index].postText,
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          postList[index].date,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )))),
      ],
    )));
  }
}
