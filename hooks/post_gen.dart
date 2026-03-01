import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final projectName = context.vars['project_name'] as String;

  final flutterCreate = context.logger.progress(
    'Running flutter create --project-name $projectName',
  );
  final createResult = await Process.run(
    'flutter',
    ['create', '.', '--project-name', projectName, '--org', 'com.example'],
    runInShell: true,
  );
  if (createResult.exitCode != 0) {
    flutterCreate.fail('flutter create failed');
    context.logger.err(createResult.stderr.toString());
    return;
  }
  flutterCreate.complete();

  final pubGet = context.logger.progress('Running flutter pub get');
  final pubGetResult = await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
  );
  if (pubGetResult.exitCode != 0) {
    pubGet.fail('flutter pub get failed');
    context.logger.err(pubGetResult.stderr.toString());
    return;
  }
  pubGet.complete();

  context.logger.success('✅ Project "$projectName" is ready!');
  context.logger.info('');
  context.logger.info('Next steps:');
  context.logger.info('  1. Update .env with your Supabase credentials');
  context.logger.info('  2. Run: flutter run');
}
