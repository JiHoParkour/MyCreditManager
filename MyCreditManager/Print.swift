//
//  Print.swift
//  MyCreditManager
//
//  Created by jiho park on 2022/11/22.
//

import Foundation

enum Print {
    enum Console {
        static func menu() {
            print("원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성척추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        }
        static func menuInputError() {
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        }
        static func inputError() {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
        static func studentNameForAdd() {
            print("추가할 학생의 이름을 입력해주세요")
        }
        static func studentNameForRemove() {
            print("삭제할 학생의 이름을 입력해주세요")
        }
        static func infoForAddGrade() {
            print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swfit A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        }
        static func infoForRemoveGrade() {
            print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swfit")
        }
        static func studentNameForShowGrade() {
            print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        }
        static func addStudentSuccess(name: String) {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }
        static func addStudentFail(name: String) {
            print("\(name) 학생을 추가했습니다.")
        }
        static func removeStudentSuccess(name: String) {
            print("\(name) 학생을 삭제하였습니다.")
        }
        static func removeStudentFail(name: String) {
            print("\(name) 학생을 찾지 못했습니다.")
        }
        static func addGrandSuccess(name: String, subject: String, grade: String) {
            print("\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        }
        static func removeGradeSuccess(name: String, subject: String) {
            print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
        }
        static func removeGradeFail(name: String) {
            print("\(name) 학생을 찾지 못했습니다.")
        }
        static func showAverageGrade(subject: String, grade: String) {
            print("\(subject): \(grade)")
        }
        static func showAverageSuccess(averageGrade: Any) {
            print("평점 : \(averageGrade)")
        }
        static func showAverageFail(name: String) {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
}
