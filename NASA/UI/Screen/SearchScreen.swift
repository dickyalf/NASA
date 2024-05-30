import SwiftUI
import Foundation

struct SearchScreen: View {
    @EnvironmentObject var locationManager: LocationManager
    
    
    @Binding var path: [Screen]
    
    
    @StateObject private var viewModel = DataViewModel(
        repository: RecommendationRepository(
            service: ChatGPTService()
        )
    )
    
    @State private var startingPoint: String = ""
    @State private var destination: String = ""
    @State private var anggaran: String = ""
    @State private var stay: Int = 0
    @State private var jumlahOrang: Int = 0
    @State private var toast: Toast? = nil
    @State private var shouldNavigate = false
    
    var body: some View {
        ScrollView {
            VStack{
                HStack(alignment: .center) {
                    // Profile image on the left side
                    Image("anal")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.mint)
                        .clipShape(Circle())
                        .padding(.leading)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Selamat pagi")
                            .font(.subheadline)
                            .fontWeight(.medium)

                        Text("Halo, Ana")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .padding(.leading)

                    Spacer()

                    // Notification bell icon on the right side
                    ZStack {
                        Image(systemName: "bell.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 36, height: 36)
                            .foregroundColor(.mint)
                    }
                    .padding(.trailing)
                }
                .padding(.bottom, 20)
                .padding([.top, .horizontal])
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(UIColor.systemBackground))
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primary, lineWidth: 2)
                            )
                            .shadow(radius: 1)
                        
                        HStack {
                            Image(
                                systemName: "map.fill"
                            )
                            .foregroundColor(
                                .gray
                            )
                            .frame(width: 30, height: 30)
                            .padding(
                                .leading,
                                22
                            )
                            .padding(
                                .trailing,
                                20
                            )
                            
                            Spacer(
                                minLength: 5
                            )
                            TextField(
                                "Lokasi Anda",
                                text: $startingPoint
                            )
                            .keyboardType(
                                .numberPad
                            )
                            .padding(
                                .leading,
                                5
                            )
                            .padding(
                                .trailing,
                                10
                            )
                        }
                        .padding(
                            .horizontal,
                            10
                        )
                    }
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(UIColor.systemBackground))
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primary, lineWidth: 2)
                            )
                            .shadow(radius: 1)
                        
                        HStack {
                            Image(
                                systemName: "mappin.square.fill"
                            )
                            .foregroundColor(
                                .gray
                            )
                            .frame(width: 30, height: 30)
                            .padding(
                                .leading,
                                22
                            )
                            .padding(
                                .trailing,
                                20
                            )
                            
                            Spacer(
                                minLength: 5
                            )
                            TextField(
                                "Tujuan Anda",
                                text: $destination
                            )
                            .padding(
                                .leading,
                                5
                            )
                            .padding(
                                .trailing,
                                10
                            )
                        }
                        .padding(
                            .horizontal,
                            10
                        )
                    }
                    .padding(
                        .top,
                        10
                    )
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(UIColor.systemBackground))
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primary, lineWidth: 2)
                            )
                            .shadow(radius: 1)
                        
                        HStack {
                            Image(
                                systemName: "newspaper"
                            )
                            .foregroundColor(
                                .gray
                            )
                            .frame(width: 30, height: 30)
                            .padding(
                                .leading,
                                22
                            )
                            .padding(
                                .trailing,
                                20
                            )
                            Spacer(
                                minLength: 5
                            )
                            TextField(
                                "Anggaran",
                                text: $anggaran
                            )
                            .keyboardType(
                                .numberPad
                            )
                            .padding(
                                .leading,
                                5
                            )
                            .padding(
                                .trailing,
                                10
                            )
                        }
                        .padding(
                            .horizontal,
                            10
                        )
                    }
                    .padding(
                        .top,
                        10
                    )
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(UIColor.systemBackground))
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primary, lineWidth: 2)
                            )
                            .shadow(radius: 1)
                        
                        HStack {
                            Image(
                                systemName: "calendar"
                            )
                            .foregroundColor(
                                .gray
                            )
                            TextField(
                                "Lama Menginap",
                                value: $stay,
                                formatter: NumberFormatter()
                            )
                            .keyboardType(
                                .numberPad
                            )
                            .multilineTextAlignment(
                                .center
                            )
                            .frame(
                                width: 50
                            )
                            .padding(
                                .leading,
                                10
                            )
                            Text(
                                "Hari"
                            )
                            .font(
                                .body
                            )
                            .padding(
                                .leading,
                                5
                            )
                            
                            Spacer()
                            HStack {
                                Button(action: {
                                    if stay > 0 {
                                        stay -= 1
                                    }
                                }) {
                                    Image(
                                        systemName: "minus.circle.fill"
                                    )
                                    .foregroundColor(
                                        .blue
                                    )
                                    .font(
                                        .title
                                    )
                                }
                                Text(
                                    "|"
                                )
                                .font(
                                    .title
                                )
                                .foregroundColor(
                                    .gray
                                )
                                .padding(
                                    .horizontal,
                                    5
                                )
                                Button(action: {
                                    stay += 1
                                }) {
                                    Image(
                                        systemName: "plus.circle.fill"
                                    )
                                    .foregroundColor(
                                        .blue
                                    )
                                    .font(
                                        .title
                                    )
                                }
                            }
                        }
                        .padding(
                            .horizontal,
                            35
                        )
                    }
                    .padding(
                        .top,
                        10
                    )
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(UIColor.systemBackground))
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primary, lineWidth: 2)
                            )
                            .shadow(radius: 1)
                        
                        
                        HStack {
                            Image(
                                systemName: "person.2.fill"
                            )
                            .foregroundColor(
                                .gray
                            )
                            TextField(
                                "Jumlah Orang",
                                value: $jumlahOrang,
                                formatter: NumberFormatter()
                            )
                            .keyboardType(
                                .numberPad
                            )
                            .multilineTextAlignment(
                                .center
                            )
                            .frame(
                                width: 50
                            )
                            .padding(
                                .leading,
                                3
                            )
                            Text(
                                "Orang"
                            )
                            .font(
                                .body
                            )
                            .padding(
                                .leading,
                                5
                            )
                            
                            Spacer()
                            HStack {
                                Button(action: {
                                    if jumlahOrang > 0 {
                                        jumlahOrang -= 1
                                    }
                                }) {
                                    Image(
                                        systemName: "minus.circle.fill"
                                    )
                                    .foregroundColor(
                                        .blue
                                    )
                                    .font(
                                        .title
                                    )
                                }
                                Text(
                                    "|"
                                )
                                .font(
                                    .title
                                )
                                .foregroundColor(
                                    .gray
                                )
                                .padding(
                                    .horizontal,
                                    5
                                )
                                
                                Button(action: {
                                    jumlahOrang += 1
                                }) {
                                    Image(
                                        systemName: "plus.circle.fill"
                                    )
                                    .foregroundColor(
                                        .blue
                                    )
                                    .font(
                                        .title
                                    )
                                }
                            }
                        }
                        .padding(
                            .horizontal,
                            35
                        )
                    }
      
                    
                    if(
                        viewModel.isLoading
                    ){
                        ProgressView(
                            "Loading..."
                        )
                        .padding()
                    } else {
                        if let errorMessage = viewModel.errorMessage {
                            Text(
                                "Error: \(errorMessage)"
                            )
                            .foregroundColor(
                                .red
                            )
                            .padding()
                        }
                        
                        Button(action: {
                            let intAnggaran = Int(anggaran)
                            if startingPoint.isEmpty ||
                                destination.isEmpty ||
                                (intAnggaran ?? 0) <= 0 ||
                                stay <= 0 ||
                                jumlahOrang <= 0
                            {
                                toast = Toast(style: .error, message: "Invalid input!")
                            } else {
                                viewModel.getRecommendation(
                                    startingPoint: startingPoint,
                                    destination: destination,
                                    budget: Int(anggaran) ?? 0,
                                    stay: stay,
                                    peopleCount: jumlahOrang
                                )
                            }
                            
                        }) {
                            Text(
                                "Cari"
                            )
                            .font(
                                .headline
                            )
                            .foregroundColor(
                                .init(
                                    uiColor: .systemGray6
                                )
                            )
                            .padding()
                            .frame(
                                width: 100,
                                height: 50
                            )
                            .background(
                                Color.mint
                            )
                            .cornerRadius(
                                15
                            )
                        }
                        .padding(
                            .horizontal
                        )
                        .padding(
                            .top
                        )
                    }
                }
                .padding([.top, .horizontal])
                
                HistoryView(
                    history: viewModel.history
                ).frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .horizontal])
                
            }
        }.toastView(
            toast: $toast
        )
        .zIndex(
            1
        )
        .onChange(
            of: viewModel.result
        ){ result in
            if result != nil {
                if(
                    result?.status ?? false
                ){
                    self.shouldNavigate = true
                } else {
                    self.toast = Toast(
                        style: .error,
                        message: result?.content ?? "Unknown error"
                    )
                }
            }
        }.onAppear{
            locationManager.location?.placemark{
                placemark,
                error in
                guard let placemark = placemark else {
                    print(
                        "Error:",
                        error ?? "nil"
                    )
                    return
                }
                startingPoint = placemark.city ?? ""
                
            }
            viewModel.result = nil
            viewModel.fetchPostHistory()
        }.navigationDestination(
            isPresented: $shouldNavigate
        ){
            if let response = viewModel.result {
                ResultScreen(
                    content: response.content
                )
            }
            
        }
    }
}

struct HistoryView: View {
    let history: [History]
    var body: some View {
        VStack(
            alignment: .leading
        ) {
            Text(
                "Riwayat Pencarian"
            )
            .fontWeight(
                .semibold
            )
            .font(
                .title2
            )
            ForEach(
                history,
                id: \.id
            ){ hi in
                NavigationLink(destination: {
                    ResultScreen(content: hi.content ?? "")
                }){
                    ZStack(
                        alignment: .leading
                    ) {
                        RoundedRectangle(
                            cornerRadius: 25
                        )
                        .fill(Color(UIColor.systemBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.primary, lineWidth: 1)
                        )
                        .shadow(
                            radius: 1
                        )
                    
                        
                        VStack(
                            alignment: .leading
                        ) {
                            HStack {
                                Text(
                                    "\(hi.destination ?? "") (\(hi.stay) Hari)"
                                )
                                .foregroundStyle(Color.primary)
                                .font(
                                    .headline
                                )
                                .padding(
                                    [.bottom],
                                    2
                                )
                                
                                Spacer()
                                
                                Image(
                                    "bookmark"
                                )
                                .resizable()
                                .scaledToFit()
                                .frame(
                                    width: 20,
                                    height: 20
                                )
                                .padding(
                                    [.trailing],
                                    20
                                )
                            }
                            Text(
                                "\(hi.peopleCount) Orang"
                            )
                            .foregroundStyle(Color.primary)
                            Text(
                                hi.budget,
                                format: .currency(
                                    code: "IDR"
                                )
                            )
                            .foregroundStyle(Color.primary)
                            HStack {
                                Image(
                                    "locationIcon"
                                )
                                .resizable()
                                .scaledToFit()
                                .frame(
                                    width: 18,
                                    height: 18
                                )
                                Text(
                                    hi.startingPoint ?? ""
                                )
                                .foregroundStyle(
                                    .secondary
                                )
                                .padding(
                                    [.top],
                                    2
                                )
                            }
                        }
                        .padding(
                            [.leading],
                            25
                        )
                    }
                    .frame(
                        height: 150
                    )
                }
            }
            
        }
    }
}

#Preview {
    SearchScreen(
        path: .constant(
    []
        )
    )
    .environmentObject(
        LocationManager()
    )
}
