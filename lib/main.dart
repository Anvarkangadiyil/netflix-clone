import 'package:flutter/material.dart';
import 'package:netflix_clone_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone_app/application/search/search_bloc.dart';
import 'package:netflix_clone_app/core/colors.dart';
import 'package:netflix_clone_app/domain/core/di/injectable.dart';
import 'package:netflix_clone_app/presentation/main_page/screen_main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            background: backgroundColor,
          ),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
