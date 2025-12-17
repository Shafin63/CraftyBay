// initial setup
// 1. Folder Structure
// 2. Firebase setup
// 3. Firebase crashlytics
// 4. Firebase analytics
// 5. Localization
// 6. Theme
// 7. Routing
// 8. Network Caller

import 'package:crafty_bay/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(CraftyBay());
}