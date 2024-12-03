import 'package:sales_supervisor/app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


Future<void> main() async {
  //Add Widgets binding
  final WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Init Local Storage
  await GetStorage.init();
  sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;
  //Todo: Await Native Splash
  //Todo: Init Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  //TOdo: Init Authentication

  //Todo:Init Database
  // await openDatabaseFromAsset()
  //     .then((value) => Get.put(AuthenticationRepository()));



  runApp(const MyApp());
}