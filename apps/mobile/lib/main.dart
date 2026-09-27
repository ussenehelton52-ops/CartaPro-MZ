import 'package:flutter/material.dart';
import 'screens/exam_screen.dart';
import 'screens/signals_screen.dart';
import 'screens/progress_screen.dart';

void main() {
  runApp(const CartaProApp());
}

class CartaProApp extends StatelessWidget {
  const CartaProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CartaPro MZ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B7A75)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text('CartaPro MZ'),
        backgroundColor: const Color(0xFF0B7A75),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Olá, estudante 👋',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B2B3A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Qual é o teu objetivo?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF5B6472),
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: const [
                    CategoryChip(label: '🚗 Carta Ligeiro'),
                    CategoryChip(label: '🚛 Carta Pesado'),
                    CategoryChip(label: '👨‍✈️ Profissional'),
                  ],
                ),
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1A1F2937),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '📊 O teu progresso',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B2B3A),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text('Preparação: 67%'),
                      Text('Questões respondidas: 438'),
                      Text('Respostas certas: 361'),
                      Text('Respostas erradas: 77'),
                      Text('Sequência atual: 8 dias'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.35,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ActionCard(
                      icon: '📝',
                      title: 'Começar exame',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ExamScreen()),
                      ),
                    ),
                    ActionCard(
                      icon: '📚',
                      title: 'Estudar matéria',
                      onTap: () {},
                    ),
                    ActionCard(
                      icon: '🚦',
                      title: 'Sinais de trânsito',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignalsScreen()),
                      ),
                    ),
                    ActionCard(
                      icon: '🎥',
                      title: 'Vídeo-aulas',
                      onTap: () {},
                    ),
                    ActionCard(
                      icon: '📖',
                      title: 'Código da Estrada',
                      onTap: () {},
                    ),
                    ActionCard(
                      icon: '🤖',
                      title: 'Professor IA',
                      onTap: () {},
                    ),
                    ActionCard(
                      icon: '📊',
                      title: 'Meu progresso',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProgressScreen()),
                      ),
                    ),
                    ActionCard(
                      icon: '👑',
                      title: 'Premium',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFDCF5F3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF0B7A75),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const ActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(icon, style: const TextStyle(fontSize: 30)),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1B2B3A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
