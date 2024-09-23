//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Renato Oliveira Fraga on 9/22/24.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
  @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            MainView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
        }
    }
}
