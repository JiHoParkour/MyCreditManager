//
//  Student.swift
//  MyCreditManager
//
//  Created by jiho park on 2022/12/04.
//

import Foundation


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
