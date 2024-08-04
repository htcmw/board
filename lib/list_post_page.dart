import 'package:flutter/material.dart';
import 'post_item.dart';
import 'add_post_page.dart';
import 'edit_post_page.dart';

class BulletinBoardPage extends StatefulWidget {
  @override
  _BulletinBoardPageState createState() => _BulletinBoardPageState();
}

class _BulletinBoardPageState extends State<BulletinBoardPage> {
  final List<Map<String, String>> posts = [
    {
      'title': '첫 번째 게시글',
      'content': '첫 번째 게시글 내용입니다.',
      'author': '작성자 A',
      'date': '2024-07-21'
    },
    {
      'title': '두 번째 게시글',
      'content': '두 번째 게시글 내용입니다.',
      'author': '작성자 B',
      'date': '2024-07-20'
    },
    {
      'title': '세 번째 게시글',
      'content': '세 번째 게시글 내용입니다.',
      'author': '작성자 C',
      'date': '2024-07-19'
    },
  ];

  void _addPost(Map<String, String> newPost) {
    setState(() {
      posts.add(newPost);
    });
  }

  void _editPost(int index, Map<String, String> updatedPost) {
    setState(() {
      posts[index] = updatedPost;
    });
  }

  void _deletePost(int index) {
    setState(() {
      posts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insight'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return PostItem(
              title: post['title']!,
              author: post['author']!,
              date: post['date']!,
              content: post['content']!,
              onEdit: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditPostPage(
                      post: post,
                      index: index,
                      onEditPost: _editPost,
                    ),
                  ),
                );
              },
              onDelete: () {
                _deletePost(index);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddPostPage(onAddPost: _addPost),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
