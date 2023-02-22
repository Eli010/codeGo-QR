import 'dart:io';

import 'package:codigo6_qr/pages/register_page.dart';
import 'package:codigo6_qr/ui/general/colores.dart';
import 'package:codigo6_qr/ui/widgets/common_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerPage extends StatefulWidget {
  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String urlData = "";

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null && result!.code != null) {
          print("SSSSSSSSSsSS ${result!.code}");
          urlData = result!.code!;
        }
      });
    });
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      if (Platform.isAndroid) {
        controller!.pauseCamera();
      }
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(),
          // child: _buildQrView(context),
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              width: double.infinity,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    urlData.isEmpty
                        ? "Por favor escanea un codigo QR."
                        : urlData,
                    // "https://tecsup.webex.com/webappng/sites/tecsup/meeting/info/e93e10fbe66c48f9afbeafe3cd80dcb5?MTID=m3f644348e33623a9a19da86f1fb9d024&meetingAuthToken=QUhTSwAAAAYNfkEqmCiPRS17gtSS%2FQRMJ1xiaBss61V%2FygJZCzUqIwjv8y7tr1OV3NklAwsAZlVz2hcl8lRltByjDD1wi4mZJd6wjGgVnJQ3yxX3zxBJUpS%2F8ZQ%2FUIgITdLTy58dHyWrU79HrUlcqBCjo4UqpbpEPjavWOgmn26YgaFbWcn0DTXxPNsGBzHKeLAPsCcg2sJng%2BrqpuqBHwoBGiTnYusTmzKYNeS9x7eJCH3kuKBWYQ%3D%3D&siteurl=tecsup",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CommonButtonWidget(
                    onPressed: !urlData.isNotEmpty
                        ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ));
                          }
                        : null,
                    text: "Registrar",
                  )
                ],
              ),
            )),
      ],
    ));
  }
}
