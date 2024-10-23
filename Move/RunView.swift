//
//  RunView.swift
//  Move
//
//  Created by 이혜빈 on 10/18/24.
//


import SwiftUI

//class MeetingManager: ObservableObject {
//    @Published var meetings: [Meeting] = []
//
//    func addMeeting(title: String, location: String, time: String, members: String) {
//        let newMeeting = Meeting(title: title, location: location, time: time, members: members)
//        meetings.append(newMeeting)
//    }
//}
//
//class MeetingManager: ObservableObject {
//    @Published var meetings: [Meeting] = []
//
//    func addMeeting(title: String, location: String, time: String, members: String) {
//        let newMeeting = Meeting(title: title, location: location, time: time, members: members)
//        meetings.append(newMeeting)  // @Published로 선언된 프로퍼티 변경
//    }
//}


struct Meeting: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let time: String
    let members: String
}


// Run 페이지
struct RunView: View {
    @State private var searchText: String = "" // 검색어를 저장하는 상태 변수
    @FocusState private var isTextFieldFocused: Bool // 키보드 상태
    //    @StateObject private var meetingManager = MeetingManager()  // 상태 객체 생성
    
    @State private var meetings = [
        Meeting(title: "영일대 석양 러닝", location: "포항시", time: "11.2(토) 오후 1:30", members: "3/8"),
        Meeting(title: "소통하며 러닝해요", location: "포항시", time: "11.3(일) 오후 1:30", members: "3/8"),
        Meeting(title: "마라톤 준비 러닝", location: "포항시", time: "11.3(일) 오후 1:30", members: "3/8"),
        Meeting(title: "트레일 러닝 갈 사람", location: "태백시", time: "11.3(일) 오후 1:30", members: "8/8"),
        Meeting(title: "한강 러닝 갈 사람", location: "여의도", time: "11.3(일) 오후 1:30", members: "8/8"),
        Meeting(title: "트레일 러닝 갈 사람", location: "태백시", time: "11.3(일) 오후 1:30", members: "8/8"),
        Meeting(title: "트레일 러닝 갈 사람", location: "태백시", time: "11.3(일) 오후 1:30", members: "8/8"),
        Meeting(title: "트레일 러닝 갈 사람", location: "태백시", time: "11.3(일) 오후 1:30", members: "8/8")
    ]
    
    
    var filteredMeetings: [Meeting] {
        if searchText.isEmpty {
            return meetings
        } else {
            return meetings.filter { $0.title.contains(searchText) }
        }
    }
    
    var body: some View {
        
        // 화면 전환 네비게이션으로 전체 감싸기
        NavigationView {
            // 스크롤 할 수 있는 뷰로 감싸기
            //            ScrollView {
            // VStack 페이지 전체
            VStack(alignment: .leading) {
                
                // 러닝 모임 찾기, 모임 개설 페이지 아이콘
                HStack{
                    Text("러닝 모임 찾기")
                        .font(.title.bold())
                        .padding(.top, 15)
                        .padding(.leading, 25)
                        .padding(.bottom, 5)
                    
                    Spacer() // 화면 공간 최대화
                    
                    // 모임 개설 페이지 넘어가는 + 버튼
                    NavigationLink (destination: RunCreateView()){
                        Image(systemName: "plus.app")
                            .resizable()
                            .frame(width: 33, height: 33)
                            .padding(.top, 15)
                            .padding(.trailing, 15)
                            .padding()
                            .foregroundStyle(.teal)
                        
                    }
                    
                } // HStack 러닝 모임 찾기, 모임 개설 페이지 아이콘
                
                // 검색창
                HStack {
                    TextField("검색어", text: $searchText, prompt: Text("검색어를 입력하세요."))
                        .foregroundColor(.black)
                        .submitLabel(.search)  //  "검색" 버튼
                        .autocorrectionDisabled(true)
                    Image(systemName: "magnifyingglass")
                    
                    
                }
                .onAppear(perform: UIApplication.shared.hideKeyboard)
                .scrollDismissesKeyboard(.immediately)
                .padding(.horizontal, 20)
                .frame(width: 360, height: 50)
                .background(.cyan.opacity(0.1))
                .cornerRadius(12)
                .padding(.leading, 15)
                
                Spacer()
                
                
                //                    // 검색창
                //                    VStack {
                //                        TextField("검색어를 입력하세요.", text: $searchText)
                //                            .padding(13) // 내부 여백
                //                            .background(Color(.systemGray6)) // 검색창 배경색상
                //                            .cornerRadius(10) // 모서리 둥글게
                //                            .padding(.horizontal, 18) // 가로 여백
                //
                //
                //                    }
                //                    Spacer()
                
                // 모임 리스트
                List {
                    ForEach(filteredMeetings) { meeting in
                        NavigationLink(destination: RunDetailView(meeting: meeting)) {
                            VStack(alignment: .leading) {
                                Text(meeting.title)
                                    .font(.title2)
                                HStack {
                                    Image(systemName: "location.circle.fill")
                                    Text(meeting.location)
                                    Spacer()
                                    Image(systemName: "calendar.circle.fill")
                                    Text(meeting.time)
                                    Spacer()
                                    HStack {
                                        Image(systemName: "person.3")
                                        Text(meeting.members)
                                    }
                                }
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                //                    VStack {
                //                        List(meetingManager.meetings) { meeting in
                //                            Text(meeting.title)
                //
                //                        }
                //
                //                        NavigationLink(destination: RunCreateView() {
                //                            Text("모임 개설하기")
                //                        }
                //                    }
                
                
                
            } // VSatck 전체
            
            //            } // 스크롤뷰
            
        } // Navigation 전체
        
    } // var body 전체
    
} // RunView 전체




// 텍스트 필드 편집이 끝났을 때 키보드 내리기 위한 View extension
extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil , from: nil, for: nil
        )
    }
}


struct MeetingListView_Previews: PreviewProvider {
    static var previews: some View {
        RunView()
    }
}


#Preview {
    RunView()
}


//import SwiftUI
//
//struct RunView: View {
//    @StateObject private var meetingManager = MeetingManager() // MeetingManager 인스턴스 생성
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List(meetingManager.meetings) { meeting in
//                    VStack(alignment: .leading) {
//                        Text(meeting.title)
//                            .font(.headline)
//                        Text("날짜: \(meeting.date, formatter: dateFormatter)")
//                        Text("장소: \(meeting.location) \(meeting.subLocation)")
//                        Text("코스 길이: \(meeting.courseLength, specifier: "%.1f") km")
//                        Text("인원: \(meeting.runnerCount)명")
//                        Text("러닝 페이스: \(meeting.runningPace)")
//                        Text(meeting.description)
//                            .font(.footnote)
//                            .foregroundColor(.gray)
//                    }
//                }
//                .navigationTitle("러닝 모임 리스트")
//
//                // 모임 개설하기 버튼
//                NavigationLink(destination: RunCreateView(meetingManager: meetingManager)) {
//                    Text("모임 개설하기")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//            }
//        }
//    }
//}
//
//// 날짜 포맷터
//private let dateFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .long
//    return formatter
//}()
//
//
//#Preview {
//    RunView()
//}
