//
//  SidebarView.swift
//  UltimatePortfolio
//
//  Created by Renato Oliveira Fraga on 9/23/24.
//

import SwiftUI

struct SidebarView: View {
  @EnvironmentObject var dataController: DataController
  let smartFilter: [Filter] = [.all, .recent]

  @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var tags: FetchedResults<Tag>

  var tagFilters: [Filter] {
    tags.map { tag in
      Filter(id: tag.id ?? UUID(), name: tag.name ?? "No name", icon: "tag", tag: tag)
    }
  }

    var body: some View {
      List(selection: $dataController.selectedFilter) {
        Section("Smart Filters") {
          ForEach(smartFilter) { filter in
            NavigationLink(value: filter) {
              Label(filter.name, systemImage: filter.icon)
            }
          }
        }

        Section("Tags") {
          ForEach(tagFilters) { filter in
            NavigationLink(value: filter) {
              Label(filter.name, systemImage: filter.icon)
            }
          }
        }

      }.toolbar {
        Button {
          dataController.deleteAll()
          dataController.createSampleData()
        } label: {
          Label("ADD SAMPLES", systemImage: "flame")
        }
      }
    }
}

#Preview {
  NavigationStack {
    SidebarView()
      .environmentObject(DataController.preview)
  }
}
