import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tp_final/helpers/produtos.dart';

class ProdutosMetodos {
  static const String url =
      'https://backend-final-final.herokuapp.com/produtos';

  Future<Produtos> createProduto(
    String produtoNome,
    double produtoPrecoCusto,
    double produtoPrecoVenda,
    int produtoQtd,
  ) async {
    final http.Response response = await http.post(
      '$url',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'produtoNome': produtoNome,
        'produtoPrecoCusto': produtoPrecoCusto,
        'produtoPrecoVenda': produtoPrecoVenda,
        'produtoQtd': produtoQtd,
      }),
    );
    if (response.statusCode == 201) {
      return Produtos.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to CREATE USER ${response.statusCode.toString()}');
    }
  }

  Future<Produtos> updateCliente(
    int idProduto,
    String produtoNome,
    double produtoPrecoCusto,
    double produtoPrecoVenda,
    int produtoQtd,
  ) async {
    final http.Response response = await http.put(
      'https://backend-final-final.herokuapp.com/$idProduto',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'produtoNome': produtoNome,
        'produtoPrecoCusto': produtoPrecoCusto,
        'produtoPrecoVenda': produtoPrecoVenda,
        'produtoQtd': produtoQtd,
      }),
    );
    if (response.statusCode == 200) {
      return Produtos.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load produtos');
    }
  }

  Future<Produtos> deleteProdutos(int id) async {
    final http.Response response = await http.delete(
      'https://backend-final-final.herokuapp.com/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Produtos.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete produto.');
    }
  }

  Future<List<Produtos>> pegaDados() async {
    final response =
        await http.get('https://backend-final-final.herokuapp.com/produtos');
    if (response.statusCode == 200) {
      return compute(parseDados, response.body);
    } else {
      throw Exception('Failed to load produtos');
    }
  }

  List<Produtos> parseDados(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Produtos>((json) => Produtos.fromJson(json)).toList();
  }
}
