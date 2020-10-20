import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_final/screens/add_cliente_screen.dart';
import 'package:tp_final/screens/add_pedido_screen.dart';
import 'package:tp_final/screens/add_produto_screen.dart';
import 'package:tp_final/screens/cliente_screen.dart';
import 'package:tp_final/screens/home_page.dart';
import 'package:tp_final/screens/pedidos_screen.dart';
import 'package:tp_final/screens/produtos_screen.dart';
import 'package:tp_final/screens/splash_screen.dart';
import 'package:tp_final/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(),
              '/homePage': (context) => HomePage(),
              '/clienteScreen': (context) => ClienteScreen(),
              '/pedidoScreen': (context) => PedidosScreen(),
              '/produtoScreen': (context) => ProdutosScreen(),
              '/addcliente': (context) => AddCliente(),
              '/addPedido': (context) => AddPedido(),
              '/addProduto': (context) => AddProduto(),
            },
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme ? dark : light,
          );
        },
      ),
    );
  }
}
