import 'package:codigo6_qr/pages/history_page.dart';
import 'package:codigo6_qr/pages/scanner_page.dart';
import 'package:codigo6_qr/ui/general/colores.dart';
import 'package:codigo6_qr/ui/widgets/common_button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBrandSecondColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "SaveQR ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                textAlign: TextAlign.center,
                "Gestiona los codigo QR de tu preferencia  y accede cuando quieras",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  "assets/img/codigo-qr.png",
                  width: width * 0.60,
                ),
              ),
              CommonButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScannerPage(),
                    ),
                  );
                },
                text: "Escanear QR",
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryPage(),
                    ),
                  );
                },
                child: const Text(
                  "Ver Historial",
                  style: TextStyle(
                    color: kBrandPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
