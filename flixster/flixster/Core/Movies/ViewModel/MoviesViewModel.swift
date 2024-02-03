//
//  MovieListViewModel.swift
//  flixster
//
//  Created by Sebastian on 1/28/24.
//

import Foundation

class MoviesViewModel: ObservableObject {
    @Published var movies = [Movie]()
    @Published var relatedMovies = [Movie]()
    @Published var selectedMovie: Movie? = nil

    private let service: MovieService

    init(with service: MovieService) {
        self.service = service

        Task {
            service.getNowPlaying { movies in
                self.movies = movies
            }
        }
    }

    func getRelatedMovies() {
        if selectedMovie == nil {
            print("DEBUG: no movie selected, unable to find related movies.")
            return
        }

        service.getRelatedMovies(for: selectedMovie?.id ?? 0) { movies in
            self.relatedMovies = movies
        }
    }

    func getMovieImageURL(from url: String, in size: ImageSize) -> URL {
        service.getMovieImageURL(from: url, in: size)
    }
}
