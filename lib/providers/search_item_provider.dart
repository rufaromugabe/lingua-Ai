import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchItemsProvider = Provider<List<SearchItem>>((ref) {
  return [
    SearchItem(title: 'Item 1', description: 'This is item 1 Description'),
    SearchItem(title: 'Item 2', description: 'This is item 2 Description'),
    // Add more items as needed
  ];
});

class SearchItem {
  final String title;
  final String description; // Add this line

  SearchItem(
      {required this.title, required this.description}); // Update this line
}
