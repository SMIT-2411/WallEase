//
//  ShoeBigImageView.swift
//  ARStore
//
//  Created by Smit Patel on 12/08/24.
//

import SwiftUI

struct SizeChangerView: View {
    
    @State var selectedSize: Int = 0
    
    let size = [6,7,8 , 9 , 10 , 11,12]
    
    var body: some View {
        //size control view
        VStack(spacing: 0){
//                Text("Size")
//                    .font(.system(size: 25))
//                    .frame(width:50 , height:35)
                Rectangle()
                    .fill(Color.white)
                    .frame(width:UIScreen.main.bounds.width - 100 , height:45)
                    .overlay(){
                        ScrollView(.horizontal , showsIndicators: false){
                            HStack{
                                ForEach(size, id: \.self) { num in
                                    
                                    
                                    Button {
                                        selectedSize = num
                                        //button action
                                    } label: {
                                        RoundedRectangle(cornerRadius:12)
                                            .fill(selectedSize==num ? Color.black :.white)
                                            .stroke(.gray, lineWidth:1)
                                            .frame(width:35 , height: 35)
                                            .overlay(){
                                                Text("\(num)")
                                                    .font(.system(size: 15))
                                                    .foregroundColor(selectedSize==num ? Color.white :.black)
                                            }
                                        
                                    }
                                    .padding(5) // Adjust spacing between buttons
                                }
                            }
                        }
                    }
            
        }.padding(2)
    }
}

#Preview {
    SizeChangerView()
}
