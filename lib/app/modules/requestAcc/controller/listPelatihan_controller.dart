import 'package:flutter/material.dart';
import 'package:mobile_smarcerti/app/data/models/listPelatihan_model.dart';
// Import your PelatihanService for data fetching
import 'package:mobile_smarcerti/services/listPelatihan_Service.dart';

class PelatihanController extends ChangeNotifier {
  List<Pelatihan> _pelatihanList = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Pelatihan> get pelatihanList => _pelatihanList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  PelatihanController() {
    fetchPelatihanList();
  }

  Future<void> fetchPelatihanList() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _pelatihanList = await PelatihanService.fetchPelatihanList();
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
