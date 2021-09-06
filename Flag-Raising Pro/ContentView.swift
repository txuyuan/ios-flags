//
//  ContentView.swift
//  Flag-Raising Pro
//
//  Created by sap on 6/9/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var flag = Flag(emoji: "🇸🇬", description: "Singapore")
    
    var body: some View {
        
        TabView{
            RaisingView(flag: $flag)
                .tabItem { Label("Flag Raising", systemImage: "arrow.up")}
            FlagSelectionView(selectedFlag: $flag)
                .tabItem { Label("Flag Selector", systemImage: "flag.badge.ellipsis.fill")}
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
