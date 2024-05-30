//
//  IntroScreen.swift
//  NASA
//
//  Created by Gabriela Sihutomo on 24/05/24.
//

import SwiftUI

struct IntroScreen: View {
    @Binding var path: Screen
    
    var body: some View {
        VStack {
            Spacer()
            Text("Dari Anda.")
                .font(.title)
                .fontWeight(.semibold)
            Text("Untuk Dunia.")
                .font(.title)
                .fontWeight(.semibold)
            Text("Bersama NaSa.")
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            ZStack {
                Image("introicon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
            }
            
            Spacer()
            Button(action: {
                print("test")
                path = .onboarding
            }) {
                Text("Mulai")
                    .font(.headline)
                    .foregroundColor(.init(uiColor: .systemGray6))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.mint)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 30)
            Spacer()
        }
    }
}

#Preview {
    IntroScreen(path: .constant(.intro))
}
