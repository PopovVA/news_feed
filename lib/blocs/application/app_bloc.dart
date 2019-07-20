import 'package:bloc/bloc.dart' show Bloc;
import 'package:meta/meta.dart' show required;
import '../../constants/application.dart'
    show ScrollingNumberOfCards, StartingNumberOfCards;
import '../../models/picture.dart' show Picture;
import '../../repositories/picture_repository.dart' show PictureRepository;

import 'app_event.dart' show AppEvent, AppStarted, AppScrolling;
import 'app_state.dart'
    show DataLoadingError, DataLoading, DataLoaded, AppState;

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({@required this.pictureRepository});

  final PictureRepository pictureRepository;

  @override
  AppState get initialState => DataLoading();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppStarted) {
      try {
        yield DataLoading();
        final List<Picture> pictures =
            await pictureRepository.fetchImages(StartingNumberOfCards);
        yield DataLoaded(pictures);
      } catch (error) {
        yield DataLoadingError(error.toString());
      }
    }
    if (event is AppScrolling) {
      try {
        yield DataLoading();
        final List<Picture> pictures =
            await pictureRepository.fetchImages(ScrollingNumberOfCards);
        yield DataLoaded(pictures);
      } catch (error) {
        yield DataLoadingError(error.toString());
      }
    }
  }
}
