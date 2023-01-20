import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/models/DSA/DSA_model.dart';
import 'package:kampus_gratis/services/providers/DSA/DSA_provider.dart';

class DSAController extends GetxController with StateMixin<List<DsaModel>?> {
  DSAController(this._dsaProvider);

  final DSAProvider _dsaProvider;

  RxList<bool> isChecked = (List<bool>.of([])).obs;

  RxString schedule = ''.obs;

  RxInt indexNow = 0.obs;

  Future<void> getDataDSA() async {
    try {
      List<DsaModel>? result = await _dsaProvider.getData();

      if (result != null && result.isNotEmpty) {
        change(result, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  addSchedule(int timeLengthParam, int indexParam) {
    indexNow.value = indexParam;

    isChecked.value = [];

    for (int i = 0; i < timeLengthParam; i++) {
      isChecked.add(false);
    }
  }

  changeIsChaked(int indexParam, bool isChekedParam, String scheduleParam) {
    for (int i = 0; i < isChecked.length; i++) {
      if (i == indexParam) {
        isChecked[indexParam] = isChekedParam;
        schedule.value = scheduleParam;
      } else {
        isChecked[i] = false;
      }
    }
  }

  submitSchedule(String idParam) async {
    _dsaProvider.submitschedule(schedule.toString(), idParam);
  }

  Future<void> onRefresh() async {
    change(null, status: RxStatus.loading());
    return onInit();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('=== DSA CONTROLLER INIT ===');
    await getDataDSA();
  }
}
