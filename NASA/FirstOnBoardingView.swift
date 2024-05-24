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
            Image("Travel_World")
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
            
            HStack(spacing:15) {
                ForEach(0..<3) { _ in
                    Circle()
                        .fill(.mint)
                        .frame(height: 10)
                }
            }
            
            Button(action: {
                // Navigating to Next Page
            }){
                Text("Lanjut")
                    .foregroundStyle(Color(UIColor.systemGray6))
                    .padding()
                    .background(.mint)
                    .cornerRadius(8)
            }
            .padding()
            
            Text("Lewati")
        }
    }
}

#Preview {
    FirstOnBoardingView()
}
