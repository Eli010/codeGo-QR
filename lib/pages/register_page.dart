import 'package:codigo6_qr/models/qr_model.dart';
import 'package:codigo6_qr/ui/widgets/common_button_widget.dart';
import 'package:codigo6_qr/ui/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _observationCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    const Text(
                      "Registrar contenido",
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
                      "Por favor ingrese los campos requeridos",
                      style: TextStyle(
                        color: Colors.white,
                        // fontSize: 18,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonTextFieldWidget(
                      hintText: "Ingrese un titulo...",
                      controller: _titleCtrl,
                    ),
                    CommonTextFieldWidget(
                      hintText: "Ingrese una observación...",
                      controller: _observationCtrl,
                    ),
                    CommonTextFieldWidget(
                      hintText: "Ingrese una dirección",
                      controller: _addressCtrl,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      color: Colors.white,
                      child: QrImage(
                        data:
                            "https://esflutter.dev/docs/development/ui/widgets/layout",
                        version: QrVersions.auto,
                        size: 200.0,
                        // backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //!el expanded tiene proble con el uso del singlechildScroll
                    // const Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: CommonButtonWidget(
                onPressed: () {
                  // QRModel model = QRModel(
                  //   title: "Pasta Canten",
                  //   observation: "restaurante de pasta",
                  //   url: "htttp://comida",
                  //   address: "Jr. Lima 345",
                  //   datetime: "",
                  // );
                  // print(model.toJson());
                  DateFormat myFormat = DateFormat("yyyy/MM/dd - hh:mm a");
                  String myDate = myFormat.format(DateTime.now());

                  QRModel matasquita = QRModel.fromJson(
                    {
                      "title": _titleCtrl.text,
                      "observation": _observationCtrl.text,
                      "url": "htttp://comida",
                      "address": _addressCtrl.text,
                      "datetime": myDate,
                    },
                  );
                  // QRModel matasquita2 = QRModel.fromJson({
                  //   "title": _titleCtrl,
                  //   "observation": _observationCtrl,
                  //   "url": "htttp://comida",
                  //   "address": _addressCtrl,
                  //   "datetime": myDate,
                  // });
                  // // print(DateTime.now());
                  print(matasquita.toJson());
                },
                text: "Guardar",
              ),
            ),
          )
        ],
      ),
    );
  }
}
