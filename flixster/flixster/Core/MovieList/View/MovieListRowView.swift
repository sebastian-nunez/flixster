//
//  MovieListRowView.swift
//  flixster
//
//  Created by Sebastian on 1/28/24.
//

import Kingfisher
import SwiftUI

struct MovieListRowView: View {
    var movie: Movie

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            // image

            KFImage(URL(string: movie.imageUrl))
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
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
            }

            Divider()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MovieListRowView(movie: Movie.MOCK_MOVIE_LIST[0])
}
