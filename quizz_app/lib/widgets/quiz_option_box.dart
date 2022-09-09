import 'package:flutter/material.dart';

class QuizOptionBox extends StatefulWidget {
  const QuizOptionBox({
    Key? key,
    this.option,
    this.bgColor,
    this.onPressed,
  }) : super(key: key);

  final String? option;

  final Color? bgColor;
  final VoidCallback? onPressed;

  @override
  State<QuizOptionBox> createState() => _QuizOptionBoxState();
}

class _QuizOptionBoxState extends State<QuizOptionBox> {
  @override
  Widget build(BuildContext context) {
    return (InkWell(
      onTap: widget.onPressed,
      child: Container(
        // height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.option!,
            style: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 19, 95, 156)),
          ),
        ),
      ),
    ));
  }
}
