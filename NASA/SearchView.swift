//
//  SearchView.swift
//  NASA
//
//  Created by MacBook Pro on 29/05/24.
//

import SwiftUI

struct SearchView: View {
    @State private var lokasi: String = ""
    @State private var anggaran: String = ""
    @State private var tanggal: String = ""
    @State private var jumlahOrang: String = ""
    
    var body: some View {
        HStack {
            Image("ProfilePic")
                .overlay {
                    Circle().stroke(.white, lineWidth: 2)
                }
                .shadow(radius: 4)
                .padding([.leading], 20)
            
            VStack(alignment: .leading) {
                Text("Selamat Pagi")
                    .font(.title)
                Text("Halo, Alan")
            }
            .padding([.leading], 10)
            .padding([.trailing], 40)
            
            Image("notificationIcon")
                .padding([.top], 18)
        }
        
        ScrollView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 350, height: 40)
                    
                    TextField(text: $lokasi, prompt: Text("Lokasi Anda")) {
                        Text("Lokasi Anda")
                    }
                    .padding([.leading], 35)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 350, height: 40)
                    
                    TextField(text: $anggaran, prompt: Text("Anggaran")) {
                        Text("Anggaran")
                    }
                    .padding([.leading], 35)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 350, height: 40)
                    
                    TextField(text: $tanggal, prompt: Text("Tanggal")) {
                        Text("Tanggal")
                    }
                    .padding([.leading], 35)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 350, height: 40)
                    
                    TextField(text: $jumlahOrang, prompt: Text("Jumlah Orang")) {
                        Text("Jumlah Orang")
                    }
                    .padding([.leading], 35)
                }
                
                Button(action: {}) {
                    Text("Cari")
                        .font(.headline)
                        .foregroundColor(.init(uiColor: .systemGray6))
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(Color.mint)
                        .cornerRadius(15)
                }
                .padding(.horizontal)
                .padding(.top)
            }
            .padding([.top], 10)
            
            VStack(alignment: .leading) {
                Text("Riwayat Pencarian")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .padding()
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .shadow(radius: 1)
                    
                    VStack(alignment: .leading) {
                        Text("Bali (3 hari 2 malam)")
                            .font(.headline)
                            .padding([.bottom], 2)
                        Text("2 Orang")
                        Text("Rp 5.000.000,-")
                        HStack {
                            Image("locationIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                            Text("Citraland Boulevard, Surabaya")
                                .foregroundStyle(.secondary)
                                .padding([.top], 2)
                        }
                    }
                    .padding([.leading], 25)
                }
                .frame(width: 330, height: 150)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .shadow(radius: 1)
                    
                    VStack(alignment: .leading) {
                        Text("Malang (2 hari 1 malam)")
                            .font(.headline)
                            .padding([.bottom], 2)
                        Text("5 Orang")
                        Text("Rp 3.500.000,-")
                        HStack {
                            Image("locationIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                            Text("Made, Surabaya")
                                .foregroundStyle(.secondary)
                                .padding([.top], 2)
                        }
                    }
                    .padding([.leading], 25)
                }
                .frame(width: 330, height: 150)
            }
        }
    }
}

#Preview {
    SearchView()
}
