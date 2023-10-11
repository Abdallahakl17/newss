abstract class NewsState {}

class IntialState extends NewsState {}

class BottomNavState extends NewsState {}
class ChangeModeState extends NewsState {}

class BusinessLoadingState extends NewsState {}

class BusinessSucessState extends NewsState {}

class BusinessErorrState extends NewsState {
  final String erorr;
  BusinessErorrState(this.erorr);
}
class SearchLoadingState extends NewsState {}

class SearchSucessState extends NewsState {}

class SearchErorrState extends NewsState {
  final String erorr;
  SearchErorrState(this.erorr);
}
class SportLoadingState extends NewsState {}

class SportSucessState extends NewsState {}

class SportErorrState extends NewsState {
  final String erorr;
  SportErorrState(this.erorr);
}
class ScienceLoadingState extends NewsState {}

class ScienceSucessState extends NewsState {}

class ScienceErorrState extends NewsState {
  final String erorr;
  ScienceErorrState(this.erorr);
}
