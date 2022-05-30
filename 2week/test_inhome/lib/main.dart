import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
   
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

export 'package:image_picker_platform_interface/image_picker_platform_interface.dart'
    show
        kTypeImage,
        kTypeVideo,
        ImageSource,
        CameraDevice,
        LostData,
        LostDataResponse,
        PickedFile,
        XFile,
        RetrieveType;

/// Provides an easy way to pick an image/video from the image library,
/// or to take a picture/video with the camera.
// class ImagePicker {
//   /// The platform interface that drives this plugin
//   @visibleForTesting
//   static ImagePickerPlatform get platform => ImagePickerPlatform.instance;

//   /// Returns a [PickedFile] object wrapping the image that was picked.
//   ///
//   /// The returned [PickedFile] is intended to be used within a single APP session. Do not save the file path and use it across sessions.
//   ///
//   /// The `source` argument controls where the image comes from. This can
//   /// be either [ImageSource.camera] or [ImageSource.gallery].
//   ///
//   /// Where iOS supports HEIC images, Android 8 and below doesn't. Android 9 and above only support HEIC images if used
//   /// in addition to a size modification, of which the usage is explained below.
//   ///
//   /// If specified, the image will be at most `maxWidth` wide and
//   /// `maxHeight` tall. Otherwise the image will be returned at it's
//   /// original width and height.
//   /// The `imageQuality` argument modifies the quality of the image, ranging from 0-100
//   /// where 100 is the original/max quality. If `imageQuality` is null, the image with
//   /// the original quality will be returned. Compression is only supported for certain
//   /// image types such as JPEG and on Android PNG and WebP, too. If compression is not supported for the image that is picked,
//   /// a warning message will be logged.
//   ///
//   /// Use `preferredCameraDevice` to specify the camera to use when the `source` is [ImageSource.camera].
//   /// The `preferredCameraDevice` is ignored when `source` is [ImageSource.gallery]. It is also ignored if the chosen camera is not supported on the device.
//   /// Defaults to [CameraDevice.rear]. Note that Android has no documented parameter for an intent to specify if
//   /// the front or rear camera should be opened, this function is not guaranteed
//   /// to work on an Android device.
//   ///
//   /// In Android, the MainActivity can be destroyed for various reasons. If that happens, the result will be lost
//   /// in this call. You can then call [getLostData] when your app relaunches to retrieve the lost data.
//   ///
//   /// See also [getMultiImage] to allow users to select multiple images at once.
//   ///
//   /// The method could throw [PlatformException] if the app does not have permission to access
//   /// the camera or photos gallery, no camera is available, plugin is already in use,
//   /// temporary file could not be created (iOS only), plugin activity could not
//   /// be allocated (Android only) or due to an unknown error.
//   @Deprecated('Switch to using pickImage instead')
//   Future<PickedFile?> getImage({
//     required ImageSource source,
//     double? maxWidth,
//     double? maxHeight,
//     int? imageQuality,
//     CameraDevice preferredCameraDevice = CameraDevice.rear,
//   }) {
//     return platform.pickImage(
//       source: source,
//       maxWidth: maxWidth,
//       maxHeight: maxHeight,
//       imageQuality: imageQuality,
//       preferredCameraDevice: preferredCameraDevice,
//     );
//   }

//   /// Returns a [List<PickedFile>] object wrapping the images that were picked.
//   ///
//   /// The returned [List<PickedFile>] is intended to be used within a single APP session. Do not save the file path and use it across sessions.
//   ///
//   /// Where iOS supports HEIC images, Android 8 and below doesn't. Android 9 and above only support HEIC images if used
//   /// in addition to a size modification, of which the usage is explained below.
//   ///
//   /// This method is not supported in iOS versions lower than 14.
//   ///
//   /// If specified, the images will be at most `maxWidth` wide and
//   /// `maxHeight` tall. Otherwise the images will be returned at it's
//   /// original width and height.
//   /// The `imageQuality` argument modifies the quality of the images, ranging from 0-100
//   /// where 100 is the original/max quality. If `imageQuality` is null, the images with
//   /// the original quality will be returned. Compression is only supported for certain
//   /// image types such as JPEG and on Android PNG and WebP, too. If compression is not supported for the image that is picked,
//   /// a warning message will be logged.
//   ///
//   /// The method could throw [PlatformException] if the app does not have permission to access
//   /// the camera or photos gallery, no camera is available, plugin is already in use,
//   /// temporary file could not be created (iOS only), plugin activity could not
//   /// be allocated (Android only) or due to an unknown error.
//   ///
//   /// See also [getImage] to allow users to only pick a single image.
//   @Deprecated('Switch to using pickMultiImage instead')
//   Future<List<PickedFile>?> getMultiImage({
//     double? maxWidth,
//     double? maxHeight,
//     int? imageQuality,
//   }) {
//     return platform.pickMultiImage(
//       maxWidth: maxWidth,
//       maxHeight: maxHeight,
//       imageQuality: imageQuality,
//     );
//   }

//   /// Returns a [PickedFile] object wrapping the video that was picked.
//   ///
//   /// The returned [PickedFile] is intended to be used within a single APP session. Do not save the file path and use it across sessions.
//   ///
//   /// The [source] argument controls where the video comes from. This can
//   /// be either [ImageSource.camera] or [ImageSource.gallery].
//   ///
//   /// The [maxDuration] argument specifies the maximum duration of the captured video. If no [maxDuration] is specified,
//   /// the maximum duration will be infinite.
//   ///
//   /// Use `preferredCameraDevice` to specify the camera to use when the `source` is [ImageSource.camera].
//   /// The `preferredCameraDevice` is ignored when `source` is [ImageSource.gallery]. It is also ignored if the chosen camera is not supported on the device.
//   /// Defaults to [CameraDevice.rear].
//   ///
//   /// In Android, the MainActivity can be destroyed for various fo reasons. If that happens, the result will be lost
//   /// in this call. You can then call [getLostData] when your app relaunches to retrieve the lost data.
//   ///
//   /// The method could throw [PlatformException] if the app does not have permission to access
//   /// the camera or photos gallery, no camera is available, plugin is already in use,
//   /// temporary file could not be created and video could not be cached (iOS only),
//   /// plugin activity could not be allocated (Android only) or due to an unknown error.
//   ///
//   @Deprecated('Switch to using pickVideo instead')
//   Future<PickedFile?> getVideo({
//     required ImageSource source,
//     CameraDevice preferredCameraDevice = CameraDevice.rear,
//     Duration? maxDuration,
//   }) {
//     return platform.pickVideo(
//       source: source,
//       preferredCameraDevice: preferredCameraDevice,
//       maxDuration: maxDuration,
//     );
//   }

//   /// Retrieve the lost [PickedFile] when [selectImage] or [selectVideo] failed because the  MainActivity is destroyed. (Android only)
//   ///
//   /// Image or video can be lost if the MainActivity is destroyed. And there is no guarantee that the MainActivity is always alive.
//   /// Call this method to retrieve the lost data and process the data according to your APP's business logic.
//   ///
//   /// Returns a [LostData] object if successfully retrieved the lost data. The [LostData] object can represent either a
//   /// successful image/video selection, or a failure.
//   ///
//   /// Calling this on a non-Android platform will throw [UnimplementedError] exception.
//   ///
//   /// See also:
//   /// * [LostData], for what's included in the response.
//   /// * [Android Activity Lifecycle](https://developer.android.com/reference/android/app/Activity.html), for more information on MainActivity destruction.
//   @Deprecated('Switch to using retrieveLostData instead')
//   Future<LostData> getLostData() {
//     return platform.retrieveLostData();
//   }

//   /// Returns an [XFile] object wrapping the image that was picked.
//   ///
//   /// The returned [XFile] is intended to be used within a single APP session. Do not save the file path and use it across sessions.
//   ///
//   /// The `source` argument controls where the image comes from. This can
//   /// be either [ImageSource.camera] or [ImageSource.gallery].
//   ///
//   /// Where iOS supports HEIC images, Android 8 and below doesn't. Android 9 and above only support HEIC images if used
//   /// in addition to a size modification, of which the usage is explained below.
//   ///
//   /// If specified, the image will be at most `maxWidth` wide and
//   /// `maxHeight` tall. Otherwise the image will be returned at it's
//   /// original width and height.
//   /// The `imageQuality` argument modifies the quality of the image, ranging from 0-100
//   /// where 100 is the original/max quality. If `imageQuality` is null, the image with
//   /// the original quality will be returned. Compression is only supported for certain
//   /// image types such as JPEG and on Android PNG and WebP, too. If compression is not supported for the image that is picked,
//   /// a warning message will be logged.
//   ///
//   /// Use `preferredCameraDevice` to specify the camera to use when the `source` is [ImageSource.camera].
//   /// The `preferredCameraDevice` is ignored when `source` is [ImageSource.gallery]. It is also ignored if the chosen camera is not supported on the device.
//   /// Defaults to [CameraDevice.rear]. Note that Android has no documented parameter for an intent to specify if
//   /// the front or rear camera should be opened, this function is not guaranteed
//   /// to work on an Android device.
//   ///
//   /// In Android, the MainActivity can be destroyed for various reasons. If that happens, the result will be lost
//   /// in this call. You can then call [retrieveLostData] when your app relaunches to retrieve the lost data.
//   ///
//   /// See also [pickMultiImage] to allow users to select multiple images at once.
//   ///
//   /// The method could throw [PlatformException] if the app does not have permission to access
//   /// the camera or photos gallery, no camera is available, plugin is already in use,
//   /// temporary file could not be created (iOS only), plugin activity could not
//   /// be allocated (Android only) or due to an unknown error.
//   Future<XFile?> pickImage({
//     required ImageSource source,
//     double? maxWidth,
//     double? maxHeight,
//     int? imageQuality,
//     CameraDevice preferredCameraDevice = CameraDevice.rear,
//   }) {
//     if (imageQuality != null && (imageQuality < 0 || imageQuality > 100)) {
//       throw ArgumentError.value(
//           imageQuality, 'imageQuality', 'must be between 0 and 100');
//     }
//     if (maxWidth != null && maxWidth < 0) {
//       throw ArgumentError.value(maxWidth, 'maxWidth', 'cannot be negative');
//     }
//     if (maxHeight != null && maxHeight < 0) {
//       throw ArgumentError.value(maxHeight, 'maxHeight', 'cannot be negative');
//     }

//     return platform.getImage(
//       source: source,
//       maxWidth: maxWidth,
//       maxHeight: maxHeight,
//       imageQuality: imageQuality,
//       preferredCameraDevice: preferredCameraDevice,
//     );
//   }

//   /// Returns a [List<XFile>] object wrapping the images that were picked.
//   ///
//   /// The returned [List<XFile>] is intended to be used within a single APP session. Do not save the file path and use it across sessions.
//   ///
//   /// Where iOS supports HEIC images, Android 8 and below doesn't. Android 9 and above only support HEIC images if used
//   /// in addition to a size modification, of which the usage is explained below.
//   ///
//   /// This method is not supported in iOS versions lower than 14.
//   ///
//   /// If specified, the images will be at most `maxWidth` wide and
//   /// `maxHeight` tall. Otherwise the images will be returned at it's
//   /// original width and height.
//   /// The `imageQuality` argument modifies the quality of the images, ranging from 0-100
//   /// where 100 is the original/max quality. If `imageQuality` is null, the images with
//   /// the original quality will be returned. Compression is only supported for certain
//   /// image types such as JPEG and on Android PNG and WebP, too. If compression is not supported for the image that is picked,
//   /// a warning message will be logged.
//   ///
//   /// The method could throw [PlatformException] if the app does not have permission to access
//   /// the camera or photos gallery, no camera is available, plugin is already in use,
//   /// temporary file could not be created (iOS only), plugin activity could not
//   /// be allocated (Android only) or due to an unknown error.
//   ///
//   /// See also [pickImage] to allow users to only pick a single image.
//   Future<List<XFile>?> pickMultiImage({
//     double? maxWidth,
//     double? maxHeight,
//     int? imageQuality,
//   }) {
//     if (imageQuality != null && (imageQuality < 0 || imageQuality > 100)) {
//       throw ArgumentError.value(
//           imageQuality, 'imageQuality', 'must be between 0 and 100');
//     }
//     if (maxWidth != null && maxWidth < 0) {
//       throw ArgumentError.value(maxWidth, 'maxWidth', 'cannot be negative');
//     }
//     if (maxHeight != null && maxHeight < 0) {
//       throw ArgumentError.value(maxHeight, 'maxHeight', 'cannot be negative');
//     }

//     return platform.getMultiImage(
//       maxWidth: maxWidth,
//       maxHeight: maxHeight,
//       imageQuality: imageQuality,
//     );
//   }

//   /// Returns an [XFile] object wrapping the video that was picked.
//   ///
//   /// The returned [XFile] is intended to be used within a single APP session. Do not save the file path and use it across sessions.
//   ///
//   /// The [source] argument controls where the video comes from. This can
//   /// be either [ImageSource.camera] or [ImageSource.gallery].
//   ///
//   /// The [maxDuration] argument specifies the maximum duration of the captured video. If no [maxDuration] is specified,
//   /// the maximum duration will be infinite.
//   ///
//   /// Use `preferredCameraDevice` to specify the camera to use when the `source` is [ImageSource.camera].
//   /// The `preferredCameraDevice` is ignored when `source` is [ImageSource.gallery]. It is also ignored if the chosen camera is not supported on the device.
//   /// Defaults to [CameraDevice.rear].
//   ///
//   /// In Android, the MainActivity can be destroyed for various fo reasons. If that happens, the result will be lost
//   /// in this call. You can then call [retrieveLostData] when your app relaunches to retrieve the lost data.
//   ///
//   /// The method could throw [PlatformException] if the app does not have permission to access
//   /// the camera or photos gallery, no camera is available, plugin is already in use,
//   /// temporary file could not be created and video could not be cached (iOS only),
//   /// plugin activity could not be allocated (Android only) or due to an unknown error.
//   ///
//   Future<XFile?> pickVideo({
//     required ImageSource source,
//     CameraDevice preferredCameraDevice = CameraDevice.rear,
//     Duration? maxDuration,
//   }) {
//     return platform.getVideo(
//       source: source,
//       preferredCameraDevice: preferredCameraDevice,
//       maxDuration: maxDuration,
//     );
//   }

//   /// Retrieve the lost [XFile] when [pickImage], [pickMultiImage] or [pickVideo] failed because the MainActivity
//   /// is destroyed. (Android only)
//   ///
//   /// Image or video can be lost if the MainActivity is destroyed. And there is no guarantee that the MainActivity is always alive.
//   /// Call this method to retrieve the lost data and process the data according to your APP's business logic.
//   ///
//   /// Returns a [LostDataResponse] object if successfully retrieved the lost data. The [LostDataResponse] object can \
//   /// represent either a successful image/video selection, or a failure.
//   ///
//   /// Calling this on a non-Android platform will throw [UnimplementedError] exception.
//   ///
//   /// See also:
//   /// * [LostDataResponse], for what's included in the response.
//   /// * [Android Activity Lifecycle](https://developer.android.com/reference/android/app/Activity.html), for more information on MainActivity destruction.
//   Future<LostDataResponse> retrieveLostData() {
//     return platform.getLostData();
//   }
// }


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const CameraExample(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image picker'),

      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('test imagepicker')
          ],
        ),
      ),

    );
  }
}


class CameraExample extends StatefulWidget {
  const CameraExample({Key? key}) : super(key: key);

  @override
  _CameraExampleState createState() => _CameraExampleState();
}

class _CameraExampleState extends State<CameraExample> {
  File? _image;
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

    // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    // 화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
        backgroundColor: const Color(0xfff4f3f9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.0),
            showImage(),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // 카메라 촬영 버튼
                FloatingActionButton(
                  child: Icon(Icons.add_a_photo),
                  tooltip: 'pick Iamge',
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                ),

                // 갤러리에서 이미지를 가져오는 버튼
                FloatingActionButton(
                  child: Icon(Icons.wallpaper),
                  tooltip: 'pick Iamge',
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/Poketest.png'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:() {
                    sendFile();
                  }, 
                  child:const Text('전송'))
              ],
            )
          ],
        ));
  }

  // -- functions
  sendFile() async{ 
    // Uint8List? fileBytes = await File(_image!.path).readAsBytes();
    // //   print((fileBytes));
    // // print(base64Encode(fileBytes));
    // String base64Image = base64Encode(fileBytes);
    // base64Image.replaceAll('/','_');
    // base64Image.replaceAll('+','-');

    // print((base64Image));
    // print(base64Decode(base64Image));


    print(_image!.path);

    var testpath = "images/Poketest.png";
    testpath = "C:/Users/rlaxo/Downloads/Poketest.png";

    var uri = Uri.parse('http://192.168.0.3:8080/Flutter/test.jsp');
    var request = http.MultipartRequest('POST', uri)
      ..fields['user'] = 'nweiz@google.com'
      ..files.add(await http.MultipartFile.fromPath(
          'test1', _image!.path ,
          contentType: new MediaType('file', 'image/jpeg'),));

          
    var response = await request.send();

    
    //      contentType:  MediaType('file', 'image/jpeg')
    if (response.statusCode == 200) print('Uploaded!');

    // var url = Uri.parse('http://192.168.0.3:8080/Flutter/test.jsp?str=$base64Image');
    // var response = await http.get(url);
    // print(response.body);

    // print(Uri.parse(base64Image));
    //print(utf8.encode(base64Image));

    

  }

}//end