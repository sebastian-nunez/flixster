//
//  MovieListViewModel.swift
//  flixster
//
//  Created by Sebastian on 1/28/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie]

    init() {
        movies = Movie.MOCK_MOVIE_LIST
    }
}
