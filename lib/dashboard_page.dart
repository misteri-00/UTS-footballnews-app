import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'setting.dart'; // Pastikan file setting.dart sudah dibuat dan diimpor

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  bool _showWelcomeMessage = true;

  final List<Widget> _pages = [
    HomePage(),
    DataPage(),
    ProfilePage(),
    SettingPage(), // Tambahkan halaman Setting
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _showWelcomeMessage = false;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green[700],
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 32, width: 32),
            const SizedBox(width: 10),
            const Text(
              "BeritaKu Sepakbola",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Tambahkan logika pencarian jika diperlukan
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Tampilkan popup halaman notifikasi
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Notifikasi"),
                    content: SizedBox(
                      width: double.maxFinite,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.info,
                              color: Colors.green,
                            ),
                            title: const Text("Update Jadwal"),
                            subtitle: const Text(
                              "Jadwal pertandingan telah diperbarui.",
                            ),
                            onTap: () {
                              Navigator.of(context).pop(); // Tutup dialog
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Detail notifikasi dibuka"),
                                ),
                              );
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(
                              Icons.sports_soccer,
                              color: Colors.green,
                            ),
                            title: const Text("Hasil Pertandingan"),
                            subtitle: const Text(
                              "Persib Bandung menang 2-1 atas Persija.",
                            ),
                            onTap: () {
                              Navigator.of(context).pop(); // Tutup dialog
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Detail hasil pertandingan dibuka",
                                  ),
                                ),
                              );
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(
                              Icons.newspaper,
                              color: Colors.green,
                            ),
                            title: const Text("Berita Baru"),
                            subtitle: const Text(
                              "Cristiano Ronaldo mencetak hattrick!",
                            ),
                            onTap: () {
                              Navigator.of(context).pop(); // Tutup dialog
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Detail berita dibuka"),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                        },
                        child: const Text(
                          "Tutup",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_showWelcomeMessage)
            Container(
              width: double.infinity,
              color: Colors.green[100],
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Selamat Datang Adi!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: _pages[_selectedIndex],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.green[700],
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: 'Data Bola',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ), // Tambahkan item Setting
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> berita = [
    {
      "judul": "Indonesia Lolos ke Final Piala AFF 2025! 🇮🇩",
      "isi":
          "Timnas Indonesia melaju ke final setelah menyingkirkan Thailand 3-1 di semifinal. Laga final akan digelar di Stadion Utama Gelora Bung Karno minggu depan.",
    },
    {
      "judul": "Cristiano Ronaldo Cetak Hattrick ke-65! ⚽",
      "isi":
          "Ronaldo mencetak tiga gol untuk Al-Nassr dalam kemenangan 4-0 atas Al-Hilal. Di usia 40 tahun, ia masih tak terbendung!",
    },
    {
      "judul": "Persib Bandung Puncaki Klasemen Liga 1 🏆",
      "isi":
          "Dengan kemenangan 2-1 atas Persija Jakarta, Persib kini memimpin klasemen Liga 1 dengan 45 poin.",
    },
  ];

  final List<Map<String, String>> highlightPemain = [
    {
      "nama": "Dalberto",
      "klub": "Arema FC",
      "foto": "assets/top1.jpeg",
      "gol": "10 Gol",
    },
    {
      "nama": "Maxwell Souza",
      "klub": "Persija Jakarta",
      "foto": "assets/top2.jpeg",
      "gol": "8 Gol",
    },
    {
      "nama": "Mariano Peralta",
      "klub": "Borneo FC",
      "foto": "assets/top3.webp",
      "gol": "7 Gol",
    },
  ];

  final List<Map<String, dynamic>> klasemen = [
    {"pos": 1, "klub": "Borneo FC", "poin": 27},
    {"pos": 2, "klub": "Persija Jakarta", "poin": 20},
    {"pos": 3, "klub": "Malut United", "poin": 20},
    {"pos": 4, "klub": "Persib Bandung", "poin": 20},
    {"pos": 5, "klub": "Persita", "poin": 18},
    {"pos": 6, "klub": "PSIM", "poin": 18},
    {"pos": 7, "klub": "Arema FC", "poin": 15},
    {"pos": 8, "klub": "Bhayangkara FC", "poin": 15},
    {"pos": 9, "klub": "Persebaya", "poin": 14},
    {"pos": 10, "klub": "Bali United", "poin": 13},
    {"pos": 11, "klub": "Persik", "poin": 11},
    {"pos": 12, "klub": "Madura United", "poin": 10},
    {"pos": 13, "klub": "Dewa United", "poin": 10},
    {"pos": 14, "klub": "PSM Makassar", "poin": 9},
    {"pos": 15, "klub": "Persijap", "poin": 8},
    {"pos": 16, "klub": "PSBS Biak", "poin": 6},
    {"pos": 17, "klub": "Persis", "poin": 5},
    {"pos": 18, "klub": "Semen Padang", "poin": 4},
  ];
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await Future.delayed(const Duration(seconds: 1)),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/juara.webp',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green[700]?.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Berita Sepakbola Terkini ⚽",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // --- Berita Card ---
            ...berita.map(
              (b) => Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: const Icon(Icons.newspaper, color: Colors.green),
                  title: Text(
                    b["judul"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(b["isi"]!),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Divider(thickness: 2, color: Colors.green[200]),
            const SizedBox(height: 10),

            // --- Highlight Pemain ---
            Text(
              "🔥 Pemain yang Sedang Bersinar",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: highlightPemain.map((p) {
                  return Container(
                    width: 160,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.asset(
                            p["foto"]!,
                            height: 100,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                p["nama"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                p["klub"]!,
                                style: const TextStyle(fontSize: 13),
                              ),
                              Text(
                                p["gol"]!,
                                style: TextStyle(color: Colors.green[800]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 15),
            Divider(thickness: 2, color: Colors.green[200]),
            const SizedBox(height: 10),

            // --- Klasemen ---
            Text(
              "🏆 Klasemen Liga 1 Indonesia",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: klasemen.map((k) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green[700],
                      child: Text(
                        k["pos"].toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      k["klub"]!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Text(
                      "${k["poin"]} pts",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DataPage extends StatelessWidget {
  final List<Map<String, String>> jadwal = [
    {
      "laga": "PSIM vs Persik",
      "tanggal": "31 Okt 2025",
      "skor": "2 - 1",
      "ke": "12",
    },
    {
      "laga": "Persija Jakarta vs PSBS Biak",
      "tanggal": "31 Okt 2025",
      "skor": "3 - 1",
      "ke": "12",
    },
    {
      "laga": "Bhayangkara FC vs Persita",
      "tanggal": "1 Nov 2025",
      "skor": "1 - 1",
      "ke": "12",
    },
    {
      "laga": "Bali United vs Persib Bandung",
      "tanggal": "1 Nov 2025",
      "skor": "0 - 1",
      "ke": "12",
    },
    {
      "laga": "PSM Makassar vs Madura United",
      "tanggal": "2 Nov 2025",
      "skor": "1 - 1",
      "ke": "12",
    },
    {
      "laga": "Persebaya vs Persis",
      "tanggal": "2 Nov 2025",
      "skor": "2 - 1",
      "ke": "12",
    },
    {
      "laga": "Persijap vs Malut United",
      "tanggal": "3 Nov 2025",
      "skor": "1 - 2",
      "ke": "12",
    },
    {
      "laga": "Semen Padang vs Arema FC",
      "tanggal": "3 Nov 2025",
      "skor": "1 - 2",
      "ke": "12",
    },
    {
      "laga": "Borneo FC vs Dewa United",
      "tanggal": "5 Nov 2025",
      "skor": "4 - 0",
      "ke": "12",
    },
    {
      "laga": "PSIM vs Dewa United",
      "tanggal": "22 Okt 2025",
      "skor": "2 - 0",
      "ke": "11",
    },
    {
      "laga": "Madura United vs Persija Jakarta",
      "tanggal": "24 Okt 2025",
      "skor": "0 - 0",
      "ke": "11",
    },
    {
      "laga": "PSBS Biak vs Persebaya",
      "tanggal": "24 Okt 2025",
      "skor": "0 - 0",
      "ke": "11",
    },
    {
      "laga": "Persik vs PSM Makassar",
      "tanggal": "25 Okt 2025",
      "skor": "1 - 1",
      "ke": "11",
    },
    {
      "laga": "Bali United vs Persita",
      "tanggal": "25 Okt 2025",
      "skor": "0 - 0",
      "ke": "11",
    },
    {
      "laga": "Malut United vs Semen Padang",
      "tanggal": "26 Okt 2025",
      "skor": "1 - 0",
      "ke": "11",
    },
    {
      "laga": "Arema FC vs Borneo FC",
      "tanggal": "26 Okt 2025",
      "skor": "1 - 3",
      "ke": "11",
    },
    {
      "laga": "Persib Bandung vs Persis",
      "tanggal": "27 Okt 2025",
      "skor": "2 - 0",
      "ke": "11",
    },
    {
      "laga": "Bhayangkara FC vs Persijap",
      "tanggal": "27 Okt 2025",
      "skor": "2 - 0",
      "ke": "11",
    },
  ];

  final int totalPertandingan = 34;

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, String>>> groupedJadwal = {};
    for (var j in jadwal) {
      groupedJadwal.putIfAbsent(j["ke"]!, () => []);
      groupedJadwal[j["ke"]!]!.add(j);
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Jadwal & Hasil Pertandingan ⚽",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
          ),
          const SizedBox(height: 15),
          ...groupedJadwal.entries.map((entry) {
            String ke = entry.key;
            List<Map<String, String>> listPertandingan = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    "Pertandingan ke-$ke dari $totalPertandingan",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                ...listPertandingan.map(
                  (j) => Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.green[700],
                        child: const Icon(
                          Icons.sports_soccer,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        j['laga']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        "${j['tanggal']} | Skor: ${j['skor']}",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
