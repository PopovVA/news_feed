import 'package:bloc/bloc.dart' show Bloc;
import 'package:meta/meta.dart' show required;
import '../../models/picture.dart' show Picture;
import '../../repositories/picture_repository.dart' show PictureRepository;

import 'picture_event.dart' show StartDownloading, PictureEvent;
import 'picture_state.dart'
    show DataLoadingError, DataLoading, DataLoaded, PictureState;

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  PictureBloc({@required this.pictureRepository});

  final PictureRepository pictureRepository;

  @override
  PictureState get initialState => DataLoading();

  @override
  Stream<PictureState> mapEventToState(PictureEvent event) async* {
    if (event is StartDownloading) {
      try {
        yield DataLoading();
        final Picture picture = await pictureRepository.fetchImage();
        yield DataLoaded(picture);
      } catch (error) {
        yield DataLoadingError(error.toString());
      }
    }
  }
}
