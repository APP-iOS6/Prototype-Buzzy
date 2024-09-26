//
//  BoardPost.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/26/24.
//

import Foundation

public struct BoardPost: Identifiable, Codable {
    public let id: UUID
    public var title: String
    public var content: String
    public var author: String
    public var profileImage: String
    public var comments: [BoardComment]
    public var likes: Int
    public var isScrapped: Bool
    public var imageName: String
    public var createdAt: Date

    public init(id: UUID = UUID(), title: String, content: String, author: String, profileImage: String, comments: [BoardComment] = [], likes: Int = 0, isScrapped: Bool = false, imageName: String = "defaultImage", createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.content = content
        self.author = author
        self.profileImage = profileImage
        self.comments = comments
        self.likes = likes
        self.isScrapped = isScrapped
        self.imageName = imageName
        self.createdAt = createdAt
    }
}

public struct BoardComment: Identifiable, Codable {
    public let id: UUID
    public let author: String
    public let content: String
    public var replies: [BoardComment]
    
    public init(id: UUID = UUID(), author: String, content: String, replies: [BoardComment] = []) {
        self.id = id
        self.author = author
        self.content = content
        self.replies = replies
    }
}
