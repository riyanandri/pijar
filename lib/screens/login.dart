import 'package:flutter/material.dart';
import 'package:pijar/screens/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dropdownValue = ValueNotifier<String?>('Sekolah A');

  void _login() {
    const dummyUsername = 'user';
    const dummyPassword = 'password';

    if (_usernameController.text == dummyUsername &&
        _passwordController.text == dummyPassword) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Home()),
      );
    } else {
      // Show an error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar sebagai background
          Positioned.fill(
            child: Image.asset(
              'assets/bg_full.png',
              fit: BoxFit.cover, // Mengatur gambar agar sesuai dengan ukuran layar
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 8.0, // Tambahkan bayangan ke Card
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Nama Sekolah',
                          prefixIcon: Icon(Icons.school),
                          border: OutlineInputBorder(),
                        ),
                        value: _dropdownValue.value,
                        items: <String>['Sekolah A', 'Sekolah B', 'Sekolah C']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          _dropdownValue.value = newValue;
                        },
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)), // Membuat sudut melengkung
                            borderSide: BorderSide(
                              color: Colors.blue, // Warna border
                              width: 2.0, // Ketebalan border
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)), // Sudut melengkung
                            borderSide: BorderSide(
                              color: Colors.blue, // Warna border
                              width: 2.0, // Ketebalan border
                            ),
                          ),
                        ),
                        obscureText: true, // Menyembunyikan teks untuk input password
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (bool? value) {},
                          ),
                          const Text('Ingat Saya'),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.lightBlue,
                            ),
                            child: const Text('Lupa Password?'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _login,  // Call _login method
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.lightBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Masuk'),
                      ),
                      const SizedBox(height: 16.0),
                      // const Text('Atau'),
                      // const SizedBox(height: 16.0),
                      // ElevatedButton.icon(
                      //   onPressed: () {},
                      //   icon: const Icon(Icons.login),
                      //   label: const Text('Login dengan Google'),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.red,
                      //   ),
                      // ),
                      // ElevatedButton.icon(
                      //   onPressed: () {},
                      //   icon: const Icon(Icons.account_circle),
                      //   label: const Text('Login dengan Belajar.id'),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.blue,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
