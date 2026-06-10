// GorditOS — schema guard (AC-04): ninguna migración puede introducir
// columnas de peso/medidas corporales (PRD §3.1 — constraint de diseño).
// Escanea supabase/migrations/**.sql (ignorando comentarios SQL) y falla
// listando archivo y línea si aparece un término corporal.
//
// Uso: dart run tool/schema_guard.dart
import 'dart:io';

final _banned = RegExp(
  r'(?<!\w)('
  r'weight|peso|height|altura|bmi|imc|body_?fat|fat_?percent|'
  r'waist|cintura|hip_?size|measurements?|medidas?_corporales?'
  r')(?!\w)',
  caseSensitive: false,
);

void main() {
  final dir = Directory('supabase/migrations');
  if (!dir.existsSync()) {
    stdout.writeln('schema-guard OK: sin migraciones aún.');
    exit(0);
  }

  final violations = <String>[];

  for (final file in dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.sql'))) {
    final lines = file.readAsLinesSync();
    var inBlockComment = false;
    for (var i = 0; i < lines.length; i++) {
      var line = lines[i];
      // Ignorar comentarios: el guard vigila el ESQUEMA, no la prosa.
      if (inBlockComment) {
        if (line.contains('*/')) {
          line = line.substring(line.indexOf('*/') + 2);
          inBlockComment = false;
        } else {
          continue;
        }
      }
      if (line.contains('/*')) {
        inBlockComment = !line.contains('*/');
        line = line.substring(0, line.indexOf('/*'));
      }
      final dashIdx = line.indexOf('--');
      if (dashIdx >= 0) line = line.substring(0, dashIdx);

      final match = _banned.firstMatch(line);
      if (match != null) {
        violations.add(
          '${file.path}:${i + 1} → término corporal "${match.group(0)}"',
        );
      }
    }
  }

  if (violations.isEmpty) {
    stdout.writeln(
      'schema-guard OK: 0 columnas corporales en supabase/migrations/.',
    );
    exit(0);
  }
  stderr.writeln(
    'schema-guard FALLO: el esquema no puede contener datos corporales (PRD §3.1):',
  );
  violations.forEach(stderr.writeln);
  exit(1);
}
