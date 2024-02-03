//
//  MovieGridView.swift
//  flixster
//
//  Created by Sebastian on 2/2/24.
//

import SwiftUI

struct MovieGridView: View {
    @StateObject var viewModel = MoviesViewModel(with: MovieServiceImpl())

    @State private var isSheetOpen = false
    private var movies: [Movie] {
        viewModel.movies
    }

    var body: some View {
        let columns = [GridItem(.flexible(), spacing: 8),
                       GridItem(.flexible(), spacing: 8)]

        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    spacing: 8
                ) {
                    ForEach(movies) { movie in
                        MoviePosterView(viewModel: viewModel, movie: movie)
                            .onTapGesture {
                                viewModel.selectedMovie = movie
                                isSheetOpen = true
                            }
                    }
                }
                .padding(8)
            }
            .navigationTitle("Now Playing")
            .sheet(isPresented: $isSheetOpen) {
                if viewModel.selectedMovie != nil {
                    MovieDetailsView(
                        viewModel: viewModel,
                        movie: viewModel.selectedMovie!
                    )
                    .padding(8)
                    .presentationDetents([.fraction(0.7), .large])
                } else {
                    Text("Unable to open the selected movie.")
                }
            }
        }
    }
}

private struct MoviePosterView: View {
    @ObservedObject var viewModel: MoviesViewModel
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: viewModel.getMovieImageURL(
                from: movie.posterPath ?? "",
                in: .medium
            )) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            .cornerRadius(6)
        }
    }
}

#Preview {
    MovieGridView()
}
