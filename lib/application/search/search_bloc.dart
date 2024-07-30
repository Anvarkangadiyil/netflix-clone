import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/failures/main_failure.dart';
import 'package:netflix_clone_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone_app/domain/downloads/models/downloads.dart';
import 'package:netflix_clone_app/domain/search/model/search_response/search_response.dart';
import 'package:netflix_clone_app/domain/search/seach_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._searchService, this._downloadsService)
      : super(SearchState.initial()) {
    // * idle state
    on<Initialize>((event, emit) async {
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      // ! get trending
      final _result = await _downloadsService.getDownloadsImages();

      _result.fold((MainFailure f) {
        emit(const SearchState(
          searchResultList: [],
          idleList: [],
          isLoading: true,
          isError: true,
        ));
      }, (List<Downloads> list) {
        emit(SearchState(
          searchResultList: [],
          idleList: list,
          isLoading: true,
          isError: false,
        ));
      });

      // ! show to UI
    });

    // ! Search Result state
    on<SearchMovie>((event, emit) async {
      //! call search movie api

      log('result for query:${event.movieQuery}');

      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      print(_result);

      //! show to UI
    });
  }
}
