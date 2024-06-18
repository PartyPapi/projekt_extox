import 'data.dart';

abstract class DatabaseRepository {
  // Create/Speichern
  void saveData(Data data);

  // Auslesen aktueller Datensatz
  Data? getCurrentData();

  // Auslesen der letzten drei Datensätze
  List<Data> getLastThreeData();

  // Auslesen der Datensätze der letzten zwei Wochen
  List<Data> getDataOfLastTwoWeeks();

  // Löschen von Daten, die älter als zwei Wochen sind
  void deleteDataOlderThanTwoWeeks();
}
