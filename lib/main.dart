import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wulap_application/boxes.dart';
import 'package:wulap_application/category.dart';
import 'package:wulap_application/firebase_options.dart';
import 'package:wulap_application/presentation/add_category_screen/add_category_screen.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/presentation/data/food_menu.dart';
import 'package:wulap_application/presentation/data/member.dart';
import 'package:wulap_application/presentation/data/user_data_provider.dart';
import 'package:wulap_application/presentation/note_screen/note.dart';
import 'package:wulap_application/presentation/note_screen/note_provider.dart';
import 'package:wulap_application/presentation/notifications_screen/NotificationHelper.dart';
import 'package:wulap_application/presentation/notifications_screen/notifications_provider.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder_provider.dart';
import 'package:wulap_application/repository/user_repository.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wulap_application/services/category_data_provider.dart';
import 'core/app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper.initialize();
  await _initializeDependencies();

  runApp(
    MultiProvider(
      providers: _getProviders(),
      child: MyApp(),
    ),
  );
}

Future<void> _initializeDependencies() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAppCheck.instance.activate();

  await Hive.initFlutter();

  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(FoodMenuAdapter());
  Hive.registerAdapter(MemberAdapter());
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(ReminderAdapter());

  boxCategory = await Hive.openBox<Category>('categories');
  boxFoodMenu = await Hive.openBox<FoodMenu>('foodMenus');
  boxMembers = await Hive.openBox<Member>('members');
  boxNotes = await Hive.openBox<Note>('notes');
  boxReminders = await Hive.openBox<Reminder>('reminders');

  final userDataProvider = UserDataProvider();
  await userDataProvider.init();
  Get.put(UserRepository());
}

List<SingleChildWidget> _getProviders() {
  return [
    ChangeNotifierProvider(create: (_) => UserDataProvider()),
    ChangeNotifierProvider(create: (context) => CategoryDataProvider()),
    ChangeNotifierProvider(create: (context) => NoteProvider()),
    Provider<UserRepository>(create: (_) => UserRepository()),
    ChangeNotifierProvider.value(value: ReminderProvider()),
    ChangeNotifierProvider(create: (_) => NotificationsProvider()),
    // Add other providers as needed
  ];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'wulap_application',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigatorService.navigatorKey,
      localizationsDelegates: [
        const AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', '')],
      initialRoute: AppRoutes.splashscreenScreen,
      //initialRoute: AppRoutes.logInScreen,
      routes: {
        '/buy_page': (context) => BuyPage(),
        '/addCategory': (context) => AddCategoryScreen(),
        ...AppRoutes.routes,
      },
    );
  }
}
