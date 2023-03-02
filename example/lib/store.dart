import 'dart:developer';

import 'package:flutter/services.dart';



import 'package:phone_number_example/models/region.dart';
import 'package:phone_number_example/phone_number_util.dart';

class Store {
  final PhoneNumberUtil plugin;

  Store(this.plugin);

  List<Region>? _regions;

  Future<List<Region>> getRegions() async {
    if (_regions == null) {
      final regions = await plugin.allSupportedRegions();

      // Filter out regions with more than 2 characters
      _regions = regions
          .where((e) => e.code.length <= 2)
          .map((e) => Region(e.code, e.prefix, e.name))
          .toList(growable: false);

      _regions!.sort((a, b) => a.name.compareTo(b.name));
    }
    return _regions ?? [];
  }



  Future<bool> validate(String string, {Region? region}) async {
    log("validate $string for region: ${region?.code}");
    try {
      final result = await plugin.validate(string, regionCode: region?.code);
      return result;
    } on PlatformException catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<String?> carrierRegionCode() async {
    log("fetching carrierRegionCode");
    try {
      final result = await plugin.carrierRegionCode();
      return result;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }
}
