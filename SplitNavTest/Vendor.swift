//
//  Vendor.swift
//  SplitNavTest
//
//  Created by Erik Loehfelm on 7/31/24.
//

import SwiftUI

struct VendorView: View {
    
    @State var vendor: Vendor
    
    var body: some View {
        Text("Vendor: \(vendor.name)")
            .font(.caption)
        Text("Contact: \(vendor.contactNumber)")
            .font(.caption2)
    }
}

//#Preview {
//    Vendor()
//}
