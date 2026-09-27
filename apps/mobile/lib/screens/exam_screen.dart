import 'package:flutter/material.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int currentQuestion = 0;
  List<String> selectedAnswers = [];
  bool showExplanation = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Qual é a velocidade máxima em zona escolar?',
      'alternatives': ['40 km/h', '50 km/h', '60 km/h', '30 km/h'],
      'correct': 3,
      'explanation': 'A velocidade máxima em zona escolar é de 30 km/h para garantir a segurança das crianças.',
    },
    {
      'question': 'O que significa este sinal de trânsito?',
      'alternatives': ['Parada obrigatória', 'Ceda a passagem', 'Velocidade limite', 'Proibido entrar'],
      'correct': 1,
      'explanation': 'O sinal de "Ceda a Passagem" significa que você deve reduzir a velocidade e dar passagem a outros veículos.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final isAnswered = currentQuestion < selectedAnswers.length;
    final correctAnswer = selectedAnswers.isNotEmpty && currentQuestion < selectedAnswers.length
        ? int.tryParse(selectedAnswers[currentQuestion]) == question['correct']
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Questão ${currentQuestion + 1}/${questions.length}'),
        backgroundColor: const Color(0xFF0B7A75),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra de progresso
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: (currentQuestion + 1) / questions.length,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF0B7A75)),
                ),
              ),
              const SizedBox(height: 24),

              // Pergunta
              Text(
                question['question'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B2B3A),
                ),
              ),
              const SizedBox(height: 28),

              // Alternativas
              Expanded(
                child: ListView.separated(
                  itemCount: question['alternatives'].length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final isSelected = currentQuestion < selectedAnswers.length &&
                        int.tryParse(selectedAnswers[currentQuestion]) == index;
                    final isCorrect = question['correct'] == index;
                    final showResult = isAnswered && (isSelected || isCorrect);

                    return GestureDetector(
                      onTap: isAnswered ? null : () => _selectAnswer(index),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: showResult
                              ? (isCorrect ? Colors.green.shade50 : Colors.red.shade50)
                              : (isSelected ? const Color(0xFFDCF5F3) : Colors.white),
                          border: Border.all(
                            color: showResult
                                ? (isCorrect ? Colors.green : Colors.red)
                                : (isSelected ? const Color(0xFF0B7A75) : Colors.grey.shade300),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: showResult
                                    ? (isCorrect ? Colors.green : Colors.red)
                                    : (isSelected ? const Color(0xFF0B7A75) : Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  String.fromCharCode(65 + index),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                question['alternatives'][index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (showResult)
                              Icon(
                                isCorrect ? Icons.check_circle : Icons.cancel,
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Explicação (após responder)
              if (isAnswered && showExplanation)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Porquê?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B7A75),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        question['explanation'],
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF5B6472),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 20),

              // Botões de ação
              if (!isAnswered)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0B7A75),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Confirmar resposta',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              else
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0B7A75),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _nextQuestion,
                    child: Text(
                      currentQuestion == questions.length - 1 ? 'Ver resultado' : 'Próxima questão',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectAnswer(int index) {
    setState(() {
      while (selectedAnswers.length <= currentQuestion) {
        selectedAnswers.add('');
      }
      selectedAnswers[currentQuestion] = index.toString();
      showExplanation = true;
    });
  }

  void _nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        showExplanation = false;
      });
    } else {
      _showResults();
    }
  }

  void _showResults() {
    int correct = 0;
    for (int i = 0; i < questions.length; i++) {
      if (int.tryParse(selectedAnswers[i]) == questions[i]['correct']) {
        correct++;
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Resultado'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '✅ $correct acertos de ${questions.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Aproveitamento: ${((correct / questions.length) * 100).toStringAsFixed(0)}%',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }
}
