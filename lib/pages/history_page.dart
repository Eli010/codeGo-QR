import 'package:codigo6_qr/db/db_admin.dart';
import 'package:codigo6_qr/models/qr_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // print(DBAdmin().getQRList());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Historial",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Listado general de tus QR registrados",
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 18,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: DBAdmin().getQRList(),
                  builder: (context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      // List qrList = snap.data;
                      List<QRModel> qrList = snap.data;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        //toma la refencia la cantidad de hijos que tenga
                        shrinkWrap: true,
                        itemCount: qrList.length,
                        itemBuilder: (BuildContext context, int index) {
                          //TODO: validar si es un url o no
                          //print(qrList[index].url)
                          // bool isUrl = false;
                          // //si es que url contiene un http
                          // if (qrList[index].url.contains("http")) {
                          //   isUrl = true;
                          // }
                          bool isUrl = qrList[index].url.contains("http");

                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 14.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.09),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            size: 16,
                                            color: Colors.white54,
                                          ),
                                          Text(
                                            " ${qrList[index].datetime}",
                                            style: const TextStyle(
                                              color: Colors.white54,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        // qrList[index]["title"],
                                        qrList[index].title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        qrList[index].observation,
                                        style: const TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isUrl
                                    ? IconButton(
                                        onPressed: () {
                                          Uri uri = Uri.parse(
                                              "https://www.qr-code-generator.com/");
                                          // Uri uri = Uri.parse(qrList[index].url);
                                          launchUrl(uri,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        },
                                        icon: const Icon(
                                          Icons.link,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const SizedBox(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.qr_code,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
