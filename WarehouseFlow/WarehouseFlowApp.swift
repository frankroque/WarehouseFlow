//
//  WarehouseFlowApp.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/5/21.
//

import SwiftUI
import Firebase

@main
struct WarehouseFlowApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
