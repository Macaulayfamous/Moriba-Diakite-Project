import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:moriba_project/provider/cart_provider.dart';
import 'package:moriba_project/provider/product_provider.dart';
import 'package:moriba_project/views/buyers/auth/login_screen.dart';

import 'package:provider/provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyBRhn82Hwgmmtq-ZLlEYiVnw2xeq5U_ur4",
            appId: '1:546877991786:android:206cfa017ac97150f35313',
            messagingSenderId: '546877991786',
            projectId: 'moriba-ec7b5',
            storageBucket: "gs://moriba-ec7b5.appspot.com",
          ),
        )
      : await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) {
      return ProductProvider();
    }),
    ChangeNotifierProvider(create: (_) {
      return CartProvider();
    })
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Brand-Bold',
      ),
      home: LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}
