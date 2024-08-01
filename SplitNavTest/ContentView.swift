//
//  ContentView.swift
//  SplitNavTest
//
//  Created by Erik Loehfelm on 7/31/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @ObservedObject var storeDataReader: StoreDataReader
    
    @State var selectedCategoryItem: CategoryItem?
    
    var body: some View {
        NavigationSplitView {
            // this determines what item was selected in the
            // left nav and passes it to the detail view
            List(selection: $selectedCategoryItem) {
                // run through the top level array to get categories
                // these are the 'groups' in the left panel
                ForEach(storeDataReader.store.categories) { category in
                    // the groups are created by making a section and
                    // using the header of the section for the text
                    Section {
                        // next, dig down to the next array of objects
                        ForEach(category.categoryItems) { categoryItem in
                            // make a link in the left nav for each item
                            // in the second array of items
                            NavigationLink(value: categoryItem) {
                                Label(categoryItem.name, systemImage: "pencil")
                            }
                        }
                    } header: {
                        Text(category.name).font(.title3)
                    }
                }
            }
            .navigationTitle(storeDataReader.store.name)
            // this sets the first item as selected in the list in the left panel
            .onAppear {
                selectedCategoryItem = storeDataReader.store.categories.first?.categoryItems.first
            }
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
            // the deail: below is the view that is in the main
            // window in the SplitView. This takes the selected item and
            // passes it to the appropriate view. You could define that view
            // in here, but its cleaner to move it out
        } detail: {
            if let c = selectedCategoryItem {
                CategoryItemsView(categoryItem: c)
            } else {
                Text("Select a category")
            }
        }
    }
}
                    
                    
                    
                    
                    
                    
                    
//                    Section(header: Text(category.name)) {
//                        ForEach(category.items) { item in
//                            NavigationLink(value: item) {
//                                Label(item.name, systemImage: "pencil")
//                            }
////                            VStack(alignment: .leading) {
////                                CategoryItem(item: item)
////                                    Text(item.name)
////                                        .font(.headline)
////                                    Text(item.description)
////                                    Text(String(format: "$%.2f", item.price))
////                                        .font(.subheadline)
////                                if let vendor = data.root.store.vendors.first(where: { $0.id == item.vendorId }) {
////                                    
////                                    VendorView(vendor: vendor)
////                                    
//////                                        Text("Vendor: \(vendor.name)")
//////                                            .font(.caption)
//////                                        Text("Contact: \(vendor.contactNumber)")
//////                                            .font(.caption2)
////                                }
//                            }
//                        }
//                    }
//                }
//                .navigationTitle("Store Inventory")
//        } detail: {
//            Text("detail")
//            
//        }
//    }
//}

//#Preview(windowStyle: .automatic) {
//    ContentView()
//        .environment(AppModel())
//}
