//
//  OnBoardingMacView.swift
//  NASAMac
//
//  Created by MacBook Pro on 29/05/24.
//

import SwiftUI

struct OnBoardingMacView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                VStack {
                    Text("NASA")
                        .bold()
                        .font(.system(size: 64))
                    Text("Navigasi Saku")
                        .font(.title)
                }
                HStack(spacing: 50) {
                    VStack(spacing: 20) {
                        Image("Traveling_World")
                            .resizable()
                            .frame(width: 440, height: 360)
                        Text("Pilih Lokasi Liburan")
                            .font(.largeTitle)
                            .bold()
                        Text("Tentukan Lokasi Liburan dan Temukan Rekomendasi Destinasi Wisata")
                            .multilineTextAlignment(.center)
                            .font(.title)
                    }
                    VStack(spacing: 20) {
                        Image("Transfer")
                            .resizable()
                            .frame(width: 400, height: 360)
                        Text("Atur Anggaran")
                            .font(.largeTitle)
                            .bold()
                        Text("Buat Liburan Anda Menyenangkan dengan Anggaran yang Ramah di Kantong")
                            .multilineTextAlignment(.center)
                            .font(.title)
                    }
                    VStack(spacing: 20) {
                        Image("Traveling_Together")
                            .resizable()
                            .frame(width: 400, height: 360)
                        Text("Ciptakan Memori")
                            .font(.largeTitle)
                            .bold()
                        Text("Jelajahi Semua Destinasi dan Ciptakan Memori dengan Orang-Orang Terdekat")
                            .multilineTextAlignment(.center)
                            .font(.title)
                    }
                }
                .frame(height: 600)
                Button(action: {
                    // Lewati
                }) {
                    Text("Mulai")
                        .font(.title3)
                        .frame(width: 350)
                        .bold()
                        .padding(12)
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
                .cornerRadius(12)
            }
        }
        .padding()
    }
}

#Preview {
    OnBoardingMacView()
}
