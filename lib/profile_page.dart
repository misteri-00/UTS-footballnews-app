import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            // --- Foto Profil dan Nama ---
            Container(
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/avatar_dummy.png'), // Gambar dummy
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Adi Kurniawan",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "NIM: 23670150",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Email: adi@mail.com",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "🏅 Member Sejak 2025",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --- Info Tambahan ---
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    _buildInfoRow(Icons.school, "Prodi", "Teknik Informatika"),
                    const Divider(height: 25),
                    _buildInfoRow(Icons.calendar_today, "Semester", "5"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // --- Tombol Aksi ---
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profil"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),

            const SizedBox(height: 15),

            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text("Keluar",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.green[700]),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Text(value, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}