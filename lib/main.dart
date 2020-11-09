import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tp_final/constants/colors.dart';
import 'package:tp_final/first_screen.dart';
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
            title: 'Sistema',
            builder: (context, widget) => ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, widget),
                maxWidth: 2460,
                minWidth: 450,
                defaultScale: true,
                breakpoints: [
                  ResponsiveBreakpoint.resize(450, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  ResponsiveBreakpoint.resize(1366, name: DESKTOP),
                  ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ],
                background: Container(color: Color(0xFFF5F5F5))),
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(),
              '/firstScreen': (context) => FirstScreen(),
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
            onUnknownRoute: (RouteSettings settings) {
              return MaterialPageRoute<void>(
                settings: settings,
                builder: (BuildContext context) => Scaffold(
                  body: Stack(
                    children: [
                      SizedBox(
                        width: 250.0,
                        child: TextLiquidFill(
                          text: 'NOT FOUND',
                          waveColor: Colors.blueAccent,
                          boxBackgroundColor: kRedColor,
                          textStyle: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                          ),
                          boxHeight: 300.0,
                        ),
                      ),
                      Expanded(child: Container(color: kRedColor))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
