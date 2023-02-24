import 'package:codigo6_qr/db/db_admin.dart';
import 'package:codigo6_qr/models/qr_model.dart';
import 'package:codigo6_qr/ui/widgets/common_button_widget.dart';
import 'package:codigo6_qr/ui/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RegisterPage extends StatelessWidget {
  final String url;
  RegisterPage({super.key, required this.url});

  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _observationCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
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
                        isRequired: true,
                      ),
                      CommonTextFieldWidget(
                        hintText: "Ingrese una observación...",
                        controller: _observationCtrl,
                        isRequired: true,
                      ),
                      CommonTextFieldWidget(
                        hintText: "Ingrese una dirección",
                        controller: _addressCtrl,
                        isRequired: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        color: Colors.white,
                        child: QrImage(
                          data: url,
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: CommonButtonWidget(
                onPressed: () {
                  // QRModel matasquita = QRModel.fromJson(
                  //   {
                  //     "title": _titleCtrl.text,
                  //     "observation": _observationCtrl.text,
                  //     "url": "htttp://comida",
                  //     "address": _addressCtrl.text,
                  //     "datetime": myDate,
                  //   },
                  // );
                  if (_formKey.currentState!.validate()) {
                    FocusScopeNode myFocusScope = FocusScope.of(context);
                    myFocusScope.unfocus();
                    DateFormat myFormat = DateFormat("yyyy/MM/dd - hh:mm a");
                    String myDate = myFormat.format(DateTime.now());
                    QRModel mantequilla = QRModel(
                      title: _titleCtrl.text,
                      observation: _observationCtrl.text,
                      url: url,
                      address: _addressCtrl.text,
                      datetime: myDate,
                    );
                    Future.delayed(
                      const Duration(milliseconds: 300),
                      () {
                        //TODO: falta convertir en singleton
                        DBAdmin admin = DBAdmin();
                        admin.insertQR(mantequilla).then(
                          (value) {
                            if (value >= 0) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              //mostrar un snackBar
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    "Registro Exitoso!!!",
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                    // Future.delayed(
                    //   const Duration(milliseconds: 300),
                    //   () {
                    //     //TODO: falta convertir en singleton
                    //     DBAdmin admin = DBAdmin();
                    //     admin.insertQR(mantequilla).then(
                    //       (value) {
                    //         if (value >= 0) {
                    //           Navigator.pop(context);
                    //           Navigator.pop(context);
                    //           //mostrar un snackBar
                    //           ScaffoldMessenger.of(context).showSnackBar(
                    //             const SnackBar(
                    //               backgroundColor: Colors.green,
                    //               behavior: SnackBarBehavior.floating,
                    //               content: Text(
                    //                 "Registro Exitoso!!!",
                    //               ),
                    //             ),
                    //           );
                    //         }
                    //       },
                    //     );
                    //   },
                    // );
                    // admin.getQRList();
                    // print(mantequilla.toJson());
                  }
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
