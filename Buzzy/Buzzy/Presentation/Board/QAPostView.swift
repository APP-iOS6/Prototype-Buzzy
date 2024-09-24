//
//  QAPostView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/24/24.
//

import SwiftUI

public struct QAPostView: View {
    public var body: some View {
        PostView(title: "Q&A 제목", content: "질문 내용 미리보기...")
    }
}

struct QAPostView_Previews: PreviewProvider {
    static var previews: some View {
        QAPostView()
    }
}
