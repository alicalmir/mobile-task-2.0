import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_task/model/post_model.dart';
import 'package:mobile_task/screens/home_screen.dart';
import 'package:mobile_task/utils/loading_action.dart';

class PostProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void uploadPost({
    required String text,
    required BuildContext context,
  }) async {
try {

      final userInfo =
        await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
        var name = (userInfo.data() as dynamic)['name'];
    PostModel postModel = PostModel(
        id: _auth.currentUser!.uid,
        username: name,
        date: DateTime.now().toString(),
        postText: text);
        showLoadingDialog(context);
       await _firestore.collection('Post').add(postModel.toMap());
       await _firestore.collection('My Post').doc(_auth.currentUser!.uid).collection('post').add(postModel.toMap());
       Navigator.of(context).pop();
       Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage())); 
} on FirebaseException catch (e) {
  
}
  }
}
