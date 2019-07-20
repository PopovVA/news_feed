import 'package:bloc/bloc.dart' show Bloc;
import 'picture_event.dart'
    show FullScreenButtonPressed, LikeButtonPressed, PictureEvent;
import 'picture_state.dart'
    show
    PictureState,
    PictureIsFullscreen,
    PictureIsLiked,
    PictureIsNotLiked,
    PictureIsNotFullscreen;

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  @override
  PictureState get initialState => PictureIsNotLiked();

  @override
  Stream<PictureState> mapEventToState(PictureEvent event) async* {
    if (event is LikeButtonPressed) {
      if (event.like)
        yield PictureIsLiked();
      else
        yield PictureIsNotLiked();
    }
//    if (event is FullScreenButtonPressed) {
//      if (event.isFullScreen)
//        yield PictureIsFullscreen();
//      else
//        yield PictureIsNotFullscreen();
//    }
  }
}
