abstract class AppState {}

class AppInitialStates extends AppState {}

class AppChangeIndexState extends AppState {}

class AppChangeThemeStateLight extends AppState {}

class AppChangeThemeStateDark extends AppState {}

class NewsGetBusinessLoadingState extends AppState {}

class NewsGetBusinessSuccessState extends AppState {}

class NewsGetSportsLoadingState extends AppState {}

class NewsGetSportsSuccessState extends AppState {}

class NewsGetScienceLoadingState extends AppState {}

class NewsGetScienceSuccessState extends AppState {}

class NewsGetSportsErrorState extends AppState {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetBusinessErrorState extends AppState {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetScienceErrorState extends AppState {
  final String error;

  NewsGetScienceErrorState(this.error);
}
