//
//  IntroScreenMac.swift
//  MacNASA
//
//  Created by Gabriela Sihutomo on 31/05/24.
//

import SwiftUI

struct IntroScreenMac: View {
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
            ZStack {
                Image("introicon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            .padding(.vertical, 20)
            Spacer()
            Button(action: {
            }) {
                Text("Mulai")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .frame(width: 400, height: 40)
                    .backgroundF(Color.mint)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 30)
            Spacer()
        }
    }
}

#Preview {
    IntroScreenMac()
}
