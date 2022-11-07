//
//  ViewModel.swift
//  SRPGame
//
//  Created by Hertz on 11/8/22.
//

import Foundation
import Combine
import SwiftUI

enum SRP {
    case scissors
    case rock
    case paper
    case ready
    
    /// 버튼의 타이틀을 가지고 이넘 케이스를 생성하는 함수
    static func initialize(_ btnTitle: String) -> Self {
        switch btnTitle {
        case "가위":
            return .scissors
        case "바위":
            return .rock
        case "보":
            return .paper
        default:
            return .ready
        }
    }
    
    /// 라벨 타이틀
    var labelTitle: String {
        switch self {
        case .scissors:
            return "✅가위✅"
        case .rock:
            return "✅바위✅"
        case .paper:
            return "✅보✅"
        case .ready:
            return "✅준비✅"
        }
    }
    
    /// 초기 이미지
    var initialImage: Image {
        get{
            switch self {
            case .scissors:
                return Image("scissors")
            case .rock:
                return Image("rock")
            case .paper:
                return Image("paper")
            case .ready:
                return Image("ready")
            }
        }
     
    }
    
}

class ViewModel: ObservableObject {
    
    @Published var comChoice: SRP = .ready
    @Published var myChoice: SRP = .ready
    @Published var mainLabel: String = "선택하세요"
    
    func selectButonTapped() {
        /// 랜덤으로 컴퓨터 가위바위보 선택
        let array: [SRP] = [.paper,.rock,.scissors]
        let value = array.shuffled().randomElement()
        comChoice = value ?? SRP.ready
        /// 가위바위보 결과
        calculateSrp()
    }
    
    func resetButtonTapped() {
        comChoice = .ready
        myChoice = .ready
        mainLabel = "선택하세요"
        
    }
    
    func calculateSrp() {
        switch comChoice {
        case .scissors:
            if myChoice == .scissors {
                mainLabel = "비겼습니다"
            } else if myChoice == .paper {
                mainLabel = "젔습니다"
            } else {
                mainLabel = "이겼습니다"
            }
        case .rock:
            if myChoice == .rock {
                mainLabel = "비겼습니다"
            } else if myChoice == .paper {
                mainLabel = "이겼습니다"
            } else {
                mainLabel = "젔습니다"
            }
        case .paper:
            if myChoice == .paper {
                mainLabel = "비겼습니다"
            } else if myChoice == .scissors {
                mainLabel = "이겼습니다"
            } else {
                mainLabel = "젔습니다"
            }
        default:
            break
        }
    }
}
