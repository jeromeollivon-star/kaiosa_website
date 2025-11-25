import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/kaiosa_screen.dart';
import 'screens/about_screen.dart';
import 'screens/services_screen.dart';
import 'screens/realisations_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const KaiosaApp());
}

class KaiosaApp extends StatelessWidget {
  const KaiosaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KAIOSA - Conseil en Innovation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF27AE60),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF27AE60),
          secondary: const Color(0xFFF39C12),
        ),
        
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const KaiosaScreen(),
    const AboutScreen(),
    const ServicesScreen(),
    const RealisationsScreen(),
    const ContactScreen(),
  ];

  final List<String> _titles = [
    'Accueil',
    'Kaiosa ?',
    'À propos',
    'Services',
    'Réalisations',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 4,
        title: Row(
          children: [
            Text(
              'KAIOSA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF39C12),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Innovation Concrète',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        actions: isMobile
            ? null
            : [
                for (int i = 0; i < _titles.length; i++)
                  TextButton(
                    onPressed: () => setState(() => _selectedIndex = i),
                    style: TextButton.styleFrom(
                      foregroundColor: _selectedIndex == i
                          ? const Color(0xFFF39C12)
                          : Colors.white,
                    ),
                    child: Text(
                      _titles[i],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                const SizedBox(width: 20),
              ],
      ),
      drawer: isMobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xFF2C3E50),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'KAIOSA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Innovation Concrète',
                          style: TextStyle(
                            color: const Color(0xFFF39C12),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (int i = 0; i < _titles.length; i++)
                    ListTile(
                      leading: Icon(
                        _getIconForIndex(i),
                        color: _selectedIndex == i
                            ? const Color(0xFF27AE60)
                            : Colors.grey,
                      ),
                      title: Text(
                        _titles[i],
                        style: TextStyle(
                          color: _selectedIndex == i
                              ? const Color(0xFF27AE60)
                              : Colors.black87,
                          fontWeight: _selectedIndex == i
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      selected: _selectedIndex == i,
                      onTap: () {
                        setState(() => _selectedIndex = i);
                        Navigator.pop(context);
                      },
                    ),
                ],
              ),
            )
          : null,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_selectedIndex],
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.help_outline;
      case 2:
        return Icons.person;
      case 3:
        return Icons.business_center;
      case 4:
        return Icons.work;
      case 5:
        return Icons.contact_mail;
      default:
        return Icons.circle;
    }
  }
}
