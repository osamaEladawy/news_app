abstract class NewsStates{}
class NewsChangeModeState extends NewsStates{}

// states is about ChangeBottomNavigationBar
class NewsInitialState extends NewsStates{}

class NewsChangeBottomNavState extends NewsStates{}

class ChangeColorCategoryState extends NewsStates{}


// states is about GetBusiness
class GetDataLoadingStates extends NewsStates {}

class GetDataSuccessStates extends NewsStates {}

class GetDataErrorStates extends NewsStates {
  final String error;
  GetDataErrorStates(this.error);
}


// states is about GetSearch
class NewsGetSearchLoadingStates extends NewsStates {}

class NewsGetSearchSuccessStates extends NewsStates {}

class NewsGetSearchErrorStates extends NewsStates {
  late final String error;
  NewsGetSearchErrorStates(this.error);
}