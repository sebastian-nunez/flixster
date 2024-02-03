//
//  TabBar.swift
//  flixster
//
//  Created by Sebastian on 2/2/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            MovieGridView()
                .tabItem {
                    Label("Grid", systemImage: "square.grid.3x3.fill")
                }

            MovieListView()
                .tabItem {
                    Label("List", systemImage: "list.dash.header.rectangle")
                }
        }
    }
}

#Preview {
    TabBar()
}
