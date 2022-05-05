import 'package:flutter/material.dart';
import 'package:moment/components/common/server_image.dart';

class CommentInput extends StatelessWidget {
  final String dpUrl;
  final TextEditingController controller;
  final FocusNode node;
  final bool autoFocus;
  final void Function() onNewComment;
  const CommentInput(
      {required this.dpUrl,
      required this.controller,
      required this.node,
      required this.autoFocus,
      required this.onNewComment,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        autofocus: autoFocus,
        focusNode: node,
        controller: controller,
        style: const TextStyle(fontSize: 14),
        maxLength: 300,
        minLines: 1,
        maxLines: 4,
        cursorHeight: 21,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: serverImageProvider(dpUrl),
            ),
          ),
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          label: const Text('Add comment...'),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: IconButton(
            onPressed: onNewComment,
            icon: const Icon(
              Icons.send_outlined,
              size: 21,
            ),
          ),
        ),
      ),
    );
  }
}
