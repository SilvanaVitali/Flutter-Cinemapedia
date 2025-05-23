import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView();

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final toRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcommingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(title: CustomAppbar()),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                // CustomAppbar(),
                MoviesSlideshow(movies: slideShowMovies),

                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subtitle: 'Lunes 20',
                  loadNextPage:
                      () =>
                          ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage(),
                ),

                MovieHorizontalListview(
                  movies: upcommingMovies,
                  title: 'Próximamente',
                  subtitle: 'Este mes',
                  loadNextPage:
                      () =>
                          ref
                              .read(upcomingMoviesProvider.notifier)
                              .loadNextPage(),
                ),

                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  loadNextPage:
                      () =>
                          ref
                              .read(popularMoviesProvider.notifier)
                              .loadNextPage(),
                ),

                MovieHorizontalListview(
                  movies: toRatedMovies,
                  title: 'Mejor calificadas',
                  subtitle: 'Desde siempre',
                  loadNextPage:
                      () =>
                          ref
                              .read(topRatedMoviesProvider.notifier)
                              .loadNextPage(),
                ),

                const SizedBox(height: 10),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
