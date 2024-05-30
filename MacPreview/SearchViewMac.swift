//
//  SearchViewMac.swift
//  MacPreview
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct SearchViewMac: View {
    @State private var lokasi: String = ""
    @State private var anggaran: String = ""
    @State private var tanggal: String = ""
    @State private var jumlahOrang: String = ""
    
    var body: some View {
        HStack {
            Image("ProfilePic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .topLeading)
                .overlay {
                    Circle().stroke(.white, lineWidth: 2)
                }
                .shadow(radius: 4)
                .padding([.leading], 20)
            
            VStack(alignment: .leading) {
                Text("Selamat Pagi")
                    .font(.system(size: 46))
                Text("Halo, Alan")
                    .font(.system(size: 32))
            }
            .padding([.leading], 25)
            .padding([.trailing], 1000)
            
            Image("notificationIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140, alignment: .topLeading)
                .padding([.top], 18)
        }
        .padding([.top], 50)
        
        ScrollView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 1500, height: 70)
                    
                    HStack {
                        Image("locationIcon")
                        TextField(text: $lokasi, prompt: Text("Lokasi Anda")) {
                            Text("Lokasi Anda")
                        }
                        .frame(width: 1400)
                        .border(Color.white)
                        .focusable(false)
                    }
                    .font(.system(size: 24))
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 1500, height: 70)
                    
                    HStack {
                        Image("anggaranIcon")
                        TextField(text: $anggaran, prompt: Text("Anggaran")) {
                            Text("Anggaran")
                        }
                        .frame(width: 1400)
                        .border(Color.white)
                        .focusable(false)
                    }
                    .font(.system(size: 24))
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 1500, height: 70)
                    
                    HStack {
                        Image("calendar")
                        TextField(text: $tanggal, prompt: Text("Tanggal")) {
                            Text("Tanggal")
                        }
                        .frame(width: 1400)
                        .border(Color.white)
                        .focusable(false)
                    }
                    .font(.system(size: 24))
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 1500, height: 70)
                    
                    HStack {
                        Image("peopleIcon")
                        TextField(text: $jumlahOrang, prompt: Text("Jumlah Orang")) {
                            Text("Jumlah Orang")
                        }
                        .frame(width: 1400)
                        .border(Color.white)
                        .focusable(false)
                    }
                    .font(.system(size: 24))
                }
                
                Button(action: {}) {
                    Text("Cari")
                        .font(.title)
                        .padding()
                        .frame(width: 150, height: 60)
                        .cornerRadius(25)
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
                .padding(.horizontal)
                .padding(.top)
            }
            .padding([.top], 10)
            
            VStack(alignment: .leading) {
                Text("Riwayat Pencarian")
                    .fontWeight(.semibold)
                    .font(.system(size: 32))
                    .padding()
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .shadow(radius: 1)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Bali (3 hari 2 malam)")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                                .padding([.bottom], 2)
                            
                            Spacer()
                            
                            Image("bookmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding([.trailing], 20)
                        }
                        Text("2 Orang")
                            .font(.system(size: 24))
                        Text("Rp 5.000.000,-")
                            .font(.system(size: 24))
                        HStack {
                            Image("locationIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 24)
                            Text("Citraland Boulevard, Surabaya")
                                .font(.system(size: 24))
                                .foregroundStyle(.secondary)
                                .padding([.top], 2)
                        }
                    }
                    .padding([.leading], 40)
                }
                .frame(width: 1500, height: 250)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .shadow(radius: 1)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Malang (2 hari 1 malam)")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                                .padding([.bottom], 2)
                            
                            Spacer()
                            
                            Image("bookmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding([.trailing], 20)
                        }
                        Text("5 Orang")
                            .font(.system(size: 24))
                        Text("Rp 3.500.000,-")
                            .font(.system(size: 24))
                        HStack {
                            Image("locationIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                            Text("Made, Surabaya")
                                .font(.system(size: 24))
                                .foregroundStyle(.secondary)
                                .padding([.top], 2)
                        }
                    }
                    .padding([.leading], 40)
                }
                .frame(width: 1500, height: 250)
            }
        }
    }
}

#Preview {
    SearchViewMac()
}
