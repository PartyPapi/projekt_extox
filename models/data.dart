class Data {
  double value;
  int sensorNumber; // Anlagennummer, hier 1 bis 3
  String
      material; // Material, hier O2 (Sauerstoff), C4H (Methan), H2S (Schwefelwasserstoff)

  Data(
      {required this.value,
      required this.sensorNumber,
      required this.material});

  @override
  String toString() {
    return 'Data(value: $value, sensorNumber: $sensorNumber, material: $material)';
  }

// möglicherweise zum Prüfen der Datenintegrität sinnvoll ("Übertragungsfehler,
// keine unschärfe, keine interpolation, nur konkrete Werte oder skip!")

  // Methode zur Validierung der Sensornummer
  // bool validateSensorNumber() {
  // return sensorNumber >= 1 && sensorNumber <= 3;
  // }

  // Methode zur Validierung des Materials
  // bool validateMaterial() {
  // return material == 'O2' || material == 'C4H' || material == 'H2S';
  // }
}
