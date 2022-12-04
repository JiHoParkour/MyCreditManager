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
    case exit = "X"
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
            guard let input = validInput() else { return }
            studentManager.addStudent(name: input)
        case PermittedInput.two.rawValue:
            Print.Console.studentNameForRemove()
            guard let input = validInput() else { return }
            studentManager.removeStudent(name: input)
        case PermittedInput.three.rawValue:
            Print.Console.infoForAddGrade()
            guard let input = validInput() else { return }
            studentManager.addGrade(input: input)
        case PermittedInput.four.rawValue:
            Print.Console.infoForRemoveGrade()
            guard let input = validInput() else { return }
            studentManager.removeGrade(input: input)
        case PermittedInput.five.rawValue:
            Print.Console.studentNameForShowGrade()
            guard let input = validInput() else { return }
             studentManager.showAverage(name: input)
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
    
    private func validInput() -> String? {
        guard let input = readLine() else { return nil }
        guard false == input.isEmpty else {
            Print.Console.inputError()
            return nil
        }
        return input
    }
}
