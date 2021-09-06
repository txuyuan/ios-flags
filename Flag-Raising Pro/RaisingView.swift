//
//  RaisingView.swift
//  Flag-Raising Pro
//
//  Created by sap on 6/9/21.
//

import SwiftUI

struct RaisingView: View {
    
    @Binding var flag: Flag
    @AppStorage("flagOffset") var yOffset: Double = 21.0
    
    var body: some View {
        
        VStack{
            HStack(alignment: .bottom, spacing: -11){
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 8, height: 490)
                Text(flag.emoji)
                    .font(.system(size: 100))
                    .offset(y: CGFloat(yOffset))
            }
            
            Spacer().frame(height:50)
            
            HStack{
                Button("Raise"){
                    if(yOffset > -350){
                        withAnimation(.easeInOut(duration: 0.5)) {
                            yOffset -= 55
                        }
                    }
                }.font(Font.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 140, height:50)
                .foregroundColor(Color.white)
                .background(Color.gray)
                .cornerRadius(6.0)
                
                Spacer().frame(width: 24)
                
                Button("Reset"){
                    withAnimation(.easeInOut(duration: 0.6)){
                        yOffset = 21.0
                    }
                }
                .font(Font.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 95, height:50)
                .foregroundColor(Color.white)
                .background(Color.red.opacity(0.7))
                .cornerRadius(6.0)
            }
            
        }
        
        
    }
}

struct RaisingView_Previews: PreviewProvider {
    static var previews: some View {
        RaisingView(flag: .constant(Flag(emoji: "🇸🇬", description: "Singapore")))
    }
}
