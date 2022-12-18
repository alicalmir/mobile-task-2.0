import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_task/provider/post_provider.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: postController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                      hintText: 'Enter your post', border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: CupertinoButton(
                onPressed: () {
                  context
                      .read<PostProvider>()
                      .uploadPost(text: postController.text, context: context);
                },
                color: Colors.grey.shade800,
                child: const Text('POST NOW'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
