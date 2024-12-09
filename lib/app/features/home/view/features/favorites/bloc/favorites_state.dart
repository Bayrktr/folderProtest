import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/all_favorites_directory_model.dart';
import 'package:equatable/equatable.dart';

class FavoritesState with EquatableMixin {
  FavoritesState(
      {this.status = FavoritesStatus.start,
      this.allFavoritesDirectoryModel,
      this.snackBarStatus = FavoriteSnackBarStatus.initial});

  final FavoritesStatus status;
  final AllFavoritesDirectoryModel? allFavoritesDirectoryModel;
  final FavoriteSnackBarStatus snackBarStatus;

  @override
  List<Object?> get props => [
        status,
        allFavoritesDirectoryModel,
        snackBarStatus,
      ];

  FavoritesState copyWith({
    FavoritesStatus? status,
    AllFavoritesDirectoryModel? allFavoritesDirectoryModel,
    FavoriteSnackBarStatus? snackBarStatus,
  }) =>
      FavoritesState(
        status: status ?? this.status,
        allFavoritesDirectoryModel:
            allFavoritesDirectoryModel ?? this.allFavoritesDirectoryModel,
        snackBarStatus: snackBarStatus ?? this.snackBarStatus,
      );
}

enum FavoritesStatus {
  start,
  initial,
  loading,
  error,
}

enum FavoriteSnackBarStatus {
  initial,
  deletedSuccess,
}
