// GorditOS — copy-lint (AC-10): escanea los string literals de lib/ contra
// el glosario prohibido (PRD §9.1). Falla (exit 1) listando archivo y línea.
//
// Uso: dart run tool/copy_lint.dart
// Excepciones: tool/copy_lint_allowlist.txt (un fragmento permitido por línea).
import 'dart:io';

final _banned = <RegExp>[
  _word(r'pesos?'),
  _word(r'kilos?'),
  _word(r'adelgazar'),
  _word(r'imc'),
  _word(r'grasas?'),
  _word(r'dietas?'),
  _word(r'd[eé]ficit'),
  _word(r'calor[ií]as?'),
  _word(r'macros?'),
  _word(r'quemar?'),
  _word(r'rachas?'),
  _word(r'rankings?'),
  _word(r'deber[ií]as'),
  RegExp(r'has\s+fallado', caseSensitive: false),
  RegExp(r'objetivo\s+incumplido', caseSensitive: false),
];

RegExp _word(String w) =>
    RegExp('(?<![\\wáéíóúñ])(?:$w)(?![\\wáéíóúñ])', caseSensitive: false);

final _stringLiteral = RegExp(
  [
    r'r?"""[\s\S]*?"""',
    r"r?'''[\s\S]*?'''",
    r'r?"(?:[^"\\]|\\.)*"',
    r"r?'(?:[^'\\]|\\.)*'",
  ].join('|'),
);

void main() {
  final allowFile = File('tool/copy_lint_allowlist.txt');
  final allow = allowFile.existsSync()
      ? allowFile
            .readAsLinesSync()
            .map((l) => l.trim())
            .where((l) => l.isNotEmpty && !l.startsWith('#'))
            .toList()
      : const <String>[];

  final violations = <String>[];

  final files = Directory('lib')
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'));

  for (final file in files) {
    final lines = file.readAsLinesSync();
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      for (final literal in _stringLiteral.allMatches(line)) {
        final text = literal.group(0)!;
        if (allow.any(text.contains)) continue;
        for (final pattern in _banned) {
          final match = pattern.firstMatch(text);
          if (match != null) {
            violations.add(
              '${file.path}:${i + 1} → "${match.group(0)}" en $text',
            );
          }
        }
      }
    }
  }

  if (violations.isEmpty) {
    stdout.writeln('copy-lint OK: 0 términos del glosario prohibido en lib/.');
    exit(0);
  }
  stderr.writeln('copy-lint FALLO: lenguaje del glosario prohibido (PRD §9.1):');
  violations.forEach(stderr.writeln);
  exit(1);
}
