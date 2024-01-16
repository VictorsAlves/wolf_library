import 'package:flutter/material.dart';
import 'package:wolf_library/utils/rotas_nomeadas.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F7978), // Cor de fundo escolhida
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Nome da biblioteca
            const Text(
              'WOLF LIBRARY',
              style: TextStyle(
                  fontSize: 48,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Espaçamento
            // Logo da biblioteca
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/wolflibrary_logo.png'),
                ),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento
            // Texto secundário
            const Text(
              'Sua jornada literária começa aqui!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20), // Espaçamento
            // Botão "Entrar"
            ElevatedButton(
              onPressed: () {
                // Ação do botão
                Navigator.pushNamed(context, bookListPageRouteName);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFFbcae88), // Cor do texto
              ),
              child: const Text('Entrar'),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               // _buildCircularContainer(Colors.red, 50), // Exemplo de container
                SizedBox(width: 20), // Espaçamento entre os containers
             //   _buildCircularContainer(Colors.green, 50), // Exemplo de container
                SizedBox(width: 20), // Espaçamento entre os containers
              //  _buildCircularContainer(Colors.blue, 50), // Exemplo de container
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildCircularContainer(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
