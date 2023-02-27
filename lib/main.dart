import 'package:bloc_api/Cubit/univer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'view/page/home_page.dart';
import 'models/model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter( UnversityModelAdapter());
  Hive.registerAdapter(UniverResponseAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  BlocProvider(
        create: (_) => CountryCubit(),
        child: const HomePage(),
      ),
    );
  }
}