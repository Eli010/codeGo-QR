import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? isRequired;
  const CommonTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isRequired});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: kBrandPrimaryColor.withOpacity(0.4),
        //     blurRadius: 2,
        //     offset: const Offset(1, 3),
        //     // blurStyle: BlurStyle.outer,
        //   ),
        // ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (String? value) {
          if (value != null && value.isEmpty && isRequired == true) {
            return "Campo obligatorio";
          }
          return null;
        },
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontWeight: FontWeight.w600),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            //le damos el borde de nuestra texfield pero el modo focus;
            borderRadius: BorderRadius.circular(16.0),
            //le damos el color y ancho a nuestra linea inferior;
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          //cambiamos el color de relleno;
          fillColor: Colors.black26,
          //aceptamos el cambio del color de relleno;
          filled: true,
          //manejamos el paddion de nuestro texfield;
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          //el mensaje post llenado;
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
