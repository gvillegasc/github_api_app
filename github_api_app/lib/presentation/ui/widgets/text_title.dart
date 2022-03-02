import 'package:flutter/material.dart';

class TextTitleBig extends StatelessWidget {
  const TextTitleBig({
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
        fontSize: 22,
        fontWeight: fontWeight,
      ),
    );
  }
}

class TextTitleRegular extends StatelessWidget {
  const TextTitleRegular({
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
        fontSize: 20,
        fontWeight: fontWeight,
      ),
    );
  }
}

class TextTitleSmall extends StatelessWidget {
  const TextTitleSmall({
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
        fontSize: 18,
        fontWeight: fontWeight,
      ),
    );
  }
}
