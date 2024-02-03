//
//  MovieServiceImpl.swift
//  flixster
//
//  Created by Sebastian on 2/2/24.
//

import Foundation

class MovieServiceImpl: MovieService {
    private let API_KEY = "3c6e94aef084556b358822b72bb87eeb" // YOLO

    func getMovieImageURL(from imagePath: String, in size: ImageSize) -> URL {
        return URL(string: "https://image.tmdb.org/t/p/w\(size.rawValue)\(imagePath)")!
    }

    func getNowPlaying(completion: @escaping ([Movie]) -> Void) {
        let endpointUrl = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(API_KEY)")!

        URLSession.shared.dataTask(with: endpointUrl) { data, response, error in
            if let error = error {
                print("DEBUG: Network error while fetching now playing movies: \(error.localizedDescription)")
                return
            }

            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("DEBUG: Fetch now playing movies failed with response code \(response.statusCode)")
                    return
                }
            }

            guard let data = data else {
                print("DEBUG: no data received while fetching the now playing movies")
                return
            }

            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                let movies = response.results
                completion(movies)
            } catch {
                print("DEBUG: error occured while decoding JSON response from getNowPlaying")
            }
        }.resume()
    }

    func getRelatedMovies(for movieId: Int, completion: @escaping ([Movie]) -> Void) {
        let endpointUrl = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/similar?api_key=\(API_KEY)")!

        URLSession.shared.dataTask(with: endpointUrl) { data, response, error in
            if let error = error {
                print("DEBUG: Network error while fetching getRelatedMovies: \(error.localizedDescription)")
                return
            }

            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("DEBUG: Fetch getRelatedMovies failed with response code \(response.statusCode)")
                    return
                }
            }

            guard let data = data else {
                print("DEBUG: no data received from getRelatedMovies")
                return
            }

            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                let relatedMovies = response.results
                completion(relatedMovies)
            } catch {
                print("DEBUG: error occured while decoding JSON response from getRelatedMovies")
                print(error)
            }
        }.resume()
    }
}
