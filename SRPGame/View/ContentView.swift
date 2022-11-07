//
//  ContentView.swift
//  SRPGame
//
//  Created by Hertz on 11/7/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - vars
    @StateObject var viewModel = ViewModel()
    
    // MARK: - body
    var body: some View {
        /// 레이블
        VStack(spacing: 0) {
            Text(viewModel.mainLabel)
                .font(.title)
                .fontWeight(.heavy)
                .padding()
                .padding(.bottom, 30)
            srpImage
            srpButton
            selectResetButton
            Spacer()
        }
        
    }
    
    // MARK: - 가위바위보 이미지
    var srpImage: some View {
        HStack(spacing: 20) {
            VStack(alignment: .center, spacing: 12) {
                Text("컴퓨터의 선택") // immutable
                viewModel.comChoice.initialImage
                    .resizable()
                Text(viewModel.comChoice.labelTitle)
                
            }
            
            VStack(alignment: .center, spacing: 12) {
                Text("나의 선택")
                viewModel.myChoice.initialImage
                    .resizable()
                Text(viewModel.myChoice.labelTitle)
                
            }
        }
        .frame(height: 250)
        .padding(.horizontal, 16)
        .padding(.bottom, 30)
    }
    
    // MARK: - 가위바위보 버튼
    var srpButton: some View {
        HStack(spacing: 15) {
            Rectangle()
                .overlay {
                    Text("가위")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    let choice = SRP.initialize("가위")
                    viewModel.myChoice = choice
                }
            
            Rectangle()
                .overlay {
                    Text("바위")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    let choice = SRP.initialize("바위")
                    viewModel.myChoice = choice
                }
            
            Rectangle()
                .overlay {
                    Text("보")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    let choice = SRP.initialize("보")
                    viewModel.myChoice = choice
                }
            
        }
        .frame(height: 100)
        .padding(.horizontal, 16)
        .padding(.bottom, 30)
    }
    
    // MARK: - 셀렉트 리셋 버튼
    var selectResetButton: some View {
        HStack(spacing: 20) {
            Rectangle()
                .foregroundColor(.gray)
                .overlay {
                    Text("리셋")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .onTapGesture {
                    /// 비즈니스로직
                    viewModel.resetButtonTapped()
                }
            
            Rectangle()
                .foregroundColor(.gray)
                .overlay {
                    Text("선택")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .onTapGesture {
                    /// 비즈니스로직
                    viewModel.selectButonTapped()
                }
        }
        .frame(height: 65)
        .padding(.horizontal, 16)
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
