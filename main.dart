import 'data/data.dart';
import 'data/database_repository.dart';
import 'data/mock_database.dart';

void main() {
  DatabaseRepository mockDatabase = MockDatabase();

  // Erster Versuchseintrag in die Datenbank
  Data firstData = Data(
      value: 23.5, sensorNumber: 1, material: 'O2', timestamp: DateTime.now());
  mockDatabase.saveData(firstData);

  // Zweiter Versuchseintrag in die Datenbank
  Data secondData = Data(
      value: 45.8,
      sensorNumber: 2,
      material: 'C4H',
      timestamp: DateTime.now().add(Duration(seconds: 1)));
  mockDatabase.saveData(secondData);

  // Dritter Versuchseintrag in die Datenbank
  Data thirdData = Data(
      value: 12.3,
      sensorNumber: 3,
      material: 'H2S',
      timestamp: DateTime.now().add(Duration(seconds: 2)));
  mockDatabase.saveData(thirdData);

  // Vierter Versuchseintrag in die Datenbank
  Data fourthData = Data(
      value: 30.2,
      sensorNumber: 1,
      material: 'O2',
      timestamp: DateTime.now().add(Duration(seconds: 3)));
  mockDatabase.saveData(fourthData);

  // Ausgabe aller aktuellen Daten
  print('Aktueller Datensatz: ${mockDatabase.getCurrentData()}');

  // Ausgabe der letzten drei Datensätze
  print('Letzte drei Datensätze: ${mockDatabase.getLastThreeData()}');

  // Ausgabe der Datensätze der letzten zwei Wochen
  print(
      'Datensätze der letzten zwei Wochen: ${mockDatabase.getDataOfLastTwoWeeks()}');

  // Löschen von Daten, die älter als zwei Wochen sind
  mockDatabase.deleteDataOlderThanTwoWeeks();
  print(
      'Datensätze nach dem Löschen der älteren als zwei Wochen: ${mockDatabase.getDataOfLastTwoWeeks()}');
}
