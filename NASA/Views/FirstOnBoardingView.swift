//
//  FirstOnBoardingView.swift
//  NASA
//
//  Created by MacBook Pro on 23/05/24.
//

import SwiftUI
import Foundation

struct FirstOnBoardingView: View {
    
    var body: some View {
        VStack{
            Spacer()
            Image("Traveling_World")
                .resizable()
                .frame(width: 300, height: 225)
            
            VStack(spacing: 20) {
                Text("Pilih Lokasi Liburan")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Tentukan Lokasi Liburan dan Temukan Rekomendasi Destinasi Wisata")
                    .multilineTextAlignment(.center)
                .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            HStack(spacing:15) {
                CircleProgress(currentProgress: true)
                CircleProgress(currentProgress: false)
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
    FirstOnBoardingView()
}
