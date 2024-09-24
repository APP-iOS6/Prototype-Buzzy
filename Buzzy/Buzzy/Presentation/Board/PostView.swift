//
//  PostView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct PostStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
            .padding(.horizontal)
    }
}

public struct PostView: View {
    let title: String
    let content: String
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.headline)
            Text(content).font(.subheadline).foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .modifier(PostStyle())
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(title: "Sample Title", content: "This is a sample content for the post.")
    }
}

