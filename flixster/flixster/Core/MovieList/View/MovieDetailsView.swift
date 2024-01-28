//
//  MovieDetailsView.swift
//  flixster
//
//  Created by Sebastian on 1/28/24.
//

import Kingfisher
import SwiftUI

struct MovieDetailsView: View {
    var movie: Movie
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 16) {
                // image
                HStack {
                    Spacer()
                    KFImage(URL(string: movie.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 8)
                    
                    Spacer()
                }
                
                VStack(spacing: 16) {
                    // title
                    Text(movie.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                    
                    HStack {
                        Spacer()
                        VStack {
                            // rating
                            Text("\(String(format: "%.1f", movie.voteAverage)) Vote Average")
                            
                            // popularity
                            Text("\(String(format: "%.0f", movie.voteCount)) votes")
                        }
                        
                        Spacer()
                        
                        // popularity
                        VStack {
                            Text("\(String(format: "%.1f", movie.popularity)) ")
                            Text("Popularity")
                        }
                        
                        Spacer()
                    }
                    .font(.callout)
                    .foregroundStyle(.gray)
                    
                    // overview
                    Text(movie.overview)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}

#Preview {
    MovieDetailsView(movie: Movie.MOCK_MOVIE_LIST[0])
}
