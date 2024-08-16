//
//  USDZScannerView.swift
//  ARStore
//
//  Created by Smit Patel on 15/08/24.
//

import SwiftUI
import AVKit
import AVFoundation
import USDZScanner

struct USDZScannerView: View {
    @State var isScanObjectPresenting = false
    @State var url: URL?
    
    var body: some View {
        ZStack {
            
            
            WelcomeVideoController()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack{
                Spacer()
                
                Button{
                    isScanObjectPresenting = true
                }label: {
                    HStack{
                        Image(systemName: "camera.viewfinder")
                            .font(.system(size: 25))
                        Text(" Tap to Scan!!")
                            .font(.system(size: 20  , weight: .bold))
                    }
                    
                }.buttonStyle(.bordered)
                    .tint(.green)
                    .padding(.bottom , 120)
                
                if let url {
                                Text(url.absoluteString)
                            }
                
                
            }.sheet(isPresented: $isScanObjectPresenting, content: {
                            USDZScanner { url in
                                self.url = url
                                isScanObjectPresenting = false
                            }
                        })
            
            
        }
    }
}

struct WelcomeVideoController: UIViewControllerRepresentable {
    class Coordinator {
        var playerLooper: AVPlayerLooper?
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<WelcomeVideoController>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspect // Use .resizeAspect instead of .resizeAspectFill
        
        guard let path = Bundle.main.path(forResource: "scanner1", ofType: "mp4") else {
            debugPrint("scanner1.mp4 not found")
            return controller
        }
        
        let asset = AVAsset(url: URL(fileURLWithPath: path))
        let playerItem = AVPlayerItem(asset: asset)
        let queuePlayer = AVQueuePlayer()
        
        context.coordinator.playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        queuePlayer.play()
        controller.player = queuePlayer
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<WelcomeVideoController>) {
        // No additional update needed
    }
}

#Preview {
    USDZScannerView()
}



