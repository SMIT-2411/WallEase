//
//  ProductView.swift
//  ARStore
//
//  Created by Smit Patel on 08/08/24.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        
        NavigationView{
        
        ScrollView(.vertical){
            
            
            VStack{
                
                // top bar with logo
                HStack{
                    
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 100 , height: 50)
                    
                    
                    Spacer()
                    
                }
                .padding()
                
                //Text for new collection
                
                
                
                VStack {
                    HStack {
                        Text("New Collection")
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                        Spacer()
                    }
                    
                    
                    HStack {
                        Text("Explore the new collection of sneakers")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .padding(.horizontal , 25)
                .padding(.bottom , 10)
                
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.blue1)
                        .frame(width: UIScreen.main.bounds.width-35 , height: 140)
                        .overlay(alignment:.leading ){
                            
                            VStack {
                                
                                
                                HStack {
                                    Text("20% Discount")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal , 20)
                                        .padding(.top , 20)
                                    Spacer()
                                }
                                HStack {
                                    Text("on your first purchase")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.white)
                                        .padding(.horizontal , 20)
                                    Spacer()
                                }
                                
                                
                                
                                Text("SUPER SALE - SUPER SALE - S")
                                    .font(.system(size: 26))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical , 20)
                                    .fixedSize(horizontal: true, vertical: false)
                                
                                
                            }
                                                        // inside zstack inserting shoe photo
                            
                            Image("shoe1")
                                .resizable()
                                .frame(width: 280 , height: 210)
                                .rotationEffect(.degrees(-20))
                                .offset(x:UIScreen.main.bounds.width - 320 , y: 20)
                            
                        }
                }
                
                
                ShoeSmallView()
                    .padding(.top , 30)
                
                
                Spacer()
            }
        }
    }
    }
}

#Preview {
    HomeView()
}
