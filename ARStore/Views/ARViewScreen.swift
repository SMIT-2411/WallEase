//
//  ARViewScreen.swift
//  ARStore
//
//  Created by Smit Patel on 13/08/24.
//


import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ARViewScreen: View {
    @State private var isPlacementEnabled = false
        @State private var modelConfirmedForPlacement: Model?
        
        var model: Model // Accept the model directly from ShoeDetailView
        
        var body: some View {
            ZStack(alignment: .bottom) {
                ARViewContainer(modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
                if self.isPlacementEnabled {
                    PlacementButtonsView(isPlacementEnabled: $isPlacementEnabled, modelConfirmedForPlacement: self.$modelConfirmedForPlacement, selectedModel: model)
                } else {
                    // Automatically enable placement mode as there's no picker
                    PlacementButtonsView(isPlacementEnabled: $isPlacementEnabled, modelConfirmedForPlacement: self.$modelConfirmedForPlacement, selectedModel: model)
                        .onAppear {
                            self.isPlacementEnabled = true
                        }
                }
            }
            .ignoresSafeArea()
        }
}


struct ARViewContainer: UIViewRepresentable {
    @Binding var modelConfirmedForPlacement: Model?
        
        func makeUIView(context: Context) -> CustomARView {
            let arView = CustomARView(frame: .zero)
            return arView
        }
        
        func updateUIView(_ uiView: CustomARView, context: Context) {
            if let model = self.modelConfirmedForPlacement {
                if let modelEntity = model.modelEntity {
                    print("DEBUG: adding model to scene - \(model.modelName)")
                    let anchorEntity = AnchorEntity(plane: .any)
                    anchorEntity.addChild(modelEntity.clone(recursive: true))
                    uiView.scene.addAnchor(anchorEntity)
                } else {
                    print("DEBUG: Unable to load modelEntity for \(model.modelName)")
                }
                DispatchQueue.main.async {
                    self.modelConfirmedForPlacement = nil
                }
            }
        }

}


struct PlacementButtonsView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var modelConfirmedForPlacement: Model?
    var selectedModel: Model // Accept the selected model directly
    
    var body: some View {
        HStack {
            // Cancel Button
            Button(action: {
                print("DEBUG: Cancel model placement.")
                self.resetPlacementParameters()
            }) {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
            // Confirm Button
            Button(action: {
                print("DEBUG: model placement confirm.")
                self.modelConfirmedForPlacement = self.selectedModel
                self.resetPlacementParameters()
            }) {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
        }
    }
    
    func resetPlacementParameters() {
        self.isPlacementEnabled = false
        // Here, we don't need to reset the selectedModel because it's passed from ShoeDetailView
    }
}
