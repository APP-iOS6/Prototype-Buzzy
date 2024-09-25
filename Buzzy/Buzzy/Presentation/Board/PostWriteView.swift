//
//  PostWriteView.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/26/24.
//

import SwiftUI

struct PostWriteView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var selectedBoard: BoardType = .tips
    @State private var temporarySaveCount: Int = 0
    @State private var showingBoardPicker = false
    
    enum BoardType: String, CaseIterable {
        case tips = "꿀팁 게시판"
        case qa = "Q&A 게시판"
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Button(action: {
                    showingBoardPicker = true
                }) {
                    HStack {
                        Text(selectedBoard.rawValue)
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .foregroundColor(.accentColor)
                    .font(.semibold16)
                    .padding()
                }
                .sheet(isPresented: $showingBoardPicker) {
                    VStack {
                        Picker("게시판 선택", selection: $selectedBoard) {
                            ForEach(BoardType.allCases, id: \.self) { boardType in
                                Text(boardType.rawValue).tag(boardType)
                            }
                        }
                        .font(.regular16)
                        .pickerStyle(WheelPickerStyle())
                        
                        Button("선택") {
                            showingBoardPicker = false
                            
                        }
                        .font(.regular20)
                        .padding()
                    }
                }
                
                Divider().padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 0) {
                    // 제목 입력
                    HStack {
                        TextField(" 제목을 입력해주세요.", text: $title)
                            .font(.semibold20)
                            .foregroundColor(.gray.opacity(0.7))
                    }
                    .padding(.vertical, 15)
                    
                    Divider()
                    
                    // 내용 입력
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $content)
                            .font(.regular16)
                            .frame(maxHeight: .infinity)
                        if content.isEmpty {
                            Text("내용을 입력해주세요.")
                                .font(.regular16)
                                .foregroundColor(.gray.opacity(0.5))
                                .padding(.top, 8)
                                .padding(.leading, 5)
                        }
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal)
                
                Divider().padding(.horizontal)
                
                // 하단 기능 버튼들
                HStack {
                    ForEach(["plus", "chart.bar", "play.circle", "face.smiling", "textformat", "list.bullet"], id: \.self) { icon in
                        Button(action: {
                            // 각 버튼의 액션 구현
                        }) {
                            Image(systemName: icon)
                                .font(.semibold20)
                                .foregroundColor(.accentColor)
                                .padding(10)
                        }
                    }
                    Spacer()
                    Button(action: {
                        // 설정 버튼 액션
                    }) {
                        Image(systemName: "gearshape")
                            .font(.semibold20)
                            .foregroundColor(.accentColor)
                            .padding(10)
                    }
                }
                .padding(.vertical)
            }
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.accentColor)
                },
                trailing: HStack(spacing: 10) {
                    Button("임시저장 \(temporarySaveCount)") {
                        temporarySaveCount += 1
                        // 임시저장 기능 구현
                    }
                    .font(.regular14)
                    .foregroundColor(.secondary)
                    
                    Button(action: {
                        // 게시글 제출 기능 구현
                    }) {
                        Text("등록")
                            .font(.semibold16)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20) // 좌우 패딩을 약간 줄임
                            .padding(.vertical, 8)
                            .background(Color.accentColor)
                            .cornerRadius(5)
                    }
                }
                .padding(.trailing, -5) // trailing에 음수 패딩을 주어 오른쪽 여백을 줄임
            )
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct PostWriteView_Previews: PreviewProvider {
    static var previews: some View {
        PostWriteView()
    }
}
