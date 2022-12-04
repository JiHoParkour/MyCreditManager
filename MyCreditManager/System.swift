//
//  System.swift
//  MyCreditManager
//
//  Created by jiho park on 2022/11/21.
//

import Foundation

enum PermittedInput: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case exit = "x"
}

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
        Print.Console.menu()
        guard let input = readLine() else { return }
        
        switch input {
        case PermittedInput.one.rawValue:
            Print.Console.studentNameForAdd()
            studentManager.addStudent(name: getValidInput())
        case PermittedInput.two.rawValue:
            Print.Console.studentNameForRemove()
            studentManager.removeStudent(name: getValidInput())
        case PermittedInput.three.rawValue:
            Print.Console.infoForAddGrade()
            studentManager.addGrade(input: getValidInput())
        case PermittedInput.four.rawValue:
            Print.Console.infoForRemoveGrade()
            studentManager.removeGrade(input: getValidInput())
        case PermittedInput.five.rawValue:
            Print.Console.studentNameForShowGrade()
             studentManager.showAverage(name: getValidInput())
        case PermittedInput.exit.rawValue:
            terminate()
        default:
            Print.Console.menuInputError()
            break
        }
    }
    
    func terminate() {
        self.state = .terminate
    }
    
    private func getValidInput() -> String {
        guard let input = readLine() else { return "" } //에러 처리를 해보기 nil일때 isEmpty일때
        guard input != "" else {
            Print.Console.inputError()
            return ""
        }
        return input
    }
}
