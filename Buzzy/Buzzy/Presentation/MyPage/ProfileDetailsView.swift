//
//  Untitled.swift
//  Buzzy
//
//  Created by Min on 9/24/24.
//

import SwiftUI
import PhotosUI

struct ProfileDetailsView: View {
    @State private var selectedImage: UIImage? = nil
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var showImagePicker: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                HStack(spacing: 16) {
                    
                    ZStack(alignment: .bottomTrailing) {
                        
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 85, height: 85)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 1))
                                .padding(.leading, 5)
                        } else {
                            Image("1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 1))
                                .padding(.leading, 5)
                        }
                        
                        // Camera icon
                        Image(systemName: "camera.circle.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.white) // Change color as needed
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                            .padding(5) // Adjust padding to position icon
                    }
                    .onTapGesture {
                        showImagePicker = true
                    }
                    
                    VStack(alignment: .leading) {
                        Text("마동석")
                            .font(.bold24)
                        Text("남성·53세·성동구")
                            .font(.regular16)
                    }
                }
                
                
                .padding(.top, 32)
                Divider()
                    .padding(.bottom, 20)
                
                
                VStack(alignment: .leading, spacing: 14) {
                    Text("자기 소개")
                        .font(.semibold24)
                    Text("50자 이상 작성하면 채용될 확률이 15% 올라요!")
                        .font(.regular14)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    HStack {
                        Spacer()
                        
                        Button {
                            print("자기소개 추가하기 버튼")
                        } label: {
                            Text("+추가하기")
                                .font(.semibold20)
                                .foregroundStyle(.white)
                                .frame(width: 340, height: 50)
                                .background(.accent)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    Divider()
                    
                    
                    Text("경력")
                        .font(.semibold24)
                    
                    Text("1개만 작성해도 채용될 확률이 올라요!")
                        .font(.regular14)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            print("경력 추가하기 버튼")
                        } label: {
                            Text("+추가하기")
                                .font(.semibold20)
                                .foregroundStyle(.white)
                                .frame(width: 340, height: 50)
                                .background(.accent)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 10)

                    Divider()
                    
                    
                    Text("나의 장점")
                        .font(.semibold24)
                    HStack {
                        Spacer()
                        
                        Button {
                            print("나의 장점 추가하기 버튼")
                        } label: {
                            Text("+추가하기")
                                .font(.semibold20)
                                .foregroundStyle(.white)
                                .frame(width: 340, height: 50)
                                .background(.accent)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    Divider()
                    
                    
                    Text("추가 정보")
                        .font(.semibold24)

                    Text("예) 보건증, 운전면허, 장기근무 가능 여부 등")
                        .font(.regular14)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    HStack {
                        Spacer()
                        
                        Button {
                            print("추가 정보 추가하기 버튼")
                        } label: {
                            Text("+추가하기")
                                .font(.semibold20)
                                .foregroundStyle(.white)
                                .frame(width: 340, height: 50)
                                .background(.accent)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
            .navigationTitle("지원서 관리")
            .padding(.horizontal, 24.0)
        }
        .photosPicker(isPresented: $showImagePicker, selection: $selectedItem)
                .onChange(of: selectedItem) { newItem in
                    if let newItem = newItem {
                        Task {
                            if let imageData = try? await newItem.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: imageData) {
                                selectedImage = uiImage
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileDetailsView()
}
