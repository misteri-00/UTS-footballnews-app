import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';

class SettingPage extends StatelessWidget {
  final Color _primaryColor = Colors.green[700]!;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan Aplikasi"),
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),


            _buildSettingsSection(
              title: "Tampilan & Tema",
              children: [
                _buildSwitchTile(
                  icon: Icons.dark_mode,
                  title: "Mode Gelap",
                  value: themeNotifier.isDarkMode,
                  onChanged: (value) {
                    themeNotifier.toggleTheme();
                  },
                ),
              ],
            ),

            const SizedBox(height: 25),


            _buildSettingsSection(
              title: "Pengaturan Umum",
              children: [
                _buildSwitchTile(
                  icon: Icons.notifications_active,
                  title: "Izinkan Notifikasi",
                  value: true, 
                  onChanged: (value) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(value ? "Notifikasi diaktifkan" : "Notifikasi dinonaktifkan")),
                    );
                  },
                ),
                const Divider(height: 1),
                _buildListTile(
                  icon: Icons.language,
                  title: "Bahasa",
                  subtitle: "Indonesia",
                  onTap: () {

                  },
                ),
              ],
            ),

            const SizedBox(height: 25),


            _buildSettingsSection(
              title: "Tentang",
              children: [
                _buildListTile(
                  icon: Icons.info,
                  title: "Tentang Aplikasi",
                  onTap: () {
                    _showAppAboutDialog(context);
                  },
                ),
                const Divider(height: 1),
                _buildListTile(
                  icon: Icons.security,
                  title: "Kebijakan Privasi",
                  onTap: () {
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildSettingsSection({required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _primaryColor,
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: _primaryColor),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: _primaryColor,
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: _primaryColor),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _showAppAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: "Football Info App",
      applicationVersion: "1.0.0",
      applicationIcon: Icon(Icons.sports_soccer, size: 40, color: _primaryColor),
      children: [
        const Text("Aplikasi informasi sepak bola terkini, dibuat dengan Flutter."),
      ],
    );
  }
}