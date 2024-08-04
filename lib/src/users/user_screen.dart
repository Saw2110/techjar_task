import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import 'components/user_info_section.dart';
import 'user_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().context = context;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return PageWrapper(
      appbarTitle: "User List",
      body: Visibility(
        visible: userProvider.isLoading,
        replacement: const UserView(),
        child: const LoadingWidget(),
      ),
    );
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return userProvider.userList.isNotEmpty
        ? ListView.builder(
            itemCount: userProvider.userList.length,
            itemBuilder: (BuildContext context, int index) {
              final userInfo = userProvider.userList[index];
              return UserInfoSection(
                onTap: () {},
                userInfo: userInfo,
              );
            },
          )
        : const Center(child: Text("No User available."));
  }
}
