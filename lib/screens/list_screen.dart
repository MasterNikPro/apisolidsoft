import 'package:apisolidsoft/api/api_service.dart';
import 'package:apisolidsoft/screens/picture_screen.dart';
import 'package:flutter/material.dart';

import '../model/image_model.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late List<ImageModel>? _imageModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _imageModel = (await ApiService().getImage())!.cast<ImageModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image List"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: _imageModel == null || _imageModel!.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: _imageModel!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullPictureScreen(
                        url: _imageModel![index].urls.urlBig),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(34, 34, 34, 0.8),
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(
                      5.0) //                 <--- border radius here
                  ),
                ),
                child: ListTile(
                  leading: Image(
                    image:
                    NetworkImage(_imageModel![index].urls.urlSmall),
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                  title: Text(
                    _imageModel![index].user.name,
                    style: const TextStyle(
                        color: Color.fromRGBO(238, 238, 238, 0.7)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
