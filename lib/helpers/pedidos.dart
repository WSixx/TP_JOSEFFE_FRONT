// To parse this JSON data, do
//
//     final pedidos = pedidosFromJson(jsonString);
import 'dart:convert';

import 'package:tp_final/helpers/clientes.dart';

List<Pedidos> pedidosFromJson(String str) =>
    List<Pedidos>.from(json.decode(str).map((x) => Pedidos.fromJson(x)));

String pedidosToJson(List<Pedidos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pedidos {
  Pedidos({
    this.idPedido,
    this.nomePedido,
    this.itemsPedido,
    this.precoPedido,
    this.clienteIdCliente,
    this.cliente,
    this.createdAt,
    this.updatedAt,
  });

  final String nomePedido;
  final int idPedido;
  final int itemsPedido;
  final double precoPedido;
  int clienteIdCliente;
  Clientes cliente;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Pedidos.fromJson(Map<String, dynamic> json) => Pedidos(
        idPedido: json["idPedido"],
        nomePedido: json["nomePedido"],
        itemsPedido: json["itemsPedido"],
        precoPedido: json["precoPedido"],
        clienteIdCliente: json["clienteIdCliente"],
        cliente: Clientes.fromJson(json["cliente"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "idPedido": idPedido,
        "nomePedido": nomePedido,
        "itemsPedido": itemsPedido,
        "precoPedido": precoPedido,
        "clienteIdCliente": clienteIdCliente,
        "cliente": cliente.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
