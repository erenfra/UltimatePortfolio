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
      NavigationSplitView {
        SidebarView()
      } content: {
        MainView()
      } detail: {
        DetailView()
      }
      .environment(\.managedObjectContext, dataController.container.viewContext)
      .environmentObject(dataController)
    }
  }
}
