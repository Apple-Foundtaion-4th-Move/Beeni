//
//  RunDetailView.swift
//  Move
//
//  Created by 이혜빈 on 10/22/24.
//

import SwiftUI


// RunDetailView: 모임의 세부 정보를 보여주는 뷰
struct RunDetailView: View {
    
    // 모임 정보(제목, 위치, 시간, 인원 등)를 담고 있는 Meeting 구조체의 인스턴스
    let meeting: Meeting
    
    var body: some View {
        // 스크롤 가능한 뷰, 내용이 많을 경우 스크롤을 허용
        ScrollView {
            // 화면을 수직으로 정렬하고 모든 요소를 왼쪽 정렬
            VStack(alignment: .leading) {
                
                // 지도 이미지
                Image("map")
                    .resizable() // 이미지 크기 조정 가능
                    .frame(width: 350, height: 200) // 이미지 크기 고정
                    .cornerRadius(15) // 모서리를 15포인트 둥글게 설정
                
                // 모임 위치 태그
                HStack {
                    // TagView 사용: 모임 위치를 태그처럼 표시
                    TagView(text: meeting.location)
                }
                
                // 모임 제목
                Text(meeting.title)
                    .font(.title) // 제목을 큰 글씨로 표시
                
                // 모임의 다양한 정보를 한 줄에 나란히 표시 (위치, 시간, 인원)
                HStack {
                    // 위치 아이콘과 위치 정보
                    Image(systemName: "location.square.fill")
                    Text(meeting.location)
                    
                    // 시간 아이콘과 시간 정보
                    Image(systemName: "calendar.circle.fill")
                    Text(meeting.time)
                    
                    // 인원 아이콘과 현재 인원 정보
                    Image(systemName: "person.2.circle.fill")
                    Text("현재 인원: \(meeting.members)")
                }
                .font(.footnote) // 아이콘 및 정보를 작은 글씨로 표시
                
                // "상세 설명" 섹션 제목
                Text("상세 설명")
                    .font(.title2) // 제목을 약간 큰 글씨로 표시
                    .padding(.vertical, 10) // 위아래에 10포인트씩 여백 추가
                
                // 상세 설명을 담을 회색 박스 (빈 공간으로 설정)
                Rectangle()
                    .fill(Color.gray.opacity(0.1)) // 회색 배경색
                    .frame(width: 350, height: 200) // 크기를 가로 350, 세로 200으로 고정
                
                // "참가 인원" 섹션 제목
                Text("참가 인원")
                    .font(.title2) // 제목을 약간 큰 글씨로 표시
                    .padding(.vertical, 10) // 위아래에 10포인트씩 여백 추가
            }
        }
        
    }
}

// TagView: 태그 모양의 작은 텍스트 박스를 표시하는 뷰
struct TagView: View {
    let text: String // 태그에 표시될 텍스트
    
    var body: some View {
        Text(text)
            .font(.caption) // 작은 글씨 크기
            .padding(8) // 텍스트 주위에 8포인트의 여백
            .background(Color.gray.opacity(0.1)) // 배경색을 연한 회색으로 설정
            .cornerRadius(8) // 모서리를 8포인트 둥글게 설정
    }
}

// 미리보기 구조체, Xcode에서 SwiftUI 뷰를 실시간으로 미리보기 위한 코드
struct RunDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RunView() // RunView 뷰의 미리보기 설정
    }
}


