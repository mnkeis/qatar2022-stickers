import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:friends_repository/friends_repository.dart';
import 'package:qatar2022_stickers/l10n/l10n.dart';
import 'package:ui/ui.dart';

import '../../features.dart';
import '../cubit/friends_cubit.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const FriendsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FriendsCubit(context.read<FriendsRepository>())..load(),
      child: const FriendsView(),
    );
  }
}

class FriendsView extends StatelessWidget {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.friendsPageTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final cubit = context.read<FriendsCubit>();

          final email = await showDialog<String>(
            context: context,
            builder: (context) => const AddFriendDialog(),
          );
          if (email != null) {
            await cubit.addFriend(email);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<FriendsCubit, FriendsState>(
        listener: (context, state) {
          if (state is FriendsError) {
            showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is FriendsLoaded) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: state.friends.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.friends[index].name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: IconButton(
                      onPressed: () => Navigator.of(context)
                          .push(FriendSwapsPage.route(state.friends[index])),
                      icon: const Icon(Icons.swap_horiz),
                    ),
                  );
                },
              ),
            );
          }
          if (state is FriendsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class AddFriendDialog extends StatefulWidget {
  const AddFriendDialog({super.key});

  @override
  State<AddFriendDialog> createState() => _AddFriendDialogState();
}

class _AddFriendDialogState extends State<AddFriendDialog> {
  Email email = const Email.pure();

  void _onMailChanged(String value) {
    setState(() {
      email = Email.dirty(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(context.l10n.addFriendDialogTitle),
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: EmailInput(
            onChanged: _onMailChanged,
            labelText: context.l10n.emailInputLabel,
            helperText: context.l10n.addFriendDIalogBody,
            errorText: email.invalid ? context.l10n.emailInvalidText : null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(email.value),
                child: const Text('OK'),
              )
            ],
          ),
        )
      ],
    );
  }
}
