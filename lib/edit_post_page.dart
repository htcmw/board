import 'package:flutter/material.dart';

class EditPostPage extends StatefulWidget {
  final Map<String, String> post;
  final int index;
  final Function(int, Map<String, String>) onEditPost;

  const EditPostPage({
    super.key,
    required this.post,
    required this.index,
    required this.onEditPost,
  });

  @override
  _EditPostPageState createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.post['title']);
    _authorController = TextEditingController(text: widget.post['author']);
    _contentController = TextEditingController(text: widget.post['content']);
  }

  void _submitPost() {
    if (_titleController.text.isNotEmpty &&
        _authorController.text.isNotEmpty &&
        _contentController.text.isNotEmpty) {
      final updatedPost = {
        'title': _titleController.text,
        'author': _authorController.text,
        'content': _contentController.text,
        'date': widget.post['date']!, // 날짜는 수정하지 않음
      };
      widget.onEditPost(widget.index, updatedPost);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
