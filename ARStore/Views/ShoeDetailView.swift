//
//  ShoeDetailView.swift
//  ARStore
//
//  Created by Smit Patel on 12/08/24.
//

import SwiftUI
import QuickLook
import RealityKit

struct ShoeDetailView: View {
    var shoe : Shoe
    
    // to dismiss the view
    @Environment(\.dismiss) private var dismiss
    
    @State private var dragOffset: CGSize = .zero
    @State private var isAddedToCart: Bool = false
    
    @State private var showARView = false
        
    
   
    
    
    var body: some View {
        
        VStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width , height:400 )
                .overlay(){
                    ZStack{
                        
                        Text("MAX")
                            .font(.system(size: 110, weight: .bold, design: .default))
                        
                            .frame(width: 300 , height: 300)
                            .rotationEffect(.degrees(90))
                            .foregroundColor(Color.gg)
                            .opacity(0.2)
                           
                        
                        shoe.image
                            .resizable()
                            .frame(width:320 , height:280)
                            .cornerRadius(15)
                            .rotationEffect(.degrees(-50))
                        
                        // Shoe big image
                        
                    }
                    
                }
            
            HStack {
                VStack{
                    HStack {
                        Text("$\(shoe.price, specifier: "%.2f")")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack{
                        Text("10% OFF")
                            .font(.caption)
                            .foregroundStyle(.red)
                        
                        Spacer()
                    }
                    
                }.padding(.horizontal , 20)
                
                Button(action: {
                    showARView = true
                            }) {
                                Text("View in AR")
                                    .font(.system(size: 18, weight: .bold))
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding()
            }
            
            SizeChangerView()
                .padding(.vertical,5)
                .padding(.bottom , 10)
            
            
            // add to cart view
            
            Text("Add to bag")
                .font(.system(size: 15 , weight: .bold))
            
            
            // implement a gesture that i fwe drag it down to box and we can add the product to cart
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.black)
                .frame(width: 40 , height: 80)
                .overlay{
                    VStack(spacing: 0){
                        Image("whitecart")
                            .resizable()
                            .frame(width:30 , height:30)
                            .rotationEffect(.degrees(15))
                            
                        Image("down")
                            .resizable()
                            .frame(width:30 , height:30)
                            .rotationEffect(.degrees(15))
                            
                        
                    }
                    
                }
                .offset(dragOffset)
                .gesture(
                                    DragGesture()
                                        .onChanged { gesture in
                                            dragOffset = gesture.translation
                                        }
                                        .onEnded { gesture in
                                            if isNearBox(location: gesture.location) {
                                                isAddedToCart = true
                                                print("Added to cart")
                                            }
                                            dragOffset = .zero
                                        }
                                )
            
                
                
           
            
            
            Image("box")
                .resizable()
                .frame(width: 250 , height: 250)
                .rotationEffect(.degrees(16))
                .overlay {
                                    if isAddedToCart {
                                        Text("Added to Cart!")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                            .padding()
                                    }
                                }
                .offset(y:-50)
            
        }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement:.navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image("customback")
                                .resizable()
                                .frame(width:28 , height:28)
                                .rotationEffect(.degrees(15))
                        }
                    }
                    ToolbarItem(placement: .principal){
                        Text(shoe.name)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Image("customCart")
                            .resizable()
                            .frame(width:28 , height:28)
                            .rotationEffect(.degrees(-15))
                    }
                }
                .sheet(isPresented: $showARView) {
                    ARViewScreen(model: shoe.model ?? Model(modelName: shoe.usdzFileName))
                }
    }
    
    // Function to check if the drop location is near the box
        func isNearBox(location: CGPoint) -> Bool {
            // Adjust the frame to check if the drop is near the box image
            // Return true if it is, false otherwise
            // For simplicity, let's assume it's near if the Y coordinate is within a certain range
            return location.y > 100 && location.y < 300
        }
    
   
}

#Preview {
    ShoeDetailView(shoe: .init(imageName: "lifestyle1", name: "Air Max 97", price: 100.0, rating: 4.8, category: .lifestyle, usdzFileName: "lifestyle1_usdz"))

    
    //HomeView()
    
    
}

