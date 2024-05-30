import SwiftUI
import WebKit
import Foundation


struct ExportPDFView: UIViewControllerRepresentable {
    let content: String
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        DispatchQueue.main.async {
            let webView = WKWebView(frame: uiViewController.view.bounds)
            webView.loadHTMLString(content, baseURL: nil)
            webView.navigationDelegate = context.coordinator
            uiViewController.view.addSubview(webView)
            
            let pdfButton = UIButton(type: .system)
            pdfButton.setTitle("Export as PDF", for: .normal)
            pdfButton.addTarget(context.coordinator, action: #selector(context.coordinator.exportAsPDF(_:)), for: .touchUpInside)
            pdfButton.translatesAutoresizingMaskIntoConstraints = false
            uiViewController.view.addSubview(pdfButton)
            
            NSLayoutConstraint.activate([
                pdfButton.centerXAnchor.constraint(equalTo: uiViewController.view.centerXAnchor),
                pdfButton.bottomAnchor.constraint(equalTo: uiViewController.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(content: content)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        let content: String
        
        init(content: String) {
            self.content = content
        }
        
        @objc func exportAsPDF(_ sender: UIButton) {
            let printFormatter = UIMarkupTextPrintFormatter(markupText: content)
            let printRenderer = UIPrintPageRenderer()
            printRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
            
            let pdfData = NSMutableData()
            UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
            printRenderer.prepare(forDrawingPages: NSMakeRange(0, printRenderer.numberOfPages))
            let printRect = UIGraphicsGetPDFContextBounds()
            for index in 0..<printRenderer.numberOfPages {
                UIGraphicsBeginPDFPage()
                printRenderer.drawPage(at: index, in: printRect)
            }
            UIGraphicsEndPDFContext()
            let dir_path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                .appendingPathComponent("NASA", isDirectory: true)
            if !FileManager.default.fileExists(atPath: dir_path.path){
                do {
                    try FileManager.default.createDirectory(atPath: dir_path.path, withIntermediateDirectories: true, attributes: nil)
                }
                catch {
                    print("Error create directroy")
                }
            }
            
            let filePath = dir_path.appendingPathComponent("exported.pdf")
            
            pdfData.write(to: filePath, atomically: true)
        }
    }
}
