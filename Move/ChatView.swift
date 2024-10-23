//
//  ChatView.swift
//  Move
//
//  Created by 이혜빈 on 10/18/24.
//

import SwiftUI

// Chat 구조체: 채팅방의 정보를 담는 구조체
struct Chat: Identifiable {
    let id = UUID()
    let title: String  // 채팅방 이름
    let lastMessage: String  // 마지막 메시지
    let time: String  // 마지막 메시지 시간
    let members: Int  // 채팅방 인원 수
    let imageName: String  // 채팅방에 표시할 이미지 이름
}


// ChatView: 채팅방 목록을 보여주는 페이지
struct ChatView: View {
    @State private var searchText: String = "" // 검색어를 저장하는 상태 변수
    
    // 더미 데이터로 채팅 목록
    @State private var chats = [
        Chat(title: "런닝 크루 A", lastMessage: "다들 모임 시간 확인 부탁드려요!", time: "오후 1:30", members: 8, imageName: "러닝크루채팅"),
        Chat(title: "트레일 러닝 준비", lastMessage: "내일 날씨 좋으면 갈까요?", time: "오후 12:10", members: 5, imageName: "트레일채팅"),
        Chat(title: "한강 러닝", lastMessage: "한강 노을 좋아요!!", time: "어제", members: 12, imageName: "한강러닝채팅"),
        Chat(title: "영일대 러닝", lastMessage: "저희 내일 오후 3시에 만나요", time: "2일 전", members: 6, imageName: "영일대채팅"),
    ]
    
    // 검색어에 따라 필터링된 채팅 리스트 반환
    var filteredChats: [Chat] {
        if searchText.isEmpty {
            return chats
        } else {
            return chats.filter { $0.title.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                // "채팅" 제목
                HStack {
                    Text("채팅")
                        .font(.title.bold())
                        .padding(.top, 15)
                        .padding(.leading, 25)
                        .padding(.bottom, 5)
                    
                    Spacer() // 화면 공간 최대화
                }
                
                // 검색창
                HStack {
                    TextField("검색어", text: $searchText, prompt: Text("채팅방 검색")
                        .foregroundColor(.black))
                    .submitLabel(.search)  // "검색" 버튼
                    .autocorrectionDisabled(true)
                    Image(systemName: "magnifyingglass")
                }
                .padding(.horizontal, 20)
                .frame(width: 360, height: 50)
                .background(.cyan.opacity(0.1))
                .cornerRadius(12)
                .padding(.leading, 15)
                
                Spacer()
                
                // 채팅방 리스트
                List {
                    ForEach(filteredChats) { chat in
                        NavigationLink(destination: ChatDetailView(chat: chat)) {
                            VStack(alignment: .leading) {
                                Text(chat.title)
                                    .font(.title2)
                                HStack {
                                    Text(chat.lastMessage)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text(chat.time)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            } // VStack 전체
        } // NavigationView 전체
    } // var body 전체
}

// 미리보기 구조체, Xcode에서 SwiftUI 뷰를 실시간으로 미리보기 위한 코드
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView() // ChatView 뷰의 미리보기 설정
    }
}
