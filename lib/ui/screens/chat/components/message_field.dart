
import 'package:flutter/material.dart';

class MessageField extends StatelessWidget {
  const MessageField({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.transparent : const Color(0xFFF7F7F7),
        ),
        child: TextField(
          maxLines: null,
          decoration: InputDecoration(
              hintText: 'Write a message...',
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    // color: kPrimaryColor,
                    size: 32,
                  ))),
          onChanged: (val) {},
        ),
      ),
    );
  }
}
