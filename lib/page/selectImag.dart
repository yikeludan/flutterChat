
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class selectImag extends StatelessWidget {

/*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    print('拍照返回：' + image.toString());
  }

/*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print('相册返回：' + image.toString());
  }

/*选取视频*/
  _getVideo() async {
    var image = await ImagePicker.pickVideo(source: ImageSource.gallery);
    print('选取视频：' + image.toString());
  }
/*拍摄视频*/
  _takeVideo() async {
    var image = await ImagePicker.pickVideo(source: ImageSource.camera);
    print('拍摄视频：' + image.toString());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        home: Scaffold(
            body: Container(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: _takePhoto,
                    child: Text("拍照"),
                  ),
                  RaisedButton(
                    onPressed: _openGallery,
                    child: Text("选择照片"),
                  ),
                  RaisedButton(
                    onPressed: _takeVideo,
                    child: Text("拍视频"),
                  )
                ],
              ),
            )));
  }
}

