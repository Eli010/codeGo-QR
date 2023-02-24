class QRModel {
  String title;
  String observation;
  String url;
  String address;
  String datetime;
  QRModel({
    required this.title,
    required this.observation,
    required this.url,
    required this.address,
    required this.datetime,
  });

  //al para crear
  factory QRModel.fromJson(Map<String, dynamic> json) => QRModel(
        // factory QRModel.fromMantequilla(Map<String, dynamic> json) => QRModel(
        //los json son para decirle que usaremos los datos externos
        title: json["title"] ?? "",
        observation: json["observation"] ?? "",
        url: json["url"] ?? "",
        address: json["address"] ?? "",
        datetime: json["datetime"] ?? "",
      );

  //colocamos una funcions especial para que nos construya un mapa
  //con esto podemos usar o llamar como un json o map
  Map<String, dynamic> toJson() => {
        //el "titulo" lo podemos poner cualquier cosa solo es un identificador
        "title": title,
        "observation": observation,
        "url": url,
        "address": address,
        "datetime": datetime,
      };
}
