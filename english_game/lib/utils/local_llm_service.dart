import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Service that communicates with a local lightweight LLM runner such as
/// `llama.cpp`.
class LocalLLMService {
  LocalLLMService({
    required this.modelPath,
    this.runnerPath = 'llama',
  });

  /// Path to the quantized model file (gguf).
  final String modelPath;

  /// Executable for the llama.cpp binary. Defaults to `llama` assuming it is in
  /// the system PATH.
  final String runnerPath;

  /// Last model name reported by the runner (useful for telemetry).
  String? lastModelName;

  /// Last call latency in milliseconds.
  int? lastLatencyMs;

  /// Generates up to three short paraphrases for [baseText].
  /// [maxTokens] controls the length of each variation in tokens.
  Future<List<String>> generateVariations(String baseText, int maxTokens) async {
    final prompt =
        'Você é um assistente que gera variações curtas e formais de respostas de entrevista.\n'
        'Regras:\n'
        '- Preserve o sentido central.\n'
        '- Tom profissional.\n'
        '- ≤ 25 palavras.\n'
        '- Não invente fatos.\n'
        '- Gere 3 variações distintas.\n\n'
        'Frase base: "$baseText"\n'
        'Saída JSON: {"variations": ["...", "...", "..."]}';

    final stopwatch = Stopwatch()..start();
    // Spawn the process. The arguments follow the llama.cpp style
    // `--model` and `--prompt`. Users may adapt according to their setup.
    final process = await Process.start(
      runnerPath,
      ['-m', modelPath, '-p', prompt, '-n', maxTokens.toString()],
      runInShell: true,
    );

    final output = await process.stdout.transform(utf8.decoder).join();
    await process.stderr.drain();
    stopwatch.stop();

    lastLatencyMs = stopwatch.elapsedMilliseconds;

    // Attempt to parse JSON output. If parsing fails, return an empty list.
    try {
      final data = json.decode(output) as Map<String, dynamic>;
      lastModelName = data['model'] as String? ?? lastModelName;
      final variations = (data['variations'] as List<dynamic>).cast<String>();
      // Keep at most 3 variations.
      return variations.take(3).toList();
    } catch (_) {
      return [];
    }
  }
}
