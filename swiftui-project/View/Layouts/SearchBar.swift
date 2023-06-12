//
//  SearchBar.swift
//  swiftui-project
//
//  Created by user238749 on 6/9/23.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @State private var text: String = ""
    @State private var isEditing = false
    
    var body: some View {
        HStack {
         
            TextField("", text: $text, prompt: Text("Search...").foregroundColor(Color("DarkGray")).font(.callout))
                .padding(.horizontal, UIConstants.largePadding)
                .padding(.vertical, UIConstants.smallPadding)
                .background(Color("DisabledColor"))
                .cornerRadius(UIConstants.cornerRadius)
                .padding(.horizontal, UIConstants.bigPadding)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("DarkGray"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, UIConstants.mediumPadding)
                        
                    })
                .onTapGesture {
                           self.isEditing = true
                        }
         
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.text = ""
         
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))

                    }
                }
        }    }

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
