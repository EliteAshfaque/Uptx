// controllers/pagination_controller.dart
import 'package:get/get.dart';

import '../model/item_model.dart';
import '../service/api_service.dart';
import '../utility/event.dart';

class PaginationController extends GetxController {
  var items = <Item>[].obs;
  var isLastPage = false.obs;
  int currentPage = 1;
  final int itemsPerPage = 20; // Number of items per page
  final EventBus eventBus = EventBus();

  @override
  void onInit() {
    super.onInit();
    loadMoreItems();

    // Listen for load more events
    eventBus.on<LoadMoreEvent>().listen((event) {
      loadMoreItems();
    });
  }

  // Simulate API call to fetch paginated data
  Future<void> loadMoreItems() async {
    if (isLastPage.value) return;

    eventBus.fire(LoadingEvent(true)); // Notify loading started

    var newItems = await ApiService.getItems(currentPage, itemsPerPage);
    if (newItems.isEmpty) {
      isLastPage.value = true;
    } else {
      items.addAll(newItems);
      eventBus.fire(DataLoadedEvent(newItems)); // Notify data loaded
      currentPage++;
    }

    eventBus.fire(LoadingEvent(false)); // Notify loading finished
  }
}
