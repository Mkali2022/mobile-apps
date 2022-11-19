import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class UserStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/userFile.txt');
  }

  Future<String> readUser() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  Future<File> writeUser(String counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  Future<File> get _localTimerFile async {
    final path = await _localPath;
    return File('$path/timerFile.txt');
  }

  Future<int> readTimer() async {
    try {
      final file = await _localTimerFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }


  Future<File> writeTimer(int counter) async {
    final file = await _localTimerFile;
    return file.writeAsString('$counter');
  }
}


class TripStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/trip.txt');
  }

  Future<String> readTrip() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();

      return contents;
    } catch (e) {

      return '';
    }
  }

  Future<File> writeTrip(String value,String counter) async {
    final file = await _localFile;

    log('$value,$counter',name: 'TripStorage');
    if(value.isEmpty){
      return file.writeAsString('$counter');
    }else {
      return file.writeAsString('$value,$counter');
    }
  }
  Future<File> clearTrip() async {
    final file = await _localFile;
      return file.writeAsString('');

  }
}