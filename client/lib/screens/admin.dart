import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphite_client/models/session.dart';
import 'package:graphite_client/models/user.dart';
import 'package:graphite_client/state.dart';

class AdminScreen extends ConsumerWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Session session =
        ref.watch(graphiteStateProvider.select((state) => state.session));

    final state = ref.read(graphiteStateProvider.notifier);

    return const Scaffold(
      body: Center(
        child: Text('Admin'),
      ),
    );
  }
}
