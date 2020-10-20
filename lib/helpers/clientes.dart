// To parse this JSON data, do
// final cliente = clienteFromJson(jsonString)
import 'dart:convert';

List<Clientes> clienteFromJson(String str) =>
    List<Clientes>.from(json.decode(str).map((x) => Clientes.fromJson(x)));

String clienteToJson(List<Clientes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Clientes {
  Clientes({
    this.idCliente,
    this.nomeCliente,
    this.enderecoCliente,
    this.emailCliente,
    this.telefoneCliente,
    this.statusCliente,
    this.createdAt,
    this.updatedAt,
  });

  final int idCliente;
  final String nomeCliente;
  final String enderecoCliente;
  final String emailCliente;
  final String telefoneCliente;
  final bool statusCliente;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Clientes.fromJson(Map<String, dynamic> json) => Clientes(
        idCliente: json["idCliente"],
        nomeCliente: json["nomeCliente"],
        enderecoCliente: json["enderecoCliente"],
        emailCliente: json["emailCliente"],
        telefoneCliente: json["telefoneCliente"],
        statusCliente: json["statusCliente"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "idCliente": idCliente,
        "nomeCliente": nomeCliente,
        "enderecoCliente": enderecoCliente,
        "emailCliente": emailCliente,
        "telefoneCliente": telefoneCliente,
        "statusCliente": statusCliente,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
