import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/basicdemo/secondScreen.dart';
import 'package:untitled/basicdemo/stack_view.dart';
import 'package:untitled/basicdemo/typesOfButton.dart';
import 'package:untitled/form/radio_btn.dart';
import 'package:untitled/provider/stream_provider.dart';
import 'package:untitled/socialmeadiaintegreation/facebook_integration.dart';
import 'package:untitled/socialmeadiaintegreation/google_integration.dart';

import 'advancewidgets/Dashboard.dart';
import 'advancewidgets/action_sheet.dart';
import 'advancewidgets/alert_dialog.dart';
import 'advancewidgets/bottom_navigation.dart';
import 'advancewidgets/bottom_sheet.dart';
import 'advancewidgets/card_widget.dart';
import 'advancewidgets/grid_view.dart';
import 'advancewidgets/image_picker.dart';
import 'advancewidgets/multiple_image_picker.dart';
import 'advancewidgets/tab_bar.dart';
import 'api_calling/get_method_api_calling.dart';
import 'api_calling/login_api/login_api_calling.dart';
import 'basicdemo/ImageDemo.dart';
import 'basicdemo/RowWidgets.dart';
import 'basicdemo/SafeAreaExample.dart';
import 'basicdemo/appbar_demo.dart';
import 'basicdemo/columnWidgets.dart';
import 'basicdemo/gesture_detector.dart';
import 'firebase/firestore_demo.dart';
import 'form/basic_form.dart';
import 'listview/listview_demo.dart';
import 'lottie_animation/animation.dart';
import 'notification_demo/local_notification_service.dart';
import 'notification_demo/notification.dart';
import 'provider/changeNotifier_provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /* await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,

  );*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      // themeMode we can check using how the look the theme in testing mode.
      themeMode: ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 2),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const secondScreen()));
                      },
                      child: const Text("Move Second Screen & SnackBar"))),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const columnWidgets()));
                      },
                      child: const Text("Column Widgets"))),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RowWidgets()));
                      },
                      child: const Text("Row Widgets"))),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SafeAreaExample()));
                      },
                      child: const Text("SafeArea Widgets"))),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ImageDemo()));
                      },
                      child: const Text("Image Widgets"))),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()));
                      },
                      child: const Text("Icon Widgets"))),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const typesOfButton()));
                    },
                    child: const Text("Types of Button"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppbarDemo()));
                    },
                    child: const Text("Appbar"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListViewDemo()));
                    },
                    child: const Text("ListView and Navigation Drawer"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StackWidgetsDemo()));
                    },
                    child: const Text("Stack Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const GestureDetectorDemo()));
                    },
                    child: const Text("Gesture Detector Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationPanel()));
                    },
                    child: const Text("BottomNavigation Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TabBarDemo()));
                    },
                    child: const Text("TabBar Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormDemo()));
                    },
                    child: const Text("Form Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RadioBtn()));
                    },
                    child: const Text("RadioButton Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GridViewDemo()));
                    },
                    child: const Text("GridView Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlertDialogDemo()));
                    },
                    child: const Text("AlertDialog Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActionSheetDemo()));
                    },
                    child: const Text("ActionSheet Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CardDemo()));
                    },
                    child: const Text("Card Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomSheetDemo()));
                    },
                    child: const Text("BottomSheet Widgets"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DemoChangeProvider()));
                    },
                    child: const Text("ChangeNotifier Provider"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StreamProviderDemo()));
                    },
                    child: const Text("StreamProvider Provider"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoogleIntegrationDemo()));
                    },
                    child: const Text("Google Integration"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text("FaceBook Integration"),
                  )),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirebaseDemo()));
                    },
                    child: const Text("Firebase"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimationDemo()));
                    },
                    child: const Text("Lottie"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImagePickerScreen()));
                    },
                    child: const Text("ImagePicker"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MultipleImagePicker()));
                    },
                    child: const Text("Multiple ImagePicker"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetApiUserList()));
                    },
                    child: const Text("Get Method API Calling"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginAPICalling()));
                    },
                    child: const Text("Login API Calling"),
                  )),
              Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationDemo()));
                    },
                    child: const Text("Notification"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
