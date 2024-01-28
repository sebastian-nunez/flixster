//
//  MovieListView.swift
//  flixster
//
//  Created by Sebastian on 1/28/24.
//

import SwiftUI

struct MovieListView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = MovieListViewModel()

    var movies: [Movie] {
        viewModel.movies
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(movies) { movie in
                        NavigationLink(value: movie) {
                            MovieListRowView(movie: movie)
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
            .tint(colorScheme == .dark ? .white : .black)
            .navigationDestination(for: Movie.self, destination: { movie in
                MovieDetailsView(movie: movie)
                    .padding(.horizontal, 8)
            })
        }
    }
}

#Preview {
    MovieListView()
}
