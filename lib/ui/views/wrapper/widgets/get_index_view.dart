import 'package:flutter/material.dart';
import 'package:real_estate/ui/views/chat/chat_view.dart';
import 'package:real_estate/ui/views/favorite/favorite_view.dart';
import 'package:real_estate/ui/views/home/home_view.dart';
import 'package:real_estate/ui/views/profile/profile_view.dart';
import 'package:real_estate/ui/views/search/search_view.dart';

class GetIndexView extends StatelessWidget {
  final int currentIndex;
  const GetIndexView({
    super.key,
    this.currentIndex = 2,
  });

  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return const SearchView();
      case 1:
        return const ChatView();
      case 2:
        return const HomeView();
      case 3:
        return const FavoriteView();
      case 4:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }
}
