import 'package:flutter/material.dart';

class TextParagraphBig extends StatelessWidget {
  const TextParagraphBig({
    Key? key,
    required this.text,
    required this.color,
    this.fontWeight = FontWeight.w500,
    this.textAlign,
    this.textDecoration = TextDecoration.none,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextDecoration textDecoration;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        decoration: textDecoration,
        fontSize: 15,
        fontWeight: fontWeight,
      ),
    );
  }
}

class TextParagraphRegular extends StatelessWidget {
  const TextParagraphRegular({
    Key? key,
    required this.text,
    required this.color,
    this.fontWeight = FontWeight.w500,
    this.textAlign,
    this.textDecoration = TextDecoration.none,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextDecoration textDecoration;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        decoration: textDecoration,
        fontSize: 14,
        fontWeight: fontWeight,
      ),
    );
  }
}

class TextParagraphSmall extends StatelessWidget {
  const TextParagraphSmall({
    Key? key,
    required this.text,
    required this.color,
    this.fontWeight = FontWeight.w500,
    this.textAlign,
    this.textDecoration = TextDecoration.none,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextDecoration textDecoration;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        decoration: textDecoration,
        fontSize: 14,
        fontWeight: fontWeight,
      ),
    );
  }
}
