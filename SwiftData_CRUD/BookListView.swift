//
//  BookListView.swift
//  SwiftData_CRUD
//
//  Created by Lucas Daniel Costa da Silva on 10/04/24.
//

import SwiftData
import SwiftUI

struct BookListView: View {
  @Environment(\.modelContext) private var context
  @Query(sort: \Book.title) private var books: [Book]
    
  @State private var createNewBook = false
  
  var body: some View {
    NavigationStack{
      Group{
          if !books.isEmpty {
          List{
            ForEach(books) { book in
              NavigationLink{
                EditBookView(book: book)
              } label: {
                HStack(spacing: 16) {
                  VStack(alignment: .leading) {
                    Text(book.title).font(.title2)
                    HStack(spacing: 8) {
                      Text(book.author).foregroundStyle(.secondary)
                      Text("Editora " + book.publisher).foregroundStyle(.secondary)
                    }
                  }
                }
              }
            }
            .onDelete{ indexSet in
              indexSet.forEach{ index in
                let book = books[index]
                context.delete(book)
              }
            }
          }
        }
        else {
          ContentUnavailableView("Insira o seu primeiro livro!", systemImage: "book")
        }
      }
      .listStyle(.plain)
      .navigationTitle("Meus Livros")
      .toolbar {
        Button {
          createNewBook = true
        } label: {
          Image(systemName: "plus.circle.fill")
            .imageScale(.large)
        }
      }
      .sheet(isPresented: $createNewBook) {
        NewBookView()
      }
    }
  }
}

#Preview {
  BookListView()
    .modelContainer(for: Book.self, inMemory: true)
}
