//
//  FlagSelectionView.swift
//  Flag-Raising Pro
//
//  Created by sap on 6/9/21.
//

import SwiftUI

struct FlagSelectionView: View {
    
    var flags: [Flag]{
        let flagDataUrl = Bundle.main.url(forResource: "FlagData", withExtension: ".json")
        let decoder = JSONDecoder()
        let data = try! Data(contentsOf: flagDataUrl!)
        return try! decoder.decode([Flag].self, from: data)
    }
    
    @Binding var selectedFlag: Flag
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                    ForEach(flags){ flag in
                        VStack{
                            Text(flag.emoji)
                                .font(.system(size: 80))
                            Text(flag.description)
                                .font(.caption)
                                .multilineTextAlignment(.center)
                        }.padding()
                        .background(flag == selectedFlag ? Color.blue : Color.clear)
                        .foregroundColor(flag == selectedFlag ? .white : .black)
                        .cornerRadius(5.0)
                        .onTapGesture {
                            selectedFlag = flag
                        }
                    }
                }.padding(.init(top: 0, leading: 18, bottom: 0, trailing: 18))
            }.navigationTitle("Chooseth thy flag")
        }
        
        
    }
}

struct FlagSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FlagSelectionView(selectedFlag: .constant(Flag(emoji: "🇸🇬", description: "Singapore")))
    }
}
