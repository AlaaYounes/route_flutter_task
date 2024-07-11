import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_flutter_task/config/theme/theme.dart';
import 'package:route_flutter_task/products/presentation/cubit/cubit.dart';
import 'package:route_flutter_task/products/presentation/pages/product_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit()..getProducts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.myTheme,
        home: ProductListScreen(),
      ),
    );
  }
}
