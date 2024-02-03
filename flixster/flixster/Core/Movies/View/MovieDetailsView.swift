//
//  MovieDetailsView.swift
//  flixster
//
//  Created by Sebastian on 1/28/24.
//

import Kingfisher
import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MoviesViewModel
    var movie: Movie
    
    @State private var showRelatedMovies = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // image
            HStack {
                Spacer()
                KFImage(viewModel.getMovieImageURL(from: movie.backdropPath ?? "", in: .medium))
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 8)
                Spacer()
            }
                        
            VStack(spacing: 8) {
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
            }
                        
            // overview
            Text(movie.overview)
                .font(.body)
                .multilineTextAlignment(.leading)
                
            Spacer()
            
            // browse related movies button
            Button {
                viewModel.selectedMovie = movie
                viewModel.getRelatedMovies()
                showRelatedMovies = true
            } label: {
                Text("Browse Related Movies")
                    .fontWeight(.semibold)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical, 8)
        }
        .padding(.vertical, 8)
        .sheet(isPresented: $showRelatedMovies) {
            if viewModel.selectedMovie != nil && viewModel.relatedMovies.count > 0 {
                // related movies
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                        
                    Text("Related Movies")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.relatedMovies) { movie in
                                VStack {
                                    AsyncImage(url: viewModel.getMovieImageURL(
                                        from: movie.posterPath ?? "",
                                        in: .medium
                                    )) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 150, height: 200)
                                    .cornerRadius(8)
                                        
                                    Text(movie.title)
                                        .font(.headline)
                                        .frame(maxWidth: 150)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                    .scrollTargetBehavior(.paging)
                }
                .padding(8)
                .presentationDetents([.height(275)])
            } else {
                Text("No related movies available.")
                    .font(.headline)
                    .presentationDetents([.height(150)])
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetailsView(
            viewModel: MoviesViewModel(with: MovieServiceImpl()),
            movie: Movie.MOCK_MOVIE
        )
    }
}
