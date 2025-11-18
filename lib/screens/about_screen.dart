import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sobre o Flutter Store', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.info_outline, color: Colors.indigo),
              SizedBox(width: 8),
              Text('Versão 1.0.0', style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Aplicação de demonstração para avaliação de Flutter.',
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
          SizedBox(height: 24),
          Text('Desenvolvido por: Bernardo', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}