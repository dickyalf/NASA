import Foundation
import SwiftUI
import PDFKit
import WebKit

class PDFKitView: UIView {
    private var pdfView: PDFView!

    init(data: Data) {
        super.init(frame: .zero)

        pdfView = PDFView(frame: bounds)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(pdfView)

        pdfView.document = PDFDocument(data: data)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func reload(data: Data) {
        pdfView.document = PDFDocument(data: data)
    }
}
