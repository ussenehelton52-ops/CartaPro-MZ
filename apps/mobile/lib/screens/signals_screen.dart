import 'package:flutter/material.dart';

class SignalsScreen extends StatelessWidget {
  const SignalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signals = [
      {
        'category': '🔴 Proibição',
        'items': ['Não entrar', 'Parada proibida', 'Ultrapassagem proibida'],
      },
      {
        'category': '🔵 Obrigação',
        'items': ['Só para direita', 'Só para esquerda', 'Velocidade mínima'],
      },
      {
        'category': '⚠️ Perigo',
        'items': ['Cruzamento', 'Sentido único', 'Zona escolar'],
      },
      {
        'category': '🅿️ Informação',
        'items': ['Parque de estacionamento', 'Hospital', 'Combustível'],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sinais de Trânsito'),
        backgroundColor: const Color(0xFF0B7A75),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: signals.length,
        itemBuilder: (context, index) {
          final signal = signals[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                signal['category'] as String,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B2B3A),
                ),
              ),
              const SizedBox(height: 12),
              ...((signal['items'] as List<String>).map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }).toList()),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
