//
//  Student.swift
//  MyCreditManager
//
//  Created by jiho park on 2022/11/21.
//

import Foundation

protocol StudentManagerProtocol {
    var studentDic: [String:Student] { get }
    
    func addStudent(name: String)
    func removeStudent(name: String)
    func addGrade(input: String)
    func removeGrade(input: String)
    func showAverage(name: String)
}

class StudentManager: StudentManagerProtocol {
    var studentDic: [String:Student]
    let gradeScoreDic: [String: Float] = ["A+":4.5, "A":4.0, "B+":3.5, "B":3.0, "C+":2.5, "C":2.0, "D+":1.5, "D":1.0, "F":0.0]
    
    init() {
        self.studentDic = [:]
    }
    
    func addStudent(name: String) {
        if let _ = studentDic[name] {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } else {
            self.studentDic[name] = Student(name: name)
            print("\(name) 학생을 추가했습니다.")
        }
    }
    
    func removeStudent(name: String) {
        if let _ = studentDic[name] {
            studentDic.removeValue(forKey: name)
            print("\(name) 학생을 삭제하였습니다.")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    func addGrade(input: String) {
        
        let inputArray = input.split(separator: " ")
        guard inputArray.count == 3 else { return print(PrintMessage.inputError) }
        let name = String(inputArray[0])
        let subject = String(inputArray[1])
        let grade = String(inputArray[2])
        
        if var student = studentDic[name] {
            student.updateSubject(subject: subject, grade: grade)
            studentDic[name] = student
            print("\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")
        } else {
            print(PrintMessage.inputError)
        }
        
    }

    func removeGrade(input: String) {
        let inputArray = input.split(separator: " ")
        guard inputArray.count == 2 else { return print(PrintMessage.inputError) }
        let name = String(inputArray[0])
        let subject = String(inputArray[1])
        
        if var student = studentDic[name] {
            student.removeSubject(subject: subject)
            studentDic[name] = student
            print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    func showAverage(name: String) {
        if let student = studentDic[name] {
            var total: Float = 0.0
            var validSubjectCount: Float = 0.0
            for (subject, grade) in student.subjectDic {
                print("\(subject): \(grade)")
                total = total + (gradeScoreDic[grade] ?? 0.0)
                validSubjectCount += 1.0
            }
            let averageScore = round((total/validSubjectCount)*100)/100
            let removeDotScore: Any = averageScore.truncatingRemainder(dividingBy: 1.0) == 0 ? Int(averageScore) : averageScore
            print("평점 : \(removeDotScore)")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
}

struct Student {
    
    let name: String
    var subjectDic: [String:String] = [:]
    
    mutating func updateSubject(subject: String, grade: String) {
        self.subjectDic[subject] = grade
    }
    
    mutating func removeSubject(subject: String) {
        self.subjectDic.removeValue(forKey: subject)
    }
    
}
