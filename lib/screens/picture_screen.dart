import 'package:flutter/material.dart';

class FullPictureScreen extends StatelessWidget {

  const FullPictureScreen({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(url),
      fit: BoxFit.cover,
    );
  }
}
