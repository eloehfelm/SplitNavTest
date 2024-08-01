//
//  ItemDetailView.swift
//  SplitNavTest
//
//  Created by Erik Loehfelm on 7/31/24.
//

import SwiftUI

struct ItemDetailView: View {
    var item: Item
    
    var body: some View {
        VStack{
            Text(item.name)
            Text(item.description)
            Text("$\(item.price)")
        }
    }
}

//#Preview {
//    ItemDetailView()
//}
