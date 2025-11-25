import 'package:flutter/material.dart'; 
import 'screens/home_screen.dart'; 
import 'screens/kaiosa_screen.dart'; 
import 'screens/about_screen.dart'; 
import 'screens/services_screen.dart'; 
import 'screens/realisations_screen.dart'; 
import 'screens/contact_screen.dart'; 
 
void main() { 
  runApp(const MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'KAIOSA', 
      debugShowCheckedModeBanner: false, 
      theme: ThemeData( 
        primaryColor: const Color(0xFF27AE60), 
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF27AE60)), 
        useMaterial3: true, 
      ), 
      home: const MainScreen(), 
    ); 
  } 
} 
