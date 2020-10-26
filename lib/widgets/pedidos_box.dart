import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tp_final/constants/colors.dart';
import 'package:tp_final/constants/constants.dart';
import 'package:tp_final/services/pedido_metodos.dart';
import 'package:tp_final/widgets/alert_edit_widget.dart';
import 'package:tp_final/widgets/snack_bar.dart';
import 'package:tp_final/widgets/widgets.dart';

class MyBoxPedidos extends StatefulWidget {
  final int id;
  final int itemsPedido;
  final String nomePedido;
  final double precoPedido;
  final int idCliente;
  final String nomeCliente;
  final IconData icone;
  final Color color;

  MyBoxPedidos({
    Key key,
    this.itemsPedido,
    this.nomePedido,
    this.precoPedido,
    this.icone,
    this.color,
    this.id,
    this.idCliente,
    this.nomeCliente,
  }) : super(key: key);

  @override
  _MyBoxPedidosState createState() => _MyBoxPedidosState();
}

class _MyBoxPedidosState extends State<MyBoxPedidos> {
  final precoController = TextEditingController();
  final itemController = TextEditingController();
  final nomeController = TextEditingController();

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
                    "Produto Pedido: ${widget.nomePedido}",
                    style: TextStyle(fontSize: 22.0),
                  ),
                  Text("QTD items: " + widget.itemsPedido.toString()),
                  Text(
                      "Valor pedido: " + 'R\$' + widget.precoPedido.toString()),
                  Text('Cliente ID: ' + widget.idCliente.toString()),
                  Text('Nome Cliente: ' + widget.nomeCliente),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 100.0,
                        height: 35.0,
                        child: RaisedButton(
                          onPressed: () {
                            editPedidoAlert(
                              context,
                              widget.nomePedido,
                              widget.itemsPedido,
                              widget.precoPedido,
                              widget.id,
                            );
                            setState(() {});
                          },
                          child: kEditRow,
                        ),
                      ),
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

  editPedidoAlert(
      context, String nomePedido, int itemPedido, double precoPedido, int id) {
    Random random = new Random();
    int randomNumber = random.nextInt(99 - 20);
    Alert(
      context: context,
      title: "Editar Usuario: $nomePedido",
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
            alertTextField(nomeController, '$nomePedido', null,
                FontAwesomeIcons.productHunt),
            alertTextField(
                itemController, '$itemPedido', null, FontAwesomeIcons.database),
            alertTextField(precoController, precoPedido.toString(), null,
                Icons.monetization_on),
          ],
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            _atualizarPedido(pedidoMetodo, widget, id, nomeController,
                itemController, precoController);
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/homePage', (Route<dynamic> route) => false);
            snackBAr(context, kSnackUpdateTitle, kSnackUpdateMessage,
                kSnackBarColor);
          },
          child: Text(
            "Salvar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  _atualizarPedido(
    PedidosMetodo pedidoMetodos,
    MyBoxPedidos widget,
    int id,
    TextEditingController nomeController,
    TextEditingController itemsController,
    TextEditingController precoController,
  ) {
    pedidoMetodos.updatePedido(
      id,
      nomeController.text == '' ? widget.nomePedido : nomeController.text,
      itemsController.text == ''
          ? widget.itemsPedido
          : int.parse(itemsController.text),
      precoController.text == ''
          ? widget.precoPedido
          : double.parse(precoController.text),
    );
  }
}
