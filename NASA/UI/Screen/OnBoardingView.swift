//
//  OnBoardingView.swift
//  NASA
//
//  Created by MacBook Pro on 28/05/24.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps = [
    OnBoardingStep(image: "Traveling_World", title: "Pilih Lokasi Liburan", description: "Tentukan Lokasi Liburan dan Temukan Rekomendasi Destinasi Wisata"),
    OnBoardingStep(image: "Transfer", title: "Atur Anggaran", description: "Buat Liburan Anda Menyenangkan dengan Anggaran yang Ramah di Kantong"),
    OnBoardingStep(image: "Traveling_Together", title: "Ciptakan Memori", description: "Jelajahi Semua Destinasi dan Ciptakan Memori dengan Orang-Orang Terdekat")
]

struct OnBoardingView: View {
    @Binding var path: Screen
    @Environment(\.colorScheme) var colorScheme
    @State private var currentStep = 0
    
    init(path: Binding<Screen>) {
        self._path = path
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        VStack {
            TabView(selection: $currentStep) {
                ForEach(0..<3) { it in
                    VStack {
                        ZStack {
                            Image(onBoardingSteps[it].image)
                                .resizable()
                                .frame(width: it == 0 ? 335 : 275, height: it == 2 ? 225 : 250)
                        }
                        .frame(height: 300)
                        Text(onBoardingSteps[it].title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                        Text(onBoardingSteps[it].description)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                            .padding(.top, 12)
                    }
                    .tag(it)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack {
                ForEach(0..<3) { it in
                    if it == currentStep {
                        Rectangle()
                            .frame(width: 20, height: 10)
                            .cornerRadius(12)
                            .foregroundColor(.mint)
                    } else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.bottom, 16)
            
            Button(action: {
                if self.currentStep < onBoardingSteps.count - 1 {
                    self.currentStep += 1
                } else if(self.currentStep == onBoardingSteps.count - 1){
                    path = .home
                }
            }) {
                Text(currentStep < onBoardingSteps.count - 1 ? "Lanjut" : "Mulai")
                    .bold()
                    .padding(16)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.mint)
                    .cornerRadius(12)
                    .padding(.horizontal, 16)
                    .foregroundColor(.init(uiColor: .systemGray6))
            }
            
            Button(action: {
                path = .home
            }) {
                Text("Lewati")
                    .bold()
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(colorScheme == .light ? .mint : .init(uiColor: .systemGray))
            }
        }
    }
}

#Preview {
    OnBoardingView(path: .constant(.onboarding))
}
