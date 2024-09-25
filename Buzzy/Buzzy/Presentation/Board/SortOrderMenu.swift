//
//  SortOrderMenu.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct SortOrderMenu: View {
    @Binding var sortOrder: BoardView.SortOrder
    
    public var body: some View {
        Menu {
            ForEach(BoardView.SortOrder.allCases, id: \.self) { order in
                Button(order.rawValue) { sortOrder = order }
            }
        } label: {
            HStack {
                Text(sortOrder.rawValue)
                Image(systemName: "chevron.down")
            }
            .font(.semibold16)
            .foregroundColor(.orange)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
        }
    }
}

struct SortOrderMenu_Previews: PreviewProvider {
    static var previews: some View {
        SortOrderMenu(sortOrder: .constant(.recommended))
    }
}

