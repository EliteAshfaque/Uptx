// views/list_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/pagination_controller.dart';
import '../utility/event.dart';
import '../widget/counter_widget.dart';


class ListPage extends StatelessWidget {
  final PaginationController controller = Get.put(PaginationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,

          title: const Text('UPTX',
          style: TextStyle(fontSize: 22,    fontWeight: FontWeight.bold, color: Colors.white// Font weight
          ),)),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.items.length + 1, // Add 1 for loading indicator
          itemBuilder: (context, index) {
            if (index == controller.items.length) {
              // Check if last item and load more
              return _loadingIndicator();
            }

            // Build the actual list item
            final item = controller.items[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.network(item.imageUrl),
                trailing: Text(item.title),
                subtitle: TimmerWidget(totalDuration: item.totalDuration),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _loadingIndicator() {
    return StreamBuilder<LoadingEvent>(
      stream: controller.eventBus.on<LoadingEvent>(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.isLastPage.value) {
          return const Center(child: Text('No more items'));
        } else {
          // Trigger load more if not loading and not the last page
          controller.eventBus.fire(LoadMoreEvent());
          return const SizedBox.shrink(); // Empty widget
        }
      },
    );
  }
}
