import 'package:flutter/material.dart';
import 'package:tp_final/constants/colors.dart';
import 'package:tp_final/widgets/drawer.dart';
import 'package:tp_final/widgets/screen_button.dart';

class HomePage extends StatelessWidget {
  //init: SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(context),
      appBar: AppBar(
        title: Text('INICIO'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScreenButton(
                  color: kButtonClientes,
                  textScreen: 'Clientes',
                  screenNav: '/clienteScreen',
                ),
                SizedBox(
                  height: 10.0,
                ),
                ScreenButton(
                  color: kButtonClientes,
                  textScreen: 'Adicionar Cliente',
                  screenNav: '/addcliente',
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScreenButton(
                  color: kButtonPedidos,
                  textScreen: 'Pedidos',
                  screenNav: '/pedidoScreen',
                ),
                SizedBox(
                  height: 10.0,
                ),
                ScreenButton(
                  color: kButtonPedidos,
                  textScreen: 'Adicionar Pedidos',
                  screenNav: '/addPedido',
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScreenButton(
                  color: kButtonProdutos,
                  textScreen: 'Produtos',
                  screenNav: '/produtoScreen',
                ),
                SizedBox(
                  height: 10.0,
                ),
                ScreenButton(
                  color: kButtonProdutos,
                  textScreen: 'Adicionar Produto',
                  screenNav: '/addProduto',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
