import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tp_final/helpers/clientes.dart';

class ClienteMetodos {
  static const String url = 'http://localhost:3003/sistema/clientes';

  Future<Clientes> createCliente(
    String nomeCliente,
    String enderecoCliente,
    String emailCliente,
    String telefoneCliente,
  ) async {
    final http.Response response = await http.post(
      '$url',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nomeCliente': nomeCliente,
        'enderecoCliente': enderecoCliente,
        'emailCliente': emailCliente,
        'telefoneCliente': telefoneCliente,
        'statusCliente': true,
      }),
    );
    if (response.statusCode == 200) {
      return Clientes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to CREATE USER ${response.statusCode.toString()}');
    }
  }

  Future<Clientes> updateCliente(
    int id,
    String nomeCliente,
    String enderecoCliente,
    String emailCliente,
    String telefoneCliente,
    String status,
  ) async {
    final http.Response response = await http.put(
      'http://localhost:3003/sistema/clientes/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nomeCliente': nomeCliente,
        'enderecoCliente': enderecoCliente,
        'emailCliente': emailCliente,
        'telefoneCliente': telefoneCliente,
        'statusCliente': status,
      }),
    );
    if (response.statusCode == 200) {
      return Clientes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Clientes> deleteCliente(var id) async {
    final http.Response response = await http.delete(
      'http://localhost:3003/sistema/clientes/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Clientes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete cliente.');
    }
  }

  Future<List<Clientes>> pegaDados() async {
    final response = await http.get('$url');
    if (response.statusCode == 200) {
      return compute(parseDados, response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Clientes>> pegaDadosWhere(String nome) async {
    final response =
        await http.get('http://localhost:3003/sistema/clientes/$nome');
    if (response.statusCode == 200) {
      return compute(parseDados, response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<Clientes> parseDados(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Clientes>((json) => Clientes.fromJson(json)).toList();
  }
}