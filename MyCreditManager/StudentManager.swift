//
//  Student.swift
//  MyCreditManager
//
//  Created by jiho park on 2022/11/21.
//

import Foundation

protocol StudentManagerProtocol {
    var students: [String:Student] { get }
    
    func addStudent(name: String)
    func removeStudent(name: String)
    func addGrade(input: String)
    func removeGrade(input: String)
    func showAverage(name: String)
}

class StudentManager: StudentManagerProtocol {
    var students: [String:Student]
    let gradeScoreDictionary: [String: Float] = ["A+":4.5, "A":4.0, "B+":3.5, "B":3.0, "C+":2.5, "C":2.0, "D+":1.5, "D":1.0, "F":0.0]
    
    init() {
        self.students = [:]
    }
    
    func addStudent(name: String) {
        if let _ = students[name] {
            Print.Console.addStudentSuccess(name: name)
        } else {
            self.students[name] = Student(name: name)
            Print.Console.addStudentFail(name: name)
        }
    }
    
    func removeStudent(name: String) {
        if let _ = students[name] {
            students.removeValue(forKey: name)
            Print.Console.removeStudentSuccess(name: name)
        } else {
            Print.Console.removeStudentFail(name: name)
        }
    }
    
    func addGrade(input: String) {
        
        let inputArray = input.split(separator: " ")
        guard inputArray.count == 3 else { return Print.Console.inputError() }
        let name = String(inputArray[0])
        let subject = String(inputArray[1])
        let grade = String(inputArray[2])
        
        if var student = students[name] {
            student.updateSubject(subject: subject, grade: grade)
            students[name] = student
            Print.Console.addGrandSuccess(name: name, subject: subject, grade: grade)
        } else {
            Print.Console.inputError()
        }
        
    }

    func removeGrade(input: String) {
        let inputArray = input.split(separator: " ")
        guard inputArray.count == 2 else { return Print.Console.inputError() }
        let name = String(inputArray[0])
        let subject = String(inputArray[1])
        
        if var student = students[name] {
            student.removeSubject(subject: subject)
            students[name] = student
            Print.Console.removeGradeSuccess(name: name, subject: subject)
        } else {
            Print.Console.removeGradeFail(name: name)
        }
    }
    
    func showAverage(name: String) {
        if let student = students[name] {
            var total: Float = 0.0
            var validSubjectCount: Float = 0.0
            for (subject, grade) in student.subjects {
                Print.Console.showAverageGrade(subject: subject, grade: grade)
                total = total + (gradeScoreDictionary[grade] ?? 0.0)
                validSubjectCount += 1.0
            }
            let averageScore = round((total/validSubjectCount)*100)/100
            let removeDotScore: Any = averageScore.truncatingRemainder(dividingBy: 1.0) == 0 ? Int(averageScore) : averageScore
            Print.Console.showAverageSuccess(averageGrade: removeDotScore)
        } else {
            Print.Console.showAverageFail(name: name)
        }
    }
    
}

