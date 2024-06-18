import 'data.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  Map<String, Data> dataData = {};

  @override
  void saveData(Data data) {
    String id =
        DateTime.now().toIso8601String(); //eindeutige ID über den Zeitstempel
    dataData[id] = data;
  }

  @override
  Data? getCurrentData() {
    if (dataData.isEmpty) return null;
    String latestKey = dataData.keys.last;
    return dataData[latestKey];
  }

  @override
  List<Data> getLastThreeData() {
    if (dataData.length < 3) {
      return dataData.values.toList();
    }
    return dataData.values.toList().sublist(dataData.length - 3);
  }

  @override
  List<Data> getDataOfLastTwoWeeks() {
    DateTime twoWeeksAgo = DateTime.now().subtract(Duration(days: 14));
    return dataData.entries
        .where((entry) => DateTime.parse(entry.key).isAfter(twoWeeksAgo))
        .map((entry) => entry.value)
        .toList();
  }

  @override
  void deleteDataOlderThanTwoWeeks() {
    DateTime twoWeeksAgo = DateTime.now().subtract(Duration(days: 14));
    List<String> keysToRemove = dataData.keys
        .where((key) => DateTime.parse(key).isBefore(twoWeeksAgo))
        .toList();
    for (String key in keysToRemove) {
      dataData.remove(key);
    }
  }
}

void main() {
  // Beispielinstanzen für den Versuch, "to delete"
  Data data1 = Data(value: 23.5, sensorNumber: 1, material: 'O2');
  Data data2 = Data(value: 45.8, sensorNumber: 2, material: 'C4H');
  Data data3 = Data(value: 12.3, sensorNumber: 3, material: 'H2S');

  // Ausgabe der Daten
  print(data1);
  print(data2);
  print(data3);

  // Validierung, falls notwendig
  // print(
  //     'data1 valid: ${data1.validateSensorNumber() && data1.validateMaterial()}');
  // print(
  //     'data2 valid: ${data2.validateSensorNumber() && data2.validateMaterial()}');
  // print(
  //     'data3 valid: ${data3.validateSensorNumber() && data3.validateMaterial()}');
}
