import 'package:flutter/material.dart';

class TestAnimatedListView extends StatefulWidget {
  const TestAnimatedListView({super.key});

  @override
  State<TestAnimatedListView> createState() => _TestAnimatedListViewState();
}

class _TestAnimatedListViewState extends State<TestAnimatedListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animated List',
        ),
      ),
      body: const CustomAnimatedList(),
    );
  }
}

class CustomAnimatedList extends StatefulWidget {
  const CustomAnimatedList({super.key});

  @override
  State<CustomAnimatedList> createState() => _CustomAnimatedListState();
}

class _CustomAnimatedListState extends State<CustomAnimatedList> {
  List<String> items = [];
  GlobalKey<AnimatedListState> listKey = GlobalKey();
  late ScrollController scrollController;
  @override
  initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<void> scrollToEnd() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () async {
        await scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: listKey,
            controller: scrollController,
            initialItemCount: items.length,
            itemBuilder: (context, index, animation) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: Offset.zero,
                    ),
                  ),
                  child: AnimatedListItem(
                    title: items[index],
                    onTapDelete: () {
                      items.removeAt(index);
                      listKey.currentState!.removeItem(
                        index,
                        duration: const Duration(milliseconds: 500),
                        (context, animation) {
                          return SizeTransition(
                            sizeFactor: animation,
                            child: AnimatedListItem(
                              title: 'items ${index + 1}',
                              onTapDelete: () {},
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        TextButton(
          onPressed: () async {
            int index = items.length;
            items.add('items ${index + 1}');
            listKey.currentState!
                .insertItem(index, duration: const Duration(milliseconds: 500));
            await scrollToEnd();
          },
          child: const Text(
            'add',
          ),
        ),
      ],
    );
  }
}

class AnimatedListItem extends StatelessWidget {
  const AnimatedListItem({
    super.key,
    required this.title,
    required this.onTapDelete,
  });

  final String title;
  final void Function() onTapDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 35,
        ),
        title: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
        trailing: IconButton(
          onPressed: onTapDelete,
          icon: const Icon(
            Icons.delete,
            size: 35,
          ),
        ),
      ),
    );
  }
}
