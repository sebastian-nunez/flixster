import Foundation

struct Movie: Identifiable, Codable, Hashable {
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieResponse: Codable {
    let results: [Movie]
}

enum ImageSize {
    case small
    case medium

    var rawValue: Int {
        switch self {
        case .small:
            return 200
        case .medium:
            return 500
        }
    }
}

extension Movie {
    static let MOCK_MOVIE = Movie(
        id: 572802,
        adult: false,
        backdropPath: "/cnqwv5Uz3UW5f086IWbQKr3ksJr.jpg",
        genreIDS: [
            28,
            12,
            14
        ],
        originalLanguage: "en",
        originalTitle: "Aquaman and the Lost Kingdom",
        overview: """
        Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.
        """,
        popularity: 2392.899,
        posterPath: "/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg",
        releaseDate: "2023-12-20",
        title: "Aquaman and the Lost Kingdom",
        video: false,
        voteAverage: 6.992,
        voteCount: 1267)
}
