import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

const filePath = 'assets/fish_details.csv';

class FishDetails {
  late final String scientific_name;
  late String order,
      family,
      fishbaseName,
      localName,
      size,
      weight,
      age,
      description,
      biology,
      threatTohumans,
      iucnRedListStatus;
  FishDetails({required this.scientific_name});

  Future<void> fetchAndSetDetails() async {
    final rawData = await rootBundle.loadString(filePath);
    List<List> listData = const CsvToListConverter().convert(rawData);
    bool flag = false;
    for (var fish in listData) {
      if (fish[2] == scientific_name) {
        order = fish[0];
        family = fish[1];
        fishbaseName = fish[4];
        localName = fish[5];
        description = fish[7];
        biology = fish[8];
        threatTohumans = fish[9];
        iucnRedListStatus = fish[10];
        flag = true;
        break;
      }
    }
    if (!flag) {
      order = '';
      family = '';
      fishbaseName = '';
      localName = '';
      size = '';
      weight = '';
      age = '';
      description = '';
      biology = '';
      threatTohumans = '';
      iucnRedListStatus = '';
    }
  }
}
