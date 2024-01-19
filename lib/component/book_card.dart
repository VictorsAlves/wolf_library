import 'package:flutter/material.dart';
import '../controller/book_list_controller.dart';
import '../model/book.dart'; // Certifique-se de que o caminho para o modelo Book está correto.

class BookCard extends StatelessWidget {
  final Book book;
  final Function(String url) handleUrl;

  BookCard({required this.book, required this.handleUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8), // Margem reduzida
      elevation: 4, // Sombra para um efeito elevado
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              // Bordas arredondadas para a imagem
              child: Image.network(
                book.imageUrl,
                width: 120, // Largura maior para a imagem
                height: 160, // Altura maior para a imagem
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                // Espaçamento à esquerda para o texto
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      book.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      // Título com fonte maior
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8), // Espaço vertical para separação
                    Text(
                      book.description,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade600),
                      // Descrição com fonte ajustada
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 16), // Mais espaço vertical antes do botão
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF4F7978),
                          // Botão azul para destaque
                          primary: Colors.white, // Texto do botão em branco
                        ),
                        onPressed: () {
                          handleUrl(book.saleUrl);
                          // Implemente a ação de compra aqui
                        },
                        child: Text('Adquirir'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
