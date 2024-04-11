//
//  SwiftData_CRUDApp.swift
//  SwiftData_CRUD
//
//  Created by Lucas Daniel Costa da Silva on 10/04/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftData_CRUDApp: App {
  var body: some Scene {
    WindowGroup {
      BookListView()
    }
    .modelContainer(for: Book.self)
  }
}
