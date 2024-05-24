//
//  SecondOnBoardingView.swift
//  NASA
//
//  Created by MacBook Pro on 24/05/24.
//

import SwiftUI

struct SecondOnBoardingView: View {
    var body: some View {
        VStack{
            Spacer()
            ZStack {
                Image("Transfer")
                    .resizable()
                .frame(width: 300, height: 300)
            }
            Spacer()
            VStack(spacing: 20) {
                Text("Atur Anggaran")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Buat Liburan Anda Menyenangkan dengan Anggaran yang Ramah di Kantong")
                    .multilineTextAlignment(.center)
                .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            HStack(spacing:15) {
                CircleProgress(currentProgress: false)
                CircleProgress(currentProgress: true)
                CircleProgress(currentProgress: false)
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
    SecondOnBoardingView()
}
