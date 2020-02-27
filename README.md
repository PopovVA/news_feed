# Flutter news feed application

Flutter news feed application

## Dependencies

* flutter_bloc: ^0.19.1
* http: ^0.12.0+2 
* equatable: ^0.3.0

## Screenshots And Usage

The project has two blocks for state management. 
1. *Application bloc* consists of two events **AppStarted** and **AppScrolling**. When the application starts, **AppStarted** is called and the number of images defined in the **StartingNumberOfCards** variable is loaded (lib / constants / application). When scrolling the tape, AppScrolling is called and the number of images defined in the variable **ScrollingNumberOfCards** is loaded (lib / constants / application).

```dart
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
```

2. *Picture bloc* consists of one event **LikeButtonPressed**. When you click on the star icon, this event is triggered and, depending on the current state of the image, it changes to the **PictureLiked** or **PictureIsNotLiked** state.

```dart
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
```


### Loading news

![](screenshots/loading.gif)



### Scroll loading

![](screenshots/scroll.gif)

### Full screen

![](screenshots/fullScreen.gif)

## Flutter default Getting Started guide

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Bonus
![Alt Text](https://media.giphy.com/media/vFKqnCdLPNOKc/giphy.gif)
