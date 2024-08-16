import UIKit
import RealityKit
import Combine

class Model{
    var modelName: String
    var image: UIImage?
    var modelEntity: ModelEntity?
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        
        // Safely unwrap the image
        if let image = UIImage(named: modelName) {
            self.image = image
        } else {
            print("DEBUG: Unable to load image for modelName: \(modelName)")
            self.image = UIImage(systemName: "photo") // Set a placeholder image if not found
        }
        
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case .failure(let error):
                    print("DEBUG: Unable to load modelEntity for modelName: \(self.modelName) with error: \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                print("DEBUG: successfully loaded modelEntity for modelName: \(self.modelName)")
            })
    }
}
