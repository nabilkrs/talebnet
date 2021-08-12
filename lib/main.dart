import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'home.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';




main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

OneSignal.shared.setAppId("4bfb11dc-ebbf-4f7a-87fe-dd88889aa271");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
});

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}


class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here
      home: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('ali').snapshots(),
        builder: (context, snapshot) {
          return  snapshot.data[0]['testing']==true?  Home():SizedBox();
        }
      ),
    );
  }
}
