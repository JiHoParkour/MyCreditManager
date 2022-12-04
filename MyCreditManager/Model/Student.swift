//
//  Student.swift
//  MyCreditManager
//
//  Created by jiho park on 2022/12/04.
//

import Foundation


struct Student {
    let name: String
    var subjects: [String:String] = [:]
    
    mutating func updateSubject(subject: String, grade: String) {
        self.subjects[subject] = grade
    }
    
    mutating func removeSubject(subject: String) {
        self.subjects.removeValue(forKey: subject)
    }
}
