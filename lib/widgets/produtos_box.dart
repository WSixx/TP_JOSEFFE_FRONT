import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tp_final/services/pedido_metodos.dart';
import 'package:tp_final/widgets/alert_edit_widget.dart';

class MyBoxProdutos extends StatefulWidget {
  final int id;
  final String nomeProduto;
  final double precoCustoProduto;
  final double precoVendaProduto;

  final IconData icone;
  final Color color;

  MyBoxProdutos({
    Key key,
    this.nomeProduto,
    this.precoCustoProduto,
    this.icone,
    this.color,
    this.id,
    this.precoVendaProduto,
  }) : super(key: key);

  @override
  _MyBoxProdutosState createState() => _MyBoxProdutosState();
}

class _MyBoxProdutosState extends State<MyBoxProdutos> {
  final nomeController = TextEditingController();
  final nascimentoController = TextEditingController();
  final salarioController = TextEditingController();
  PedidosMetodo pedidoMetodo = PedidosMetodo();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  widget.icone,
                  size: 60.0,
                  color: widget.color,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Produto: ${widget.nomeProduto}",
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Text("Preco custo: " + widget.precoCustoProduto.toString()),
                  Text("Preco venda: " + widget.precoVendaProduto.toString()),
                  Row(
                    children: [
                      RaisedButton(
                        onPressed: () {
                          editPedidoAlert(
                            context,
                            widget.nomeProduto,
                            widget.precoCustoProduto,
                            widget.precoVendaProduto,
                            widget.id,
                          );
                          setState(() {});
                        },
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.edit,
                              size: 18.0,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10.0),
                            Text('Editar'),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.0),
                      SizedBox(width: 10.0),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  editPedidoAlert(context, String nomeProduto, double precoCusto,
      double precoVenda, int id) {
    Random random = new Random();
    int randomNumber = random.nextInt(99 - 20);
    Alert(
      context: context,
      title: "Editar Usuario: $nomeProduto",
      content: Container(
        height: 450,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: "http://placekitten.com/2$randomNumber/3$randomNumber",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                width: 110.0,
                height: 110.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            alertTextField(
                nomeController, '$nomeProduto', null, Icons.account_circle),
            alertTextField(salarioController, '$precoCusto',
                [FilteringTextInputFormatter.digitsOnly], Icons.money),
            alertTextField(salarioController, '$precoVenda',
                [FilteringTextInputFormatter.digitsOnly], Icons.money),
            alertTextField(nascimentoController, precoVenda.toString(), null,
                Icons.date_range),
          ],
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            /* networkHelper.updateUser(
              nomeController.text,
              nascimentoController.text,
              double.parse(salarioController.text),
              id,
            );*/
            Navigator.pop(context);
          },
          child: Text(
            "Salvar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
