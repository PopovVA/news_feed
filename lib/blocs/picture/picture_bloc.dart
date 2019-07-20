import 'package:bloc/bloc.dart' show Bloc;
import 'picture_event.dart'
    show LikeButtonPressed, PictureEvent;
import 'picture_state.dart'
    show
    PictureState,
    PictureIsLiked,
    PictureIsNotLiked;

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
  }
}
