//
//  TipPostView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct TipPostView: View {
    public var body: some View {
        PostView(title: "꿀팁 제목", content: "꿀팁 내용 미리보기...")
    }
}

struct TipPostView_Previews: PreviewProvider {
    static var previews: some View {
        TipPostView()
    }
}
