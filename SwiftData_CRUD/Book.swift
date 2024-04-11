//
//  Book.swift
//  SwiftData_CRUD
//
//  Created by Lucas Daniel Costa da Silva on 10/04/24.
//

import Foundation
import SwiftData

@Model
class Book {
  var title: String
  var author: String
  var publisher: String
  var summary: String
  
  init(title: String, author: String, publisher: String, summary: String = "") {
    self.title = title
    self.author = author
    self.publisher = publisher
    self.summary = summary
  }
}
