import 'data.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  Map<String, Data> dataData = {};

  @override
  void saveData(Data data) {
    String id = data.timestamp
        .toIso8601String(); // Nutze den Zeitstempel als eindeutige ID
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
        .where((entry) => entry.value.timestamp.isAfter(twoWeeksAgo))
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
