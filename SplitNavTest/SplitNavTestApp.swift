//
//  SplitNavTestApp.swift
//  SplitNavTest
//
//  Created by Erik Loehfelm on 7/31/24.
//

import SwiftUI

@main
struct SplitNavTestApp: App {

    @State private var appModel = AppModel()
    
    @StateObject private var storeDataReader = StoreDataReader()

    var body: some Scene {
        WindowGroup {
            ContentView(storeDataReader: storeDataReader)
                .environment(appModel)
        }
        
        WindowGroup(id: "itemDetail", for: Item.self) { item in
            if let item = item.wrappedValue {
                ItemDetailView(item: item)
            } else {
                Text("no item selected")
            }
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
