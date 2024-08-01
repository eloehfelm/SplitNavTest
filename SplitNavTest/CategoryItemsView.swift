//
//  CategoryItemsView.swift
//  SplitNavTest
//
//  Created by Erik Loehfelm on 7/31/24.
//

import SwiftUI

struct CategoryItemsView: View {
    var categoryItem: CategoryItem
    @State private var searchText: String = ""
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.pushWindow) private var pushWindow
    
    var body: some View {
        List {
            ForEach(categoryItem.items) { item in
                Button {
                    pushWindow(id: "itemDetail", value: item)
                } label: {
                    HStack {
                        Text(item.name)
                        Text(item.description)
                    }
                }
            }
        }
        .navigationTitle(categoryItem.name)
        .toolbar {
            Button {
                print("filter pressed")
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
            }
            .buttonBorderShape(.circle)
            .buttonStyle(.bordered)
            
            Button {
                print("filter pressed")
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
            }
            .buttonBorderShape(.circle)
            .buttonStyle(.bordered)
        }
        .searchable(text: $searchText)
    }
}

//#Preview {
//    CategoryItemsView()
//}
