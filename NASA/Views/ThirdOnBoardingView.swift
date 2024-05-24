//
//  ThirdOnBoardingView.swift
//  NASA
//
//  Created by MacBook Pro on 24/05/24.
//

import SwiftUI

struct ThirdOnBoardingView: View {
    var body: some View {
        VStack{
            Spacer()
            ZStack {
                Image("Traveling_Together")
                    .resizable()
                .frame(width: 300, height: 225)
            }
            .frame(height: 300)
            Spacer()
            VStack(spacing: 20) {
                Text("Ciptakan Memori")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Jelajahi Semua Destinasi dan Ciptakan Memori dengan Orang-Orang Terdekat")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            HStack(spacing:15) {
                CircleProgress(currentProgress: false)
                CircleProgress(currentProgress: false)
                CircleProgress(currentProgress: true)
            }
            
            Button(action: {
                // Navigating to Next Page
            }){
                Text("Lanjut")
                    .font(.headline)
                    .foregroundStyle(Color(UIColor.systemGray6))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.mint)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 30)
            .padding(.top, 12)
            
            Button(action: {
                // Navigating to Next Page
            }){
                Text("Lewati")
                    .font(.headline)
                    .foregroundColor(.mint)
                    .padding()
                    .background(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 30)
            .padding(.top, 12)
            Spacer()
        }
    }
}

#Preview {
    ThirdOnBoardingView()
}
