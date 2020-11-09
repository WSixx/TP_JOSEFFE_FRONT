import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_final/constants/colors.dart';
import 'package:tp_final/constants/constants.dart';
import 'package:tp_final/helpers/pedidos.dart';
import 'package:tp_final/services/pedido_metodos.dart';
import 'package:tp_final/widgets/pedidos_box.dart';
import 'package:tp_final/widgets/snack_bar.dart';

class PedidosScreen extends StatefulWidget {
  @override
  _PedidosScreenState createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  PedidosMetodo pedidosMetodos = PedidosMetodo();

  deletarPedido(int id) {
    pedidosMetodos.deletePedido(id);
    setState(() {
      pedidosMetodos.pegaDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pedidos>>(
        future: pedidosMetodos.pegaDados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Scaffold(
                  appBar: AppBar(
                    title: Text("Pedidos"),
                    centerTitle: true,
                  ),
                  body: myList(snapshot.data));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget myList(List<Pedidos> pedidos) {
    return ListView.builder(
      itemCount: pedidos.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: MyBoxPedidos(
                key: UniqueKey(),
                color: kRedColor,
                icone: FontAwesomeIcons.amazon,
                nomePedido: pedidos[index].nomePedido,
                itemsPedido: pedidos[index].itemsPedido,
                precoPedido: pedidos[index].precoPedido,
                idCliente: pedidos[index].clienteIdCliente,
                nomeCliente: pedidos[index].cliente.nomeCliente,
                id: pedidos[index].idPedido,
              ),
            ),
            RaisedButton(
              child: Text('DELETE'),
              onPressed: () {
                deletarPedido(pedidos[index].idPedido);
                snackBAr(context, kSnackDeleteTitle, kSnackDeleteMessage,
                    kSnackBarColor);
              },
            ),
          ],
        );
      },
    );
  }
}
