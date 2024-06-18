class Data {
  double value;
  int sensorNumber; // Anlagennummer, in meiner App vorerst 1 bis 3
  String material; // Material (Sauerstoff, Methan, Schwefelwasserstoff)
  DateTime timestamp; // Zeitstempel

  Data(
      {required this.value,
      required this.sensorNumber,
      required this.material,
      required this.timestamp});

  @override
  String toString() {
    return 'Data(value: $value, sensorNumber: $sensorNumber, material: $material, timestamp: $timestamp)';
  }

  // Validierung wegen Datenübertragung! Nur gültige Daten, sonst Skip!

  // Validierung der Sensornummer
  //bool validateSensorNumber() {
  //return sensorNumber >= 1 && sensorNumber <= 3;
  // }

  // Validierung des Materials
  //bool validateMaterial() {
  //return material == 'O2' || material == 'C4H' || material == 'H2S';
  // }
}
