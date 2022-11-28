//
//  PrintMessage.swift
//  MyCreditManager
//
//  Created by jiho park on 2022/11/22.
//

import Foundation

struct PrintMessage {
    static let menu = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성척추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
    
    static let menuInputError = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
    static let inputError = "입력이 잘못되었습니다. 다시 확인해주세요."
    
    static let studentNameForAdd = "추가할 학생의 이름을 입력해주세요"
    static let studentNameForRemove = "삭제할 학생의 이름을 입력해주세요"
    
    static let infoForAddGrade = "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swfit A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
    static let infoForRemoveGrade = "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swfit"
    
    static let studentNameForShowGrade = "평점을 알고싶은 학생의 이름을 입력해주세요."
    
}
