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
    public var likes: Int
    public var isScrapped: Bool
    
    public init(id: UUID = UUID(), title: String, content: String, comments: [BoardComment] = [], likes: Int = 0, isScrapped: Bool = false) {
        self.id = id
        self.title = title
        self.content = content
        self.comments = comments
        self.likes = likes
        self.isScrapped = isScrapped
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
                      content: "진상 만나면 그냥 일단 무조건 웃고 넘겨야 됨. 괜히 말대꾸하다가 진상 더 빡치면 네가 더 피곤해짐. 아 네~ 맞아요~ 죄송합니다~ 이게 답임. 속으로는 욕해도 표정은 평정심 유지.",
                      comments: [
                        BoardComment(author: "튜나", content: "ㄹㅇㅋㅋ"),
                        BoardComment(author: "요시", content: "나도 말대꾸 했다가 점장 불려가서 욕 먹음ㅋㅋ")
                      ]),
            BoardPost(title: "칼질하다 손 자주 베는 사람은 꼭 봐라",
                      content: "주방에서 일하다 보면 손 쉽게 다치잖아. 경험상 칼질할 때 무조건 손가락을 접고, 칼끝이랑 손가락이 최대한 멀어지게 하는 게 중요. 바쁠 때 대충 하다가는 피 철철임.",
                      comments: [
                        BoardComment(author: "준영", content: "ㅇㅈ… 특히 야채 많이 썰 때 멍하니 하다가 베는 경우 많음."),
                        BoardComment(author: "다영", content: "나도 멍 때리다가 딱 한 번 베었는데 그 이후로 칼 쓸 때 진짜 조심함.")
                      ]),
            BoardPost(title: "길 잘 못 찾는 사람은 무조건 GPS 쓰자",
                      content: "배달할 때 길 헷갈리면 시간만 더 걸리잖아. 길 잘 몰라도 GPS로 목적지까지 바로 찾아가고, 미리 주소랑 주변 체크하는 게 시간 절약됨. 고객한테 늦게 도착했다고 사과할 필요 없으니까 진짜 편함.",
                      comments: [
                        BoardComment(author: "영진", content: "맞아, GPS 없으면 길 잘못 들어가면 시간 다 날림ㅋㅋ"),
                        BoardComment(author: "수민", content: "나도 처음엔 헷갈렸는데 익숙해지니까 더 빠르게 다니게 됐어.")
                      ]),
            
            BoardPost(title: "주유소 알바할 때 손님 차 긁히면 끝장임",
                      content: "차 다룰 때는 절대 대충 하지 마. 특히 주유기 옆에서 차 긁히면 진짜 큰일 남. 차 지날 때 주유기나 주차장에 최대한 안전하게 넣고 빼는 게 중요해. 서두르면 바로 클레임 들어옴.",
                      comments: [
                        BoardComment(author: "지수", content: "나도 차 긁을 뻔해서 손 떨렸는데 다행히 안 긁힘…"),
                        BoardComment(author: "희창", content: "차 손상 나면 손님이 끝까지 물고 늘어짐. 조심해서 나쁠 거 하나도 없음.")
                      ]),
            
            BoardPost(title: "서빙할 때 테이블 우선순위 정해놓으면 훨씬 수월함",
                      content: "한 번에 여러 테이블 주문 받으면 헷갈리잖아. 이럴 때는 일단 기다리는 시간 긴 테이블부터 처리하고, 간단한 음료나 안주부터 나르면 손님들이 덜 짜증냄. 하나씩 처리하다 보면 알아서 순서 맞춰짐.",
                      comments: [
                        BoardComment(author: "수은", content: "맞아, 손님이 많으면 일단 기다리는 테이블부터 해결해야 정신 안 나감."),
                        BoardComment(author: "소영", content: "나도 이렇게 안 하면 테이블 번호 헷갈려서 음식 잘못 나가고 난리남ㅋㅋ")
                      ]),
            
            BoardPost(title: "주문받고 헷갈리면 무조건 메모!",
                      content: "사람 많을 때 주문 외우다가 실수할 때 많음. 그러니까 웬만하면 주문 들어올 때 바로 메모해. 헷갈리면 손님한테 확인해도 창피할 거 없으니까 꼭 물어보고 다시 받는 게 낫다.",
                      comments: [
                        BoardComment(author: "승호", content: "아 진짜 이거… 주문 잘못 받으면 손님 표정에서 바로 읽힘ㅋㅋ"),
                        BoardComment(author: "정민", content: "나도 초반에 실수 많이 했는데 그냥 물어보는 게 더 나음. 그래야 나중에 덜 혼남.")
                      ]),
            
            BoardPost(title: "비 오는 날 배달 알바하는 사람 필독!",
                      content: "비 오면 무조건 천천히 가야 돼. 비 때문에 미끄러지거나 사고 나면 그날 알바비 다 날아감. 조금 늦더라도 안전하게 가는 게 답임. 고객도 비 오는 날은 늦게 오는 거 이해해주는 경우 많음.",
                      comments: [
                        BoardComment(author: "정원", content: "ㅇㅈ. 비 오는 날 과속하다가 한 번 큰일 날 뻔했음… 그 뒤로 천천히 감."),
                        BoardComment(author: "주노", content: "맞아. 그냥 다치지 말고 돈 버는 게 최고지. 늦어도 괜찮으니까 안전하게 하는 게 최고.")
                      ]),
            
            BoardPost(title: "머리 감길 때 물 온도랑 목 위치 신경 써라",
                      content: "머리 감길 때 물 너무 차거나 뜨거우면 손님 짜증냄. 그리고 목이 안 편하면 계속 움직여서 너도 불편하고 손님도 불편해짐. 목 쿠션 잘 맞추고 물 온도 적당하게 해주는 게 중요함.",
                      comments: [
                        BoardComment(author: "현정", content: "맞아ㅋㅋ 물 온도 너무 차갑게 했다가 손님 한숨 쉼…"),
                        BoardComment(author: "문성", content: "목 아프면 계속 움직여서 내가 더 불편해지더라. 처음에 잘 세팅해줘야 함.")
                      ]),
            
            BoardPost(title: "진열할 때 오래 걸리지 않으려면 이렇게 해",
                      content: "진열할 때는 먼저 유통기한 짧은 것부터 앞으로 빼고, 새로운 건 뒤로 넣는 게 기본이야. 그냥 대충 쌓아두면 나중에 클레임 걸리고, 손님들도 짜증 내니까 깔끔하게 정리해두면 나중에 덜 귀찮음.",
                      comments: [
                        BoardComment(author: "동경", content: "맞아, 유통기한 대충 놓으면 나중에 다 버려야 돼서 진짜 피곤해짐."),
                        BoardComment(author: "종혁", content: "나도 이거 몰랐다가 혼난 적 있음. 확실히 미리미리 정리하는 게 편함.")
                      ]),
            
            BoardPost(title: "세차장에서 차 다룰 때 대충 하면 큰일 남",
                      content: "세차할 때 차 유리나 거울 같은 거 조심해서 닦아야 돼. 잘못 건드렸다가 깨지거나 손상 가면 네가 책임져야 할 수도 있음. 특히 고급 차일수록 손님들이 민감하니까 신경 써서 조심조심 다뤄라.",
                      comments: [
                        BoardComment(author: "효정", content: "나도 고급 차 닦을 때 손가락만 대도 민감해서 쳐다보는 손님 있음ㅋㅋ"),
                        BoardComment(author: "익명2", content: "고급차는 만지기도 겁남. 아예 안 건드는 게 제일 좋음.")
                      ]),
            
            BoardPost(title: "손님한테 혼나도 멘탈 안 깨지려면",
                      content: "서빙하다 보면 진상 만나기 십상인데, 이럴 땐 그냥 ‘아 네~ 죄송합니다’만 반복해. 괜히 말대꾸 했다가 더 피곤해질 뿐이니까 적당히 고개 숙이고 넘기는 게 이득임.",
                      comments: [
                        BoardComment(author: "범규", content: "진상 만나면 그냥 맞장구 쳐주고 나중에 욕하는 게 제일 속 편함."),
                        BoardComment(author: "승철", content: "난 아예 무표정으로 듣다가 그냥 넘김ㅋㅋ 말대꾸하면 더 피곤함.")
                      ])
        ]
        
        qaPosts = [
            BoardPost(title: "편의점 알바 처음인데 진상 어떻게 대처해요?",
                      content: "편의점 알바 시작했는데 진상 만나면 무조건 참아야 하나요?",
                      comments: [
                        BoardComment(author: "인영", content: "참는 게 최곤데... 가끔 진짜 빡치는 사람 있음ㅋㅋ"),
                        BoardComment(author: "현우", content: "나는 그냥 웃으면서 넘기는데 속으로 욕함")
                      ]),
            
            BoardPost(title: "배달 알바할 때 팁 좀 주세요!",
                      content: "배달 알바하려는데 어떤 게 중요해요?",
                      comments: [
                        BoardComment(author: "재민", content: "길 헷갈리지 말고 미리 GPS 켜놔야 시간 절약됨."),
                        BoardComment(author: "요시", content: "그리고 배달할 때 안전이 제일 중요함. 빨리 가려다 사고 나면 끝이야.")
                      ]),
            
            BoardPost(title: "카페 알바할 때 주문 실수 많이 하는데 어떻게 해야 해?",
                      content: "주문 헷갈리면 어떻게 대처하나요? 바로바로 물어봐야 하나요?",
                      comments: [
                        BoardComment(author: "요시", content: "나는 무조건 메모함. 손님 많으면 머릿속 터짐ㅋㅋ"),
                        BoardComment(author: "다영", content: "나도 초반엔 실수 많이 했는데 그냥 물어보는 게 답임.")
                      ]),
            
            BoardPost(title: "주방 보조 알바할 때 손 안 다치는 법 좀 알려주세요",
                      content: "칼질하다가 자꾸 손 베는데 꿀팁 있나요?",
                      comments: [
                        BoardComment(author: "네드", content: "손가락 접고 천천히 하는 게 진짜 중요함. 서두르면 바로 다침."),
                        BoardComment(author: "튜나", content: "나도 처음엔 많이 베었는데 익숙해지니까 좀 덜 함.")
                      ]),
            
            BoardPost(title: "주유소 알바할 때 고객 차에 흠집 안 내는 팁 있나요?",
                      content: "차 다룰 때마다 긴장되는데 혹시 실수 안 하는 방법 있을까요?",
                      comments: [
                        BoardComment(author: "지수", content: "주유기 넣을 때 조심하고 서두르지 말고 차 주변 꼼꼼히 확인해야 함."),
                        BoardComment(author: "효정", content: "서두르다가 차 긁으면 진짜 골치 아파짐. 조심하는 게 최고임.")
                      ]),
            
            BoardPost(title: "서빙할 때 테이블 순서 정하는 게 어렵네요",
                      content: "테이블이 많을 때 어떻게 효율적으로 서빙해요?",
                      comments: [
                        BoardComment(author: "정원", content: "일단 간단한 음료부터 나르고, 복잡한 건 나중에."),
                        BoardComment(author: "원호", content: "기다린 시간 긴 테이블 먼저 처리하는 게 답임.")
                      ]),
            
            BoardPost(title: "미용실에서 머리 감길 때 손님이 자꾸 움직여요",
                      content: "머리 감겨줄 때 목 아프다고 하면서 자꾸 움직이는데 어떻게 해야 해요?",
                      comments: [
                        BoardComment(author: "정민", content: "처음에 목 쿠션 잘 맞춰줘야 덜 움직임."),
                        BoardComment(author: "주노", content: "물 온도 적당하게 맞춰줘도 덜 움직이는 듯.")
                      ]),
            
            BoardPost(title: "마트 진열할 때 빨리 하는 방법 있나요?",
                      content: "유통기한 체크하면서 진열하니까 시간이 너무 오래 걸리는데 빨리하는 방법 있나요?",
                      comments: [
                        BoardComment(author: "현정", content: "처음엔 힘든데 나중엔 익숙해지면 빨라짐. 그냥 유통기한만 잘 체크해."),
                        BoardComment(author: "정민", content: "미리 유통기한 짧은 거부터 빼고 새로 들어온 거 뒤로 넣으면 금방 익숙해짐.")
                      ]),
            
            BoardPost(title: "세차장 알바 중인데 고객이 차에 신경 너무 많이 써요",
                      content: "세차하면서 차 다룰 때 스트레스 받는데 다들 어떻게 하나요?",
                      comments: [
                        BoardComment(author: "정원", content: "고급 차는 더 조심해야 함. 잘못 닦으면 진짜 클레임 들어옴."),
                        BoardComment(author: "주노", content: "고급차일수록 더 신경 쓰긴 해야 함. 안 건드리는 게 답임.")
                      ]),
            
            BoardPost(title: "알바할 때 진상 손님 때문에 멘탈 깨지는데 대처법 있나요?",
                      content: "진상 손님 만나면 멘탈 관리 어떻게 해야 하나요?",
                      comments: [
                        BoardComment(author: "원호", content: "그냥 웃고 넘기고 속으로 욕함ㅋㅋ"),
                        BoardComment(author: "현정", content: "말대꾸했다가 더 피곤해지니까 걍 참는 게 답임.")
                      ])
        ]
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
    
    public func likePost(postID: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postID }) {
            posts[index].likes += 1
        }
    }
    
    public func toggleScrap(postID: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postID }) {
            posts[index].isScrapped.toggle()
        }
    }
}
