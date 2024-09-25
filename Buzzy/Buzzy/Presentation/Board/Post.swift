//
//  Post.swift
//  Buzzy
//
//  Created by Hyeonjeong Sim on 9/25/24.
//

import Foundation
import Combine

public struct BoardComment: Identifiable, Codable {
    public let id: UUID
    public let author: String
    public let content: String
    
    public init(id: UUID = UUID(), author: String, content: String) {
        self.id = id
        self.author = author
        self.content = content
    }
}

public struct BoardPost: Identifiable, Codable {
    public let id: UUID
    public var title: String
    public var content: String
    public var comments: [BoardComment]
    public var likes: Int  // 좋아요 개수
    public var isScrapped: Bool
    public var imageName: String
    public var createdAt: Date  // 게시글 생성 시간
    
    public init(id: UUID = UUID(), title: String, content: String, comments: [BoardComment] = [], likes: Int = 0, isScrapped: Bool = false, imageName: String = "defaultImage", createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.content = content
        self.comments = comments
        self.likes = likes  // 임의로 좋아요 개수 설정 가능
        self.isScrapped = isScrapped
        self.imageName = imageName
        self.createdAt = createdAt
    }
}

public class PostFoundation: ObservableObject {
    @Published public var posts: [BoardPost] = []
    @Published public var qaPosts: [BoardPost] = []
    
    public init() {
        initializePosts()
    }
    
    private func initializePosts() {
        posts = [
            BoardPost(title: "편의점에서 진상 만나면 멘탈 지키는 법",
                      content: "진상 만나면 그냥 일단 무조건 웃고 넘겨야 됨. 괜히 말대꾸하다가 진상 더 빡치면 네가 더 피곤해짐.",
                      comments: [
                        BoardComment(author: "튜나", content: "ㄹㅇㅋㅋ"),
                        BoardComment(author: "요시", content: "나도 말대꾸 했다가 점장 불려가서 욕 먹음ㅋㅋ")
                      ],
                      likes: 12,
                      imageName: "ShopCat",
                      createdAt: Date(timeIntervalSinceNow: -1800)), // 30분 전
            
            BoardPost(title: "칼질하다 손 자주 베는 사람은 꼭 봐라",
                      content: "주방에서 일하다 보면 손 쉽게 다치잖아. 칼질할 때 무조건 손가락을 접고, 칼끝이랑 손가락이 최대한 멀어지게 하는 게 중요.",
                      comments: [
                        BoardComment(author: "준영", content: "ㅇㅈ… 특히 야채 많이 썰 때 멍하니 하다가 베는 경우 많음."),
                        BoardComment(author: "다영", content: "나도 멍 때리다가 딱 한 번 베었는데 그 이후로 칼 쓸 때 진짜 조심함.")
                      ],
                      likes: 8,
                      imageName: "Dogknife",
                      createdAt: Date(timeIntervalSinceNow: -3600)), // 1시간 전
            
            BoardPost(title: "길 잘 못 찾는 사람은 무조건 GPS 쓰자",
                      content: "배달할 때 길 헷갈리면 시간만 더 걸리잖아. 길 잘 몰라도 GPS로 목적지까지 바로 찾아가고, 미리 주소랑 주변 체크하는 게 시간 절약됨.",
                      comments: [
                        BoardComment(author: "영진", content: "맞아, GPS 없으면 길 잘못 들어가면 시간 다 날림ㅋㅋ"),
                        BoardComment(author: "수민", content: "나도 처음엔 헷갈렸는데 익숙해지니까 더 빠르게 다니게 됐어.")
                      ],
                      likes: 15,
                      imageName: "Where",
                      createdAt: Date(timeIntervalSinceNow: -7200)), // 2시간 전
            
            BoardPost(title: "주유소 알바할 때 손님 차 긁히면 끝장임",
                      content: "차 다룰 때는 절대 대충 하지 마. 주유기 옆에서 차 긁히면 진짜 큰일 남. 서두르면 바로 클레임 들어옴.",
                      comments: [
                        BoardComment(author: "지수", content: "나도 차 긁을 뻔해서 손 떨렸는데 다행히 안 긁힘…"),
                        BoardComment(author: "희창", content: "차 손상 나면 손님이 끝까지 물고 늘어짐. 조심해서 나쁠 거 하나도 없음.")
                      ],
                      likes: 20,
                      imageName: "GasStation",
                      createdAt: Date(timeIntervalSinceNow: -10800)), // 3시간 전
            
            BoardPost(title: "서빙할 때 테이블 우선순위 정해놓으면 훨씬 수월함",
                      content: "한 번에 여러 테이블 주문 받으면 헷갈리잖아. 이럴 때는 일단 기다리는 시간 긴 테이블부터 처리하고, 간단한 음료나 안주부터 나르면 손님들이 덜 짜증냄.",
                      comments: [
                        BoardComment(author: "수은", content: "맞아, 손님이 많으면 일단 기다리는 테이블부터 해결해야 정신 안 나감."),
                        BoardComment(author: "소영", content: "나도 이렇게 안 하면 테이블 번호 헷갈려서 음식 잘못 나가고 난리남ㅋㅋ")
                      ],
                      likes: 18,
                      imageName: "Serving",
                      createdAt: Date(timeIntervalSinceNow: -14400)), // 4시간 전
            
            BoardPost(title: "주문받고 헷갈리면 무조건 메모!",
                      content: "사람 많을 때 주문 외우다가 실수할 때 많음. 그러니까 웬만하면 주문 들어올 때 바로 메모해.",
                      comments: [
                        BoardComment(author: "승호", content: "아 진짜 이거… 주문 잘못 받으면 손님 표정에서 바로 읽힘ㅋㅋ"),
                        BoardComment(author: "정민", content: "나도 초반에 실수 많이 했는데 그냥 물어보는 게 더 나음. 그래야 나중에 덜 혼남.")
                      ],
                      likes: 7,
                      imageName: "",
                      createdAt: Date(timeIntervalSinceNow: -18000)), // 5시간 전
            
            BoardPost(title: "비 오는 날 배달 알바하는 사람 필독!",
                      content: "비 오면 무조건 천천히 가야 돼. 비 때문에 미끄러지거나 사고 나면 그날 알바비 다 날아감. 조금 늦더라도 안전하게 가는 게 답임.",
                      comments: [
                        BoardComment(author: "정원", content: "ㅇㅈ. 비 오는 날 과속하다가 한 번 큰일 날 뻔했음… 그 뒤로 천천히 감."),
                        BoardComment(author: "주노", content: "맞아. 그냥 다치지 말고 돈 버는 게 최고지.")
                      ],
                      likes: 5,
                      imageName: "",
                      createdAt: Date(timeIntervalSinceNow: -21600)), // 6시간 전
            
            BoardPost(title: "머리 감길 때 물 온도랑 목 위치 신경 써라",
                      content: "머리 감길 때 물 너무 차거나 뜨거우면 손님 짜증냄. 그리고 목이 안 편하면 계속 움직여서 너도 불편하고 손님도 불편해짐.",
                      comments: [
                        BoardComment(author: "현정", content: "맞아ㅋㅋ 물 온도 너무 차갑게 했다가 손님 한숨 쉼…"),
                        BoardComment(author: "문성", content: "목 아프면 계속 움직여서 내가 더 불편해지더라. 처음에 잘 세팅해줘야 함.")
                      ],
                      likes: 3,
                      imageName: "",
                      createdAt: Date(timeIntervalSinceNow: -25200)), // 7시간 전
            
            BoardPost(title: "진열할 때 오래 걸리지 않으려면 이렇게 해",
                      content: "진열할 때는 먼저 유통기한 짧은 것부터 앞으로 빼고, 새로운 건 뒤로 넣는 게 기본이야.",
                      comments: [
                        BoardComment(author: "동경", content: "맞아, 유통기한 대충 놓으면 나중에 다 버려야 돼서 진짜 피곤해짐."),
                        BoardComment(author: "종혁", content: "나도 이거 몰랐다가 혼난 적 있음.")
                      ],
                      likes: 2,
                      imageName: "",
                      createdAt: Date(timeIntervalSinceNow: -28800)), // 8시간 전
            
            BoardPost(title: "세차장에서 차 다룰 때 대충 하면 큰일 남",
                      content: "세차할 때 차 유리나 거울 같은 거 조심해서 닦아야 돼. 잘못 건드렸다가 깨지거나 손상 가면 네가 책임져야 할 수도 있음.",
                      comments: [
                        BoardComment(author: "효정", content: "나도 고급 차 닦을 때 손가락만 대도 민감해서 쳐다보는 손님 있음ㅋㅋ"),
                        BoardComment(author: "익명2", content: "고급차는 만지기도 겁남. 아예 안 건드는 게 제일 좋음.")
                      ],
                      likes: 4,
                      imageName: "",
                      createdAt: Date(timeIntervalSinceNow: -32400)), // 9시간 전
            
            BoardPost(title: "손님한테 혼나도 멘탈 안 깨지려면",
                      content: "서빙하다 보면 진상 만나기 십상인데, 이럴 땐 그냥 '아 네~ 죄송합니다'만 반복해. 적당히 고개 숙이고 넘기는 게 이득임.",
                      comments: [
                        BoardComment(author: "범규", content: "진상 만나면 그냥 맞장구 쳐주고 나중에 욕하는 게 제일 속 편함."),
                        BoardComment(author: "승철", content: "난 아예 무표정으로 듣다가 그냥 넘김ㅋㅋ 말대꾸하면 더 피곤함.")
                      ],
                      likes: 10,
                      imageName: "",
                      createdAt: Date(timeIntervalSinceNow: -36000)) // 10시간 전
        ]
    }
    
    // 좋아요 수를 증가시키는 메서드 추가
    public func increaseLike(for postID: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postID }) {
            posts[index].likes += 1
        } else if let index = qaPosts.firstIndex(where: { $0.id == postID }) {
            qaPosts[index].likes += 1
        }
    }
    
    public func addComment(to postID: UUID, author: String, content: String) {
        if let index = posts.firstIndex(where: { $0.id == postID }) {
            let newComment = BoardComment(author: author, content: content)
            posts[index].comments.append(newComment)
        }
    }
    
    public func addQAComment(to postID: UUID, author: String, content: String) {
        if let index = qaPosts.firstIndex(where: { $0.id == postID }) {
            let newComment = BoardComment(author: author, content: content)
            qaPosts[index].comments.append(newComment)
        }
    }
    
    public func toggleScrap(postID: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postID }) {
            posts[index].isScrapped.toggle()
        }
    }
}
