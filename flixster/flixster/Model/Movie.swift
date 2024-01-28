import Foundation

struct Movie: Identifiable, Codable, Hashable {
    var id: Int
    var title: String
    var imageUrl: String
    var overview: String
    var voteAverage: Double
    var voteCount: Double
    var popularity: Double
    var releaseDate: String
}

extension Movie {
    static let MOCK_MOVIE_LIST: [Movie] = [
        Movie(id: 787699,
              title: "Wonka",
              imageUrl: "https://image.tmdb.org/t/p/original/qhb1qOilapbapxWQn9jtRCMwXJF.jpg",
              overview: """
              Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.
              """,
              voteAverage: 7.205,
              voteCount: 1503,
              popularity: 3324.613,
              releaseDate: "2023-12-06"),
                
        Movie(id: 940551,
              title: "Migration",
              imageUrl: "https://image.tmdb.org/t/p/original/ldfCF9RhR40mppkzmftxapaHeTo.jpg",
              overview: """
              After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.
              """,
              voteAverage: 7.731,
              voteCount: 270,
              popularity: 2295.419,
              releaseDate: "2023-12-06"),
                
        Movie(id: 1022796,
              title: "Wish",
              imageUrl: "https://image.tmdb.org/t/p/original/AcoVfiv1rrWOmAdpnAMnM56ki19.jpg",
              overview: """
              Asha, a sharp-witted idealist, makes a wish so powerful that it is answered by a cosmic force – a little ball of boundless energy called Star. Together, Asha and Star confront a most formidable foe - the ruler of Rosas, King Magnifico - to save her community and prove that when the will of one courageous human connects with the magic of the stars, wondrous things can happen.
              """,
              voteAverage: 6.531,
              voteCount: 429,
              popularity: 1647.057,
              releaseDate: "2023-11-13"),
                
        Movie(id: 906126,
              title: "Society of the Snow",
              imageUrl: "https://image.tmdb.org/t/p/original/2e853FDVSIso600RqAMunPxiZjq.jpg",
              overview: """
              On October 13, 1972, Uruguayan Air Force Flight 571, chartered to take a rugby team to Chile, crashes into a glacier in the heart of the Andes.
              """,
              voteAverage: 8.092,
              voteCount: 1409,
              popularity: 965.245,
              releaseDate: "2023-12-13"),
                
        Movie(id: 1211957,
              title: "The Painter",
              imageUrl: "https://image.tmdb.org/t/p/original/UZ0ydgbXtnrq8xZCI5lHVXVcH9.jpg",
              overview: """
              An ex-CIA operative is thrown back into a dangerous world when a mysterious woman from his past resurfaces. Now exposed and targeted by a relentless killer and a rogue black ops program, he must rely on skills he thought he left behind in a high-stakes game of survival.
              """,
              voteAverage: 6.554,
              voteCount: 28,
              popularity: 574.987,
              releaseDate: "2024-01-05"),
                
        Movie(id: 792307,
              title: "Poor Things",
              imageUrl: "https://image.tmdb.org/t/p/original/kCGlIMHnOm8JPXq3rXM6c5wMxcT.jpg",
              overview: """
              Brought back to life by an unorthodox scientist, a young woman runs off with a debauched lawyer on a whirlwind adventure across the continents. Free from the prejudices of her times, she grows steadfast in her purpose to stand for equality and liberation.
              """,
              voteAverage: 8.156,
              voteCount: 413,
              popularity: 624.926,
              releaseDate: "2023-12-07"),
                
        Movie(id: 848187,
              title: "Role Play",
              imageUrl: "https://image.tmdb.org/t/p/original/7MhXiTmTl16LwXNPbWCmqxj7UxH.jpg",
              overview: """
              Emma has a wonderful husband and two kids in the suburbs of New Jersey – she also has a secret life as an assassin for hire – a secret that her husband David discovers when the couple decide to spice up their marriage with a little role play.
              """,
              voteAverage: 5.877,
              voteCount: 211,
              popularity: 592.402,
              releaseDate: "2023-12-14"),
                
        Movie(id: 872585,
              title: "Oppenheimer",
              imageUrl: "https://image.tmdb.org/t/p/original/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
              overview: """
              The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.
              """,
              voteAverage: 8.116,
              voteCount: 6377,
              popularity: 561.758,
              releaseDate: "2023-07-19"),
                
        Movie(id: 508883,
              title: "The Boy and the Heron",
              imageUrl: "https://image.tmdb.org/t/p/original/jDQPkgzerGophKRRn7MKm071vCU.jpg",
              overview: """
              While the Second World War rages, the teenage Mahito, haunted by his mother's tragic death, is relocated from Tokyo to the serene rural home of his new stepmother Natsuko, a woman who bears a striking resemblance to the boy's mother. As he tries to adjust, this strange new world grows even stranger following the appearance of a persistent gray heron, who perplexes and bedevils Mahito, dubbing him the "long-awaited one."
              """,
              voteAverage: 7.438,
              voteCount: 833,
              popularity: 581.842,
              releaseDate: "2023-07-14"),
                
        Movie(id: 1212073,
              title: "Sixty Minutes",
              imageUrl: "https://image.tmdb.org/t/p/original/jojfbnIHGsRpodIood3OQoqA45Y.jpg",
              overview: """
              Desperate to keep custody of his daughter, a mixed martial arts fighter abandons a big match and races across Berlin to attend her birthday party.
              """,
              voteAverage: 6.742,
              voteCount: 124,
              popularity: 727.488,
              releaseDate: "2024-01-19"),
                
        Movie(id: 866398,
              title: "The Beekeeper",
              imageUrl: "https://image.tmdb.org/t/p/original/A7EByudX0eOzlkQ2FIbogzyazm2.jpg",
              overview: """
              One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.
              """,
              voteAverage: 7.5,
              voteCount: 190,
              popularity: 457.521,
              releaseDate: "2024-01-10"),
                
        Movie(id: 1072790,
              title: "Anyone But You",
              imageUrl: "https://image.tmdb.org/t/p/original/yRt7MGBElkLQOYRvLTT1b3B1rcp.jpg",
              overview: """
              After an amazing first date, Bea and Ben’s fiery attraction turns ice cold — until they find themselves unexpectedly reunited at a destination wedding in Australia. So they do what any two mature adults would do: pretend to be a couple.
              """,
              voteAverage: 7.24,
              voteCount: 125,
              popularity: 465.559,
              releaseDate: "2023-12-21"),
                
        Movie(id: 1214314,
              title: "One More Shot",
              imageUrl: "https://image.tmdb.org/t/p/original/nQ1BQg4yMdlYSHvHZgwladzy7EF.jpg",
              overview: """
              Following the attack on the black site in Poland, Navy SEAL Jake Harris is ordered to escort terrorist suspect Amin Mansur to Washington D.C. for interrogation. Before the prisoner transfer process is complete, though, the airport is attacked by a group of heavily armed, well-trained mercenaries.
              """,
              voteAverage: 6.744,
              voteCount: 80,
              popularity: 425.675,
              releaseDate: "2024-01-12"),
                
        Movie(id: 1072342,
              title: "Night Swim",
              imageUrl: "https://image.tmdb.org/t/p/original/gSkfBGdxdialBMM7P02V4hcI6Ij.jpg",
              overview: """
              Forced into early retirement by a degenerative illness, former baseball player Ray Waller moves into a new house with his wife and two children. He hopes that the backyard swimming pool will be fun for the kids and provide physical therapy for himself. However, a dark secret from the home's past soon unleashes a malevolent force that drags the family into the depths of inescapable terror.
              """,
              voteAverage: 5.81,
              voteCount: 126,
              popularity: 357.394,
              releaseDate: "2024-01-03"),
                
        Movie(id: 1216784,
              title: "Sunrise",
              imageUrl: "https://image.tmdb.org/t/p/original/4aRvg2ybz646gciX5M6qaclunC2.jpg",
              overview: """
              When an ex-cop named Fallon returns to the scene of a horrific crime, the residents of a rural town soon discover that this dark visitor is really a vampire who feeds on blood and fear. After he is befriended by a kind immigrant family, the instinctive killer is faced with a choice between revenge and redemption.
              """,
              voteAverage: 5.25,
              voteCount: 4,
              popularity: 490.598,
              releaseDate: "2024-01-19"),
                
        Movie(id: 695721,
              title: "The Hunger Games: The Ballad of Songbirds & Snakes",
              imageUrl: "https://image.tmdb.org/t/p/original/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
              overview: """
              64 years before he becomes the tyrannical president of Panem, Coriolanus Snow sees a chance for a change in fortunes when he mentors Lucy Gray Baird, the female tribute from District 12.
              """,
              voteAverage: 7.215,
              voteCount: 1593,
              popularity: 431.268,
              releaseDate: "2023-11-15"),
    ]
}
