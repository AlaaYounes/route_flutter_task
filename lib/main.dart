import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:route_flutter_task/core/utils/blocObserver.dart';
import 'package:route_flutter_task/core/utils/dependancy_injection.dart' as di;
import 'package:route_flutter_task/myApp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
