import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'setting.dart';

class NewsDetailPage extends StatelessWidget {
  final Map<String, String> newsItem;

  const NewsDetailPage({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.green[700]!;
    final String imagePath =
        newsItem["gambar"] ?? 'assets/placeholder.jpg';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Berita"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsItem["judul"] ?? "Judul Tidak Tersedia",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: primaryColor,
              ),
            ),
            const Divider(height: 30, thickness: 2),

            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 5),
                Text(
                  "2 jam lalu",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const Spacer(),
                Text(
                  "Sumber: BeritaKu",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              newsItem["isi"] ?? "Isi berita tidak dapat dimuat.",
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 17, height: 1.5),
            ),

            const SizedBox(height: 40),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Berita dibagikan!")),
                  );
                },
                icon: const Icon(Icons.share),
                label: const Text("Bagikan Berita Ini"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> berita = [
    {
      "judul": "Indonesia Lolos ke Piala Dunia 2025! 🇮🇩",
      "isi":
          "Indonesia kembali mengukir sejarah dengan memastikan tiket ke Piala Dunia U-17 FIFA 2025, usai mencatat dua kemenangan meyakinkan di ajang Piala AsiaAFC U-17 yang tengah digelar di Arab Saudi. Garuda Muda, yang menjadi tuan rumah edisi sebelumnya, kini mencatatkan partisipasi kedua kalinya di turnamen global usia muda tersebut."
          "Anak asuh Nova Arianto membuka kiprah mereka dengan kemenangan mengejutkan 1-0 atas Korea Selatan, lalu melanjutkannya dengan performa dominan saat menaklukkan Yaman 4-1. Evandra Florasta, gelandang 16 tahun yang tampil menawan, menjadi sorotan dalam kemenangan krusial ini.",
      "gambar": "assets/u17.webp",
    },
    {
      "judul": "Cristiano Ronaldo Cetak Hattrick ke-65! ⚽",
      "isi":
          "Ronaldo mencetak tiga gol untuk Al-Nassr dalam kemenangan 4-0 atas Al-Hilal. Di usia 40 tahun, ia masih tak terbendung!",
      "gambar": "assets/hattrick.jpg",
    },
    {
      "judul": "Persib Bandung Puncaki Klasemen Liga 1 🏆",
      "isi":
          "Borneo FC masih sempurna dan menempati posisi puncak klasemen BRI Super League setelah rampungnya pekan ke-11, Rabu malam. Pesut Etam menempati peringkat pertama klasemen Super League dengan 27 poin dari sembilan pertandingan, menyapu bersih semua laga yang sudah dilalui. Pada pekan ke-10, Borneo FC menang besar 4-0 dari tim tamu Dewa United di Stadion Segiri, Samarinda, Rabu.",
      "gambar": "assets/puncak.jpeg",
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

  final Color _primaryColor = Colors.green[700]!;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await Future.delayed(const Duration(seconds: 1)),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainNewsBanner(context),
            const SizedBox(height: 20),
            _buildQuickMenu(context),
            const SizedBox(height: 20),
            _buildSectionHeader("📰 Berita Terbaru", context),
            ...berita.map((b) => _buildNewsCard(context, b)),
            const SizedBox(height: 25),
            Divider(
              thickness: 5,
              color: Colors.grey[200],
              indent: 16,
              endIndent: 16,
            ),
            const SizedBox(height: 15),
            _buildSectionHeader("🔥 Pemain yang Sedang Bersinar", context),
            const SizedBox(height: 10),
            _buildPlayerHighlightList(),
            const SizedBox(height: 25),
            Divider(
              thickness: 5,
              color: Colors.grey[200],
              indent: 16,
              endIndent: 16,
            ),
            const SizedBox(height: 15),
            _buildSectionHeader("🏆 Klasemen Liga 1 Indonesia", context),
            const SizedBox(height: 8),
            _buildStandingsTable(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickMenu(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Profil",
        "icon": Icons.person,
        "page": ProfilePage(),
      },
      {
        "title": "Data",
        "icon": Icons.list,
        "page": DataPage(),
      },
      {
        "title": "Pengaturan",
        "icon": Icons.settings,
        "page": SettingPage(),
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), 
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8, 
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return InkWell(
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => item["page"],
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    item["icon"] as IconData,
                    size: 30,
                    color: _primaryColor,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item["title"] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  
  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: _primaryColor,
        ),
      ),
    );
  }

  Widget _buildMainNewsBanner(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(newsItem: berita.first),
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
            child: Image.asset(
              berita.first["gambar"]!,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 250,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Text(
              berita.first["judul"]!,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, Map<String, String> b) {
    final String thumbnailPath =
        b["gambar"] ??
        'assets/placeholder_thumb.jpg'; 

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailPage(newsItem: b),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  thumbnailPath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      b["judul"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      b["isi"]!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerHighlightList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: highlightPemain.map((p) {
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.asset(
                    p["foto"]!,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 100,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        p["nama"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        p["klub"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: _primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          p["gol"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStandingsTable() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: _primaryColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: const Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    "Pos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Klub",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Poin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ...klasemen.map((k) {
            final isTopThree = k["pos"] <= 3;
            return Container(
              color: isTopThree
                  ? _primaryColor.withOpacity(0.1)
                  : Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Text(
                        k["pos"].toString(),
                        style: TextStyle(
                          fontWeight: isTopThree
                              ? FontWeight.w900
                              : FontWeight.w600,
                          color: isTopThree ? _primaryColor : Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        k["klub"]!,
                        style: TextStyle(
                          fontWeight: isTopThree
                              ? FontWeight.w700
                              : FontWeight.normal,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      "${k["poin"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isTopThree ? _primaryColor : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
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
  final Color _primaryColor = Colors.green[700]!;

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, String>>> groupedJadwal = {};
    for (var j in jadwal) {
      groupedJadwal.putIfAbsent(j["ke"]!, () => []);
      groupedJadwal[j["ke"]!]!.add(j);
    }

    List<String> sortedKeys = groupedJadwal.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          Center(
            child: Text(
              "Jadwal & Hasil Pertandingan 🗓️",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: _primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...sortedKeys.map((ke) {
            List<Map<String, String>> listPertandingan = groupedJadwal[ke]!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: _primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: _primaryColor.withOpacity(0.4),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    "Pekan ke-$ke dari $totalPertandingan",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ...listPertandingan.map(
                  (j) => Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              j['tanggal']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                j['laga']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: _primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              j['skor']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  bool _showWelcomeMessage = true;

  final Color _primaryColor = Colors.green[700]!;
  final Color _secondaryColor = Colors.green[100]!;

  final List<Widget> _pages = [
    HomePage(),
    DataPage(),
    ProfilePage(),
    SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showWelcomeMessage = false;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  void _showNotificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.notifications, color: _primaryColor),
              const SizedBox(width: 10),
              const Text("Pemberitahuan Terbaru"),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _primaryColor,
                    child: const Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  title: const Text("Update Jadwal"),
                  subtitle: const Text(
                    "Jadwal pertandingan telah diperbarui.",
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Detail notifikasi Update Jadwal dibuka"),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _primaryColor,
                    child: const Icon(
                      Icons.sports_soccer,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  title: const Text("Hasil Pertandingan"),
                  subtitle: const Text(
                    "Persib Bandung menang 2-1 atas Persija. Cek Data Bola!",
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() => _selectedIndex = 1);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _primaryColor,
                    child: const Icon(
                      Icons.newspaper,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  title: const Text("Berita Baru"),
                  subtitle: const Text(
                    "Cristiano Ronaldo mencetak hattrick!",
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewsDetailPage(newsItem: HomePage().berita.first),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Tutup", style: TextStyle(color: _primaryColor)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 32, width: 32),
            const SizedBox(width: 10),
            const Text(
              "BeritaKu Sepakbola",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Fungsi Pencarian")));
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: _showNotificationDialog,
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _showWelcomeMessage
                ? Container(
                    key: const ValueKey('welcome'),
                    width: double.infinity,
                    color: _secondaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      "👋 Selamat Datang Kembali, Adi!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _primaryColor,
                      ),
                    ),
                  )
                : const SizedBox.shrink(key: ValueKey('empty')),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: _pages[_selectedIndex],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: _primaryColor,
          unselectedItemColor: Colors.grey[600],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer_outlined),
              activeIcon: Icon(Icons.sports_soccer),
              label: 'Data Bola',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
