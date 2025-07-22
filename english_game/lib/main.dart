import 'package:flutter/material.dart';
import 'analytics_service.dart';

class Chunk {
  final String id;
  final String text;
  final String category;
  final int level;
  final String translationPt;
  final List<String> usageExamples;
  final List<String> tags;
  Chunk({
    required this.id,
    required this.text,
    required this.category,
    required this.level,
    required this.translationPt,
    required this.usageExamples,
    required this.tags,
  });
}

class Puzzle {
  final String id;
  final String chunkId;
  final String type;
  final String prompt;
  final List<String> options;
  final int correctOptionIndex;
  final int timeLimitSec;
  final List<String> hints;
  final String explanation;
  final int difficulty;
  Puzzle({
    required this.id,
    required this.chunkId,
    required this.type,
    required this.prompt,
    required this.options,
    required this.correctOptionIndex,
    required this.timeLimitSec,
    required this.hints,
    required this.explanation,
    required this.difficulty,
  });
}

class UserProgress {
  final String userId;
  final String chunkId;
  int lastScore;
  int reviews;
  DateTime nextReviewAt;
  int streakDays;
  UserProgress({
    required this.userId,
    required this.chunkId,
    required this.lastScore,
    required this.reviews,
    required this.nextReviewAt,
    required this.streakDays,
  });
}

final List<Chunk> mockChunks = [
  Chunk(
    id: 'chunk_001',
    text: 'I’m currently working as a _____.',
    category: 'presentation',
    level: 1,
    translationPt: 'Atualmente trabalho como _____.',
    usageExamples: [
      'I’m currently working as a backend developer.',
      'I’m currently working as a project manager.'
    ],
    tags: ['presentation', 'job'],
  ),
  Chunk(
    id: 'chunk_002',
    text: 'One of my strongest skills is _____.',
    category: 'strengths',
    level: 1,
    translationPt: 'Uma das minhas maiores habilidades é _____.',
    usageExamples: [
      'One of my strongest skills is problem-solving.',
      'One of my strongest skills is communication.'
    ],
    tags: ['strengths'],
  ),
];

final List<Puzzle> mockPuzzles = [
  Puzzle(
    id: 'puzzle_001',
    chunkId: 'chunk_001',
    type: 'complete_chunk',
    prompt: 'I’m currently working as a ______.',
    options: ['backend developer', 'happy', 'carpenter'],
    correctOptionIndex: 0,
    timeLimitSec: 20,
    hints: ['Profissão'],
    explanation: 'Use a profissão/título profissional no espaço em branco.',
    difficulty: 1,
  ),
  Puzzle(
    id: 'puzzle_002',
    chunkId: 'chunk_002',
    type: 'complete_chunk',
    prompt: 'One of my strongest skills is ______.',
    options: ['problem-solving', 'pizza', 'dancing'],
    correctOptionIndex: 0,
    timeLimitSec: 20,
    hints: ['Habilidade'],
    explanation: 'Use uma habilidade relevante.',
    difficulty: 1,
  ),
  Puzzle(
    id: 'puzzle_003',
    chunkId: 'chunk_001',
    type: 'jumble',
    prompt: 'Ordene as palavras para formar a frase correta.',
    options: ['currently', 'I’m', 'working', 'as', 'a', 'backend', 'developer'],
    correctOptionIndex: 0, // não usado para jumble
    timeLimitSec: 30,
    hints: ['Profissão'],
    explanation: 'Monte a frase: I’m currently working as a backend developer.',
    difficulty: 2,
  ),
];

void main() {
  runApp(const EnglishGameApp());
}

class EnglishGameApp extends StatelessWidget {
  const EnglishGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treino de Entrevistas TI'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ModeButton(
              title: 'Praticar Chunks',
              icon: Icons.list_alt,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChunkListScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            ModeButton(
              title: 'Desafio Diário',
              icon: Icons.today,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WritingChallengeScreen(),
      ),
                );
              },
            ),
            const SizedBox(height: 24),
            ModeButton(
              title: 'Simulado de Entrevista',
              icon: Icons.question_answer,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const InterviewSimScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            ModeButton(
              title: 'Entrevista com IA',
              icon: Icons.smart_toy,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AIInterviewScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            ModeButton(
              title: 'Revisar Respostas',
              icon: Icons.history,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ReviewScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ModeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const ModeButton({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 32),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Text(title, style: const TextStyle(fontSize: 20)),
        ),
        onPressed: onTap,
      ),
    );
  }
}

class WritingChallengeScreen extends StatefulWidget {
  const WritingChallengeScreen({super.key});

  @override
  State<WritingChallengeScreen> createState() => _WritingChallengeScreenState();
}

class _WritingChallengeScreenState extends State<WritingChallengeScreen> {
  final int wordLimit = 100;
  final int charLimit = 600;
  final String prompt =
      'Describe a challenging technical problem you solved in a previous job interview.';
  String userText = '';
  int xp = 0;

  int get wordCount => userText.trim().isEmpty
      ? 0
      : userText.trim().split(RegExp(r'\s+')).length;

  void submitWriting() {
    setState(() {
      xp += 10;
      userText = '';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Writing submitted! +10 XP')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio Diário'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              prompt,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TextField(
                maxLines: null,
                minLines: 8,
                maxLength: charLimit,
                onChanged: (val) {
                  setState(() {
                    userText = val;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write your answer here...'
                ),
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: userText,
                    selection: TextSelection.collapsed(offset: userText.length),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Words: $wordCount/$wordLimit'),
                Text('Characters: ${userText.length}/$charLimit'),
              ],
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: (xp % 100) / 100,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),
            const SizedBox(height: 8),
            Text('XP: $xp'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (userText.trim().isNotEmpty && wordCount <= wordLimit)
                    ? submitWriting
                    : null,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterviewSimScreen extends StatefulWidget {
  const InterviewSimScreen({super.key});

  @override
  State<InterviewSimScreen> createState() => _InterviewSimScreenState();
}

class _InterviewSimScreenState extends State<InterviewSimScreen> {
  final List<String> questions = [
    'Tell me about yourself and your experience in technology.',
    'How do you keep your technical skills up to date?',
    'Describe a time you solved a conflict in a team.',
    'What is SOLID and why is it important?',
    'How do you approach debugging a complex issue?',
  ];
  int current = 0;
  String answer = '';
  int xp = 0;
  bool finished = false;
  int seconds = 120;
  late final PageController _pageController;
  late final TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _textController = TextEditingController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    _textController.dispose();
    super.dispose();
  }
  void nextQuestion() {
    setState(() {
      xp += 10;
      answer = '';
      _textController.clear();
      if (current < questions.length - 1) {
        current++;
      } else {
        finished = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulado de Entrevista'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: finished
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.emoji_events, size: 64, color: Colors.amber),
                    const SizedBox(height: 16),
                    Text('Parabéns! Você completou o simulado.', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    Text('XP ganho: $xp'),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          current = 0;
                          xp = 0;
                          finished = false;
                        });
                      },
                      child: const Text('Recomeçar'),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pergunta ${current + 1} de ${questions.length}', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Text(questions[current], style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 24),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      maxLines: null,
                      minLines: 6,
                      onChanged: (val) {
                        setState(() {
                          answer = val;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite sua resposta...'
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: (xp % (questions.length * 10)) / (questions.length * 10),
                    minHeight: 10,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
                  const SizedBox(height: 8),
                  Text('XP: $xp'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: answer.trim().isNotEmpty ? nextQuestion : null,
                      child: Text(current < questions.length - 1 ? 'Próxima' : 'Finalizar'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class AIInterviewScreen extends StatefulWidget {
  const AIInterviewScreen({super.key});

  @override
  State<AIInterviewScreen> createState() => _AIInterviewScreenState();
}

class _AIInterviewScreenState extends State<AIInterviewScreen> {
  final List<Map<String, String>> questions = [
    {'q': 'Olá! Eu sou Alex, seu entrevistador virtual. Pode se apresentar brevemente?', 'a': ''},
    {'q': 'Ótimo! Agora, me conte sobre um projeto de TI do qual você se orgulha.', 'a': ''},
    {'q': 'Como você lida com pressão em prazos apertados?', 'a': ''},
    {'q': 'Se pudesse aprender uma nova tecnologia agora, qual seria e por quê?', 'a': ''},
  ];
  int current = 0;
  String userInput = '';
  bool finished = false;
  final TextEditingController _controller = TextEditingController();

  void nextStep() {
    setState(() {
      questions[current]['a'] = userInput;
      userInput = '';
      _controller.clear();
      if (current < questions.length - 1) {
        current++;
      } else {
        finished = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrevista com IA'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: finished
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        child: Icon(Icons.smart_toy, size: 32),
                      ),
                      const SizedBox(width: 12),
                      Text('Alex (IA)', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Parabéns por completar a entrevista!\n\nDica: Seja sempre claro e objetivo nas respostas. Pratique exemplos reais e mostre seu raciocínio lógico. Continue treinando para evoluir!\n',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        current = 0;
                        finished = false;
                        for (var q in questions) { q['a'] = ''; }
                      });
                    },
                    child: const Text('Recomeçar'),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        child: Icon(Icons.smart_toy, size: 32),
                      ),
                      const SizedBox(width: 12),
                      Text('Alex (IA)', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView(
                      children: [
                        for (int i = 0; i <= current; i++) ...[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(questions[i]['q'] ?? '', style: const TextStyle(fontSize: 16)),
                            ),
                          ),
                          if ((questions[i]['a'] ?? '').isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(questions[i]['a'] ?? '', style: const TextStyle(fontSize: 16)),
                              ),
                            ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _controller,
                    minLines: 1,
                    maxLines: 4,
                    onChanged: (val) {
                      setState(() {
                        userInput = val;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite sua resposta...'
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: userInput.trim().isNotEmpty ? nextStep : null,
                      child: Text(current < questions.length - 1 ? 'Responder' : 'Finalizar'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revisar Respostas'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Em breve: histórico de respostas.'),
      ),
    );
  }
}

class ChunkListScreen extends StatelessWidget {
  const ChunkListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chunks'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: mockChunks.length,
        itemBuilder: (context, index) {
          final chunk = mockChunks[index];
          return ListTile(
            title: Text(chunk.text),
            subtitle: Text(chunk.translationPt),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PuzzleScreen(chunkId: chunk.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PuzzleScreen extends StatefulWidget {
  final String chunkId;
  const PuzzleScreen({super.key, required this.chunkId});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  int current = 0;
  int xp = 0;
  int? selectedOption;
  bool finished = false;
  List<int> jumbleOrder = [];
  List<int> userJumbleOrder = [];

  List<Puzzle> get puzzles =>
      mockPuzzles.where((p) => p.chunkId == widget.chunkId).toList();

  @override
  void initState() {
    super.initState();
    _setupJumble();
    if (puzzles.isNotEmpty) {
      AnalyticsService.instance.track('puzzle_started', {
        'chunkId': widget.chunkId,
        'puzzleId': puzzles[current].id,
        'type': puzzles[current].type,
      });
    }
  }

  void _setupJumble() {
    if (puzzles.isNotEmpty && puzzles[current].type == 'jumble') {
      jumbleOrder = List.generate(puzzles[current].options.length, (i) => i);
      jumbleOrder.shuffle();
      userJumbleOrder = List.from(jumbleOrder);
    } else {
      jumbleOrder = [];
      userJumbleOrder = [];
    }
  }

  void submitAnswer() {
    final puzzle = puzzles[current];
    bool isCorrect = false;
    setState(() {
      if (puzzle.type == 'jumble') {
        final correct = List.generate(puzzle.options.length, (i) => i);
        if (userJumbleOrder.join(',') == correct.join(',')) {
          isCorrect = true;
          xp += 10;
        }
      } else if (selectedOption == puzzle.correctOptionIndex) {
        isCorrect = true;
        xp += 10;
      }
      if (current < puzzles.length - 1) {
        current++;
        selectedOption = null;
        _setupJumble();
      } else {
        finished = true;
      }
    });
    AnalyticsService.instance.track('puzzle_completed', {
      'chunkId': widget.chunkId,
      'puzzleId': puzzle.id,
      'correct': isCorrect,
    });
    if (!finished) {
      final next = puzzles[current];
      AnalyticsService.instance.track('puzzle_started', {
        'chunkId': widget.chunkId,
        'puzzleId': next.id,
        'type': next.type,
      });
    } else {
      final correctness = xp / (puzzles.length * 10);
      AnalyticsService.instance.track('chunk_reviewed', {
        'chunkId': widget.chunkId,
        'correctness': correctness,
      });
    }
  }

  void _moveJumble(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = userJumbleOrder.removeAt(oldIndex);
      userJumbleOrder.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (puzzles.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Puzzle')),
        body: const Center(child: Text('Nenhum puzzle disponível para este chunk.')),
      );
    }
    final puzzle = puzzles[current];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle'),
        centerTitle: true,
      ),
      body: finished
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.emoji_events, size: 64, color: Colors.amber),
                  const SizedBox(height: 16),
                  Text('Parabéns! Você completou o puzzle.', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  Text('XP ganho: $xp'),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        current = 0;
                        xp = 0;
                        finished = false;
                        selectedOption = null;
                        _setupJumble();
                      });
                    },
                    child: const Text('Recomeçar'),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pergunta ${current + 1} de ${puzzles.length}', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Text(puzzle.prompt, style: Theme.of(context).textTheme.titleLarge),
                  if (puzzle.type == 'jumble') ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Arraste para ordenar as palavras e formar a frase correta.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        userJumbleOrder.map((i) => puzzle.options[i]).join(' '),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ReorderableListView(
                        onReorder: _moveJumble,
                        children: [
                          for (int i = 0; i < userJumbleOrder.length; i++)
                            Card(
                              key: ValueKey('jumble_$i'),
                              color: Colors.white,
                              elevation: 2,
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    puzzle.options[userJumbleOrder[i]],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ]
                  else
                    ...List.generate(puzzle.options.length, (i) {
                      return RadioListTile<int>(
                        value: i,
                        groupValue: selectedOption,
                        onChanged: (val) {
                          setState(() {
                            selectedOption = val;
                          });
                        },
                        title: Text(puzzle.options[i]),
                      );
                    }),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: (xp % (puzzles.length * 10)) / (puzzles.length * 10),
                    minHeight: 10,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
                  const SizedBox(height: 8),
                  Text('XP: $xp'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: puzzle.type == 'jumble' || selectedOption != null ? submitAnswer : null,
                      child: Text(current < puzzles.length - 1 ? 'Próxima' : 'Finalizar'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
