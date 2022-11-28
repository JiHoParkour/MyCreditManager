//
//  System.swift
//  MyCreditManager
//
//  Created by jiho park on 2022/11/21.
//

import Foundation

enum SystemState {
    case run
    case terminate
}

protocol SystemProtocol {
    var state: SystemState { get }
    func start()
    func terminate()
}

class System: SystemProtocol {
    var state: SystemState = .terminate
    private let permittedInput: [String] = ["1", "2", "3", "4", "5", "x", "X"]
    private var studentManager: StudentManagerProtocol
    
    init (studentManager: StudentManagerProtocol) {
        self.studentManager = studentManager
    }
    
    func start() {
        state = .run
        while state == .run {
            system.showMenu()
        }
    }
    
    private func showMenu() {
        print(PrintMessage.menu)
        guard let input = readLine() else { return }
        guard permittedInput.contains(input) else { return  print(PrintMessage.menuInputError) }
        switch input {
        case "1":
            print(PrintMessage.studentNameForAdd)
            studentManager.addStudent(name: getValidInput())
        case "2":
            print(PrintMessage.studentNameForRemove)
            studentManager.removeStudent(name: getValidInput())
        case "3":
            print(PrintMessage.infoForAddGrade)
            studentManager.addGrade(input: getValidInput())
        case "4":
            print(PrintMessage.infoForRemoveGrade)
            studentManager.removeGrade(input: getValidInput())
        case "5":
            print(PrintMessage.studentNameForShowGrade)
             studentManager.showAverage(name: getValidInput())
        case "X":
            terminate()
        default:
            break
        }
    }
    
    func terminate() {
        self.state = .terminate
    }
    
    private func getValidInput() -> String {
        guard let input = readLine() else { return "" }
        guard input != "" else {
            print(PrintMessage.inputError)
            return ""
        }
        return input
    }
}
