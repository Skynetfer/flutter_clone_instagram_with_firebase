import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clone_intagram/enums/enums.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit()
      : super(
          BottomNavBarState(
            selectedItem: BottomNavItems.feed,
          ),
        );

  void updateSelectedItem(BottomNavItems item) {
    if (item != state.selectedItem) {
      emit(
        BottomNavBarState(selectedItem: item),
      );
    }
  }
}
