import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tp_final/helpers/pedidos.dart';

class PedidosMetodo {
  static const String url = 'http://localhost:3003/sistema/pedidos';

  Future<Pedidos> createPedido(
    String nomePedido,
    int itemsPedido,
    double precoPedido,
    int clienteIdCliente,
  ) async {
    final http.Response response = await http.post(
      '$url',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'itemsPedido': itemsPedido,
        'precoPedido': precoPedido,
        'nomePedido': nomePedido,
        'clienteIdCliente': clienteIdCliente,
      }),
    );
    if (response.statusCode == 201) {
      return Pedidos.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to CREATE USER ${response.statusCode.toString()}');
    }
  }

  Future<Pedidos> updateCliente(
    int idPedido,
    int itemsPedido,
    double precoPedido,
  ) async {
    final http.Response response = await http.put(
      '$url',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'itemsPedido': itemsPedido,
        'precoPedido': precoPedido,
      }),
    );
    if (response.statusCode == 200) {
      return Pedidos.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Pedidos> deletePedido(var id) async {
    final http.Response response = await http.delete(
      'http://localhost:3003/sistema/pedidos/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Pedidos.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete pedido.');
    }
  }

  Future<List<Pedidos>> pegaDados() async {
    final response = await http.get('$url');
    if (response.statusCode == 200) {
      return compute(parseDados, response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  List<Pedidos> parseDados(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Pedidos>((json) => Pedidos.fromJson(json)).toList();
  }
}
