import SwiftUI
import PDFKit
import WebKit

struct ResultScreen: View {
    let content: String
    @State private var showingExportOptions = false
    var body: some View {
        VStack{
            HTMLStringView(
                htmlContent: content
            )
        }
        .navigationBarTitle(
            "Result"
        )
        .navigationBarItems(trailing:
                                Button(action: {
            showingExportOptions.toggle()
        }) {
            Image(
                systemName: "square.and.arrow.up"
            )
        }
            .sheet(
                isPresented: $showingExportOptions
            ) {
                ExportPDFView(
                    content: content
                )
            }
        )
    }
}



#Preview {
    ResultScreen(
        content: ""
    )
}
