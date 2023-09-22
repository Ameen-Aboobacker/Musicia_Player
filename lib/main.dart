import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:musicia/providers.dart';
import 'package:musicia/view/splash.dart';
import 'model/muzic_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!Hive.isAdapterRegistered(MuzicModelAdapter().typeId)) {
    Hive.registerAdapter(MuzicModelAdapter());
  }

  await Hive.initFlutter();

  await Hive.openBox<MuzicModel>('Playlists');
  await Hive.openBox<int>('Favorites');
  await Hive.openBox<int>('RecentSongs');
  await Hive.openBox<int>('MostlyPlayedSongs');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
            titleMedium: TextStyle(color: Colors.white),
          ),
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
