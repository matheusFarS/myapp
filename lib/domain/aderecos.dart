class Aderecos {
  late int id;
  late String urlImage;
  late String titulo;
  late String descricao;
  late String textoCompleto;

  Aderecos({
    required this.id,
    required this.urlImage,
    required this.titulo,
    required this.descricao,
    required this.textoCompleto,
  });

  Aderecos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    urlImage = json['url_image'];
    descricao = json['descricao'];
    textoCompleto = json['texto_completo'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['titulo'] = titulo;
    json['url_image'] = urlImage;
    json['texto_completo'] = textoCompleto;
    json['descricao'] = descricao;

    return json;
  }
}
