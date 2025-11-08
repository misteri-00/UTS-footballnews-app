import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Pengaturan")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // --- Dark Mode ---
          ListTile(
            leading: const Icon(Icons.dark_mode, color: Colors.green),
            title: const Text("Mode Gelap"),
            trailing: Switch(
              value: themeNotifier.isDarkMode,
              onChanged: (value) {
                themeNotifier.toggleTheme();
              },
            ),
          ),
          const Divider(),

          // --- Notifikasi ---
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.green),
            title: const Text("Notifikasi"),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Tambahkan logika untuk mengaktifkan/mematikan notifikasi
              },
            ),
          ),
          const Divider(),

          // --- Tentang Aplikasi ---
          ListTile(
            leading: const Icon(Icons.info, color: Colors.green),
            title: const Text("Tentang Aplikasi"),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Football Info App",
                applicationVersion: "1.0.0",
                applicationIcon: const Icon(Icons.sports_soccer, size: 40),
                children: [
                  const Text("Aplikasi informasi sepak bola terkini."),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
