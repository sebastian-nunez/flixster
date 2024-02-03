//
//  MovieListView.swift
//  flixster
//
//  Created by Sebastian on 1/28/24.
//

import Kingfisher
import SwiftUI

struct MovieListView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = MoviesViewModel(with: MovieServiceImpl())

    private var movies: [Movie] {
        viewModel.movies
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(movies) { movie in
                        NavigationLink(value: movie) {
                            MovieListRowView(viewModel: viewModel, movie: movie)
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
            .navigationTitle("Now Playing")
            .navigationBarTitleDisplayMode(.inline)
            .tint(colorScheme == .dark ? .white : .black)
            .navigationDestination(for: Movie.self, destination: { movie in
                MovieDetailsView(
                    viewModel: viewModel,
                    movie: movie)
                    .padding(.horizontal, 8)
            })
        }
    }
}

private struct MovieListRowView: View {
    @ObservedObject var viewModel: MoviesViewModel
    var movie: Movie

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            // image
            KFImage(viewModel.getMovieImageURL(from: movie.posterPath ?? "", in:
                .medium))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 55, maxHeight: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .shadow(radius: 6)

            VStack(alignment: .leading, spacing: 5) {
                // title
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(1)

                // overview
                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundStyle(Color(.systemGray))
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
            }

            Divider()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MovieListView()
}
