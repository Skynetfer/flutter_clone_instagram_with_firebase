part of 'bottom_nav_bar_cubit.dart';

class BottomNavBarState extends Equatable {
  final BottomNavItems selectedItem;
  const BottomNavBarState({required this.selectedItem});

  @override
  List<Object> get props => [selectedItem];
  // @override
  // // TODO: implement stringify
  // bool? get stringify => true;
}



// class BottomNavBarInitial extends BottomNavBarState {}
