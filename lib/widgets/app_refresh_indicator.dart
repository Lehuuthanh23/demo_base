import 'package:flutter/cupertino.dart' hide RefreshCallback;
import 'package:flutter/material.dart';

/// Pull-to-refresh that shows the iOS [CupertinoSliverRefreshControl] spinner.
class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.slivers,
  });

  final RefreshCallback onRefresh;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        CupertinoSliverRefreshControl(onRefresh: onRefresh),
        ...slivers,
      ],
    );
  }
}
