//
//  ShoeSmallView.swift
//  ARStore
//
//  Created by Smit Patel on 12/08/24.
//

import SwiftUI

struct ShoeSmallView: View {
    @State private var selectedCategory: ShoeCategory? = .lifestyle
    
    let columns = [
        GridItem(.flexible()),  // First column
        GridItem(.flexible())   // Second column
    ]
    
    var body: some View {
        
            VStack {
                // Category buttons
                HStack {
                    Button(action: { selectedCategory = .lifestyle }) {
                        VStack(spacing: -10) {
                            Text("Lifestyle")
                                .padding()
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(selectedCategory == .lifestyle ? Color.black : Color.gray)
                            
                            Text("\(shoeStore.lifestyleShoesCount) items")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(selectedCategory == .lifestyle ? Color.black : Color.gray)
                        }
                        
                        
                    }
                    
                    Button(action: { selectedCategory = .running }) {
                        
                        VStack(spacing: -10) {
                            Text("Running")
                                .padding()
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(selectedCategory == .running ? Color.black : Color.gray)
                            Text("\(shoeStore.runningShoesCount) items")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(selectedCategory == .running ? Color.black : Color.gray)
                        }
                    }
                    
                    Button(action: { selectedCategory = .tennis }) {
                        VStack(spacing: -10) {
                            Text("Tennis")
                                .padding()
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(selectedCategory == .tennis ? Color.black : Color.gray)
                            
                            Text("\(shoeStore.tennisShoesCount) items")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(selectedCategory == .tennis ? Color.black : Color.gray)
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                // Display shoes based on selected category
                if let selectedCategory = selectedCategory {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(shoeStore.shoes.filter { $0.category == selectedCategory }) { shoe in
                                NavigationLink(destination: ShoeDetailView(shoe: shoe)) {
                                    ShoeView(shoe: shoe)
                                        .padding(.horizontal, 30)
                                        .padding(.vertical, 15)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }


// shoe view is small view for product listed rounded rectangle

struct ShoeView: View {
    let shoe: Shoe
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .stroke(.gray, lineWidth:1)
            .opacity(0.33)
            .frame(width: 165, height: 220)
            .overlay(
                VStack {
                    HStack{
                        
                        Text("\(Image(systemName: "star")) \(shoe.rating , specifier: "%.1f")")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        // button to add product to favourite
                        Button{
                            
                        }label: {
                            Image("bookmark")
                                .resizable()
                                .frame(width: 25 , height: 25)
                                .rotationEffect(.degrees(-15))
                        }
                        
                        
                            
                       
                    }
                    
                    shoe.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 120)
                        .rotationEffect(.degrees(-15))
                    
                    
                    HStack {
                        Text(shoe.name)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.top,1)
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        Text("$\(shoe.price, specifier: "%.2f")")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                    }.padding(.top , -5)
                    
                       
                }
                .padding()
            )
    }
}

#Preview {
    HomeView()
}
