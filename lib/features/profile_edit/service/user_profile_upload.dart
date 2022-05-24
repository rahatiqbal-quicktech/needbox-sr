import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class UserProfileUpload {
  Future<Response> sendForm(
      String url, Map<String, dynamic> data, Map<String, File> files) async {
    Map<String, MultipartFile> fileMap = {};
    for (MapEntry fileEntry in files.entries) {
      File file = fileEntry.value;
      String fileName = basename(file.path);
      fileMap[fileEntry.key] = MultipartFile(
          file.openRead(), await file.length(),
          filename: fileName);
    }
    data.addAll(fileMap);
    var formData = FormData.fromMap(data);
    Dio dio = Dio();
    var box = GetStorage();
    var token = box.read('token');
    return await dio.post(url,
        data: formData,
        options: Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: 'multipart/form-data'));
  }
}
