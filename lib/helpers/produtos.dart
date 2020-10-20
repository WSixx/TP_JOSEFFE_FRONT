// To parse this JSON data, do
//
//     final pedidos = pedidosFromJson(jsonString);

import 'dart:convert';

List<Produtos> pedidosFromJson(String str) =>
    List<Produtos>.from(json.decode(str).map((x) => Produtos.fromJson(x)));

String pedidosToJson(List<Produtos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produtos {
  Produtos({
    this.id,
    this.produtoNome,
    this.produtoPrecoCusto,
    this.produtoPrecoVenda,
    this.produtoQtd,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String produtoNome;
  final double produtoPrecoCusto;
  final double produtoPrecoVenda;
  final int produtoQtd;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Produtos.fromJson(Map<String, dynamic> json) => Produtos(
        id: json["id"],
        produtoNome: json["produtoNome"],
        produtoPrecoCusto: json["produtoPrecoCusto"],
        produtoPrecoVenda: json["produtoPrecoVenda"],
        produtoQtd: json["produtoQtd"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "produtoNome": produtoNome,
        "produtoPrecoCusto": produtoPrecoCusto,
        "produtoPrecoVenda": produtoPrecoVenda,
        "produtoQtd": produtoQtd,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
