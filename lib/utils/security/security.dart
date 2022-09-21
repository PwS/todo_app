/*
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/utils/utils.dart';

void secureStorage() async {
  var containsEncryptionKey = await flutterSecureStorage.containsKey(key: 'key');
  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await flutterSecureStorage.write(key: 'key', value: base64UrlEncode(key));
  }
  var encryptionKey = base64Url.decode(await flutterSecureStorage.read(key: 'key') ?? '');
  var encryptedBox = await Hive.openBox<Sale>(kSalesBox,
      encryptionCipher: HiveAesCipher(encryptionKey));
}
*/
