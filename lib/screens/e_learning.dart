import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String category;

  Book({required this.title, required this.author, required this.category});
}

final List<Book> books = [
  Book(title: 'Matematika', author: 'Dicky Susanta', category: 'Matematika'),
  Book(title: 'Fisika', author: 'Dian Sastro', category: 'Sains'),
  Book(title: 'Sejarah', author: 'Ridwan Kamil', category: 'Sejarah'),
  Book(title: 'Bahasa Indonesia', author: 'Joko Diranto', category: 'Bahasa')
];

class ELearning extends StatefulWidget {
  const ELearning({super.key});

  @override
  _ELearningState createState() => _ELearningState();
}

class _ELearningState extends State<ELearning> {
  String selectedCategory = 'Semua';
  String searchQuery = '';
  List<Book> displayedBooks = books;

  final List<String> categories = ['Semua', 'Matematika', 'Sains', 'Sejarah', 'Tes'];

  void _onCategorySelected(String category) {
    setState(() {
      // set kategori yang dipilih pengguna
      selectedCategory = category;
      // panggil fungsi untuk memfilter buku berdasarkan kategori dan pencarian
      _filterBooks();
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      // set query pencarian berdasarkan input pengguna
      searchQuery = query;
      // panggil fungsi untuk memfilter buku berdasarkan kategori dan pencarian
      _filterBooks();
    });
  }

  void _filterBooks() {
    // List kosong untuk menampung buku yang telah difilter
    List<Book> filteredBooks = [];

    // Algoritma linear search untuk filter kategori
    // Menggunakan perulangan for dengan indeks
    for (int i = 0; i < books.length; i++) {
      // Jika kategori yang dipilih adalah 'Semua' atau kategori buku cocok dengan kategori yang dipilih
      if (selectedCategory == 'Semua' || books[i].category == selectedCategory) {
        // Tambahkan buku ke dalam list filteredBooks
        filteredBooks.add(books[i]);
      }
    }

    // Cek apakah query pencarian tidak kosong
    if (searchQuery.isNotEmpty) {
      // List kosong untuk menampung buku yang memenuhi kriteria pencarian
      List<Book> searchFilteredBooks = [];

      // Algoritma linear search untuk filter berdasarkan query pencarian
      for (int i = 0; i < filteredBooks.length; i++) {
        // Cek apakah judul atau nama penulis buku mengandung kata kunci pencarian (case-insensitive)
        if (filteredBooks[i].title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            filteredBooks[i].author.toLowerCase().contains(searchQuery.toLowerCase())) {
          // Jika cocok, tambahkan buku ke dalam list searchFilteredBooks
          searchFilteredBooks.add(filteredBooks[i]);
        }
      }

      // Ganti daftar buku yang difilter dengan daftar buku yang memenuhi kriteria pencarian
      filteredBooks = searchFilteredBooks;
    }

    // Update state untuk menampilkan buku yang sudah difilter
    setState(() {
      displayedBooks = filteredBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            leading: const SizedBox.shrink(),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(50.0),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bg_header.png'), // Sesuaikan sesuai kebutuhan
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white.withOpacity(0.5), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                }, // Tambahkan aksi navigasi di sini
                              ),
                              const SizedBox(width: 16.0),
                              const Text(
                                'E-Learning',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Cari...',
                                    prefixIcon: const Icon(Icons.search), // Icon pencarian di dalam field
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  onChanged: _onSearchChanged, // Search as user types
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.0,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ChoiceChip(
                          label: Text(categories[index]),
                          selected: selectedCategory == categories[index],
                          onSelected: (selected) {
                            _onCategorySelected(categories[index]);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(width: 8.0),
                      itemCount: categories.length, // Sesuaikan jumlah kategori
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.6, // Sesuaikan rasio aspek untuk tinggi kartu yang diinginkan
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    children: List.generate(
                      displayedBooks.length,
                          (index) {
                        final book = displayedBooks[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 4.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Image section
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                                  child: Image.asset(
                                    'assets/ebook.jpg', // Sesuaikan dengan aset gambar Anda
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Details section
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        book.title,
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        'Oleh : ${book.author}',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Tambahkan aksi baca di sini
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.amber,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        ),
                                        child: const Text(
                                          'Baca',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
