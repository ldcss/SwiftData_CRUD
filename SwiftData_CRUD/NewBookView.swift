//
//  NewBookView.swift
//  SwiftData_CRUD
//
//  Created by Lucas Daniel Costa da Silva on 10/04/24.
//

import Foundation
import SwiftUI

struct NewBookView: View {
  @Environment(\.modelContext) private var context
  @Environment(\.dismiss) var dismiss
  
    @State private var title: String = .empty
  @State private var author: String = .empty
  @State private var publisher: String = .empty
  var body: some View {
    NavigationStack {
      Form {
        TextField("Título do livro", text: $title)
        TextField("Autor do livro", text: $author)
        TextField("Editora do livro", text: $publisher)
        Button("Criar"){
          let newBook = Book(title: title, author: author, publisher: publisher)
          context.insert(newBook)
          dismiss()
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(.borderedProminent)
        .disabled(title.isEmpty || author.isEmpty || publisher.isEmpty)
        .navigationTitle("Novo livro")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .topBarLeading){
            Button("Cancelar"){
              dismiss()
            }
          }
        }
        
      }
    }
  }
}

#Preview {
  NewBookView()
}
