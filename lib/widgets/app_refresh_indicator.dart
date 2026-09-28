import 'package:flutter/cupertino.dart' hide RefreshCallback;
import 'package:flutter/material.dart';

/// Pull-to-refresh that shows the iOS [CupertinoSliverRefreshControl] spinner.
///
/// [child] is the scroll content. It must have a finite height (no nested
/// scroll view, no [Expanded]); this scroll view owns the drag.
class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final RefreshCallback onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            CupertinoSliverRefreshControl(onRefresh: onRefresh),
            SliverToBoxAdapter(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: child,
              ),
            ),
          ],
        );
      },
    );
  }
}
