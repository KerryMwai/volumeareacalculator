import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';

class AreaAndVolumeChangeNotifier extends ChangeNotifier {
  // Private variables
  double _area = 0;
  double _volume = 0;
  double _convertedArea = 0;
  double _convertedVolume = 0;
  String _activeUnitforAreafrom = "cm";
  String _activeUnitforAreato = "cm";
  String _activeUnitforVolumefrom = "cm";
  String _activeUnitforVolumeto = "cm";
  final List<String> _units = ["mm", "cm", "dm", "m", "Dm", "Hm", "Km"];

  // Getters
  double get area => _convertedArea;
  double get volume => _convertedVolume;
  String get activeAreaUnitFrom => _activeUnitforAreafrom;
  String get activeVolumeUnitFrom => _activeUnitforVolumefrom;
  String get activeAreaUnitTo => _activeUnitforAreato;
  String get activeVolumeUnitTo => _activeUnitforVolumeto;
  UnmodifiableListView<String> get defineunits => UnmodifiableListView(_units);

  // Setters for
  // Area
  setActiveAreaUnitfrom(String areaunitfrom) {
    _activeUnitforAreafrom = areaunitfrom;
    notifyListeners();
  }

  setActiveAreaUnitto(String areaunitto) {
    _activeUnitforAreato = areaunitto;
    notifyListeners();
  }

  // setters for
// Volume
  setActiveVolumeUnitffrom(String volumeunitfrom) {
    _activeUnitforVolumefrom = volumeunitfrom;
    notifyListeners();
  }

  setActiveVolumeUnitto(String volumeunitto) {
    _activeUnitforVolumeto = volumeunitto;
    notifyListeners();
  }

  // Methods
  // Area
  calculateArea(
    double lenght,
    double width,
  ) {
    _area = lenght * width;
    notifyListeners();
  }

  calculateSurfaceAreaOfCylinder(double radius, double height) {
    double pi = (22 / 7);
    double sa = 2 * pi * radius * height;
    notifyListeners();
  }

  calulateSurfaceAreaOfCube(double lenght, double width, double height) {
    double sa =
        2 * (lenght * width) + 2 * (lenght * height) + 2 * (width * height);
    notifyListeners();
  }

  calculateAreaOfASphere() {}

  calculateAreaOfCone() {}
  calculateAreaOfPyramid() {}
// Volume
  calculateVolume(double length, double width, double height) {
    _volume = length * width * height;
    notifyListeners();
  }

// Computing methods
  convertArea() {
    int unitConversionPoint = 100;
    int fromUnit = _units.indexWhere((unit) => unit == _activeUnitforAreafrom);
    int toUnit = _units.indexWhere((unit) => unit == _activeUnitforAreato);
    int unitDifference = toUnit - fromUnit;
    _convertedArea = _area / pow(unitConversionPoint, unitDifference);
    notifyListeners();
  }

  convertVolume() {
    int unitConversionPoint = 1000;
    int fromUnit =
        _units.indexWhere((unit) => unit == _activeUnitforVolumefrom);
    int toUnit = _units.indexWhere((unit) => unit == _activeUnitforVolumeto);
    int unitDifference = toUnit - fromUnit;
    _convertedVolume = _volume / pow(unitConversionPoint, unitDifference);
    notifyListeners();
  }

  calculateSurfaceVolumeOfCylinder(double radius, double height) {}

  calulateSurfaceVolumeOfCube(double lenght, double width, double height) {}

  calculateVolumeOfASphere() {}

  calculateVolumeOfCone() {}
  calculateVolumeOfPyramid() {}
}
