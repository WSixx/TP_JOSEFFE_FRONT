import 'package:flutter/material.dart';
import 'package:tp_final/constants/colors.dart';
import 'package:tp_final/widgets/appBar.dart';
import 'package:tp_final/widgets/drawer.dart';
import 'package:tp_final/widgets/screen_button.dart';

class HomePage extends StatelessWidget {
  //init: SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: myDrawer(context),
      body: Center(
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScreenButton(
                      color: kButtonClientesColor,
                      textScreen: 'Clientes',
                      screenNav: '/clienteScreen',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ScreenButton(
                      color: kButtonClientesColor,
                      textScreen: 'Adicionar Cliente',
                      screenNav: '/addcliente',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScreenButton(
                      color: kButtonPedidosColor,
                      textScreen: 'Pedidos',
                      screenNav: '/pedidoScreen',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ScreenButton(
                      color: kButtonPedidosColor,
                      textScreen: 'Adicionar Pedidos',
                      screenNav: '/addPedido',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScreenButton(
                      color: kButtonProdutosColor,
                      textScreen: 'Produtos',
                      screenNav: '/produtoScreen',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ScreenButton(
                      color: kButtonProdutosColor,
                      textScreen: 'Adicionar Produto',
                      screenNav: '/addProduto',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
