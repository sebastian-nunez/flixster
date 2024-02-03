//
//  MovieService.swift
//  flixster
//
//  Created by Sebastian on 2/2/24.
//

import Foundation

protocol MovieService {
    func getMovieImageURL(from imagePath: String, in size: ImageSize) -> URL
    func getNowPlaying(completion: @escaping ([Movie]) -> Void)
    func getRelatedMovies(for movieId: Int, completion: @escaping ([Movie]) -> Void)
}
