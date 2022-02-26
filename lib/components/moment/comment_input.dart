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
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18, top: 3),
            child: CircleAvatar(
              radius: 21,
              backgroundImage: serverImage(dpUrl),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: TextFormField(
                autofocus: autoFocus,
                focusNode: node,
                controller: controller,
                style: const TextStyle(fontSize: 14),
                maxLength: 300,
                minLines: 1,
                maxLines: 2,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  label: const Text('Add comment...'),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: IconButton(
                    onPressed: onNewComment,
                    icon: const Icon(
                      Icons.send_outlined,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
