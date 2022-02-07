//
//  ContentView.swift
//  neoQando
//
//  Created by Hadi G. on 26.10.21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let gradient = LinearGradient(colors: [Color.blue,Color.teal,Color.cyan],
                                  startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            gradient
            
            Text("Home 🧿")
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .fontWeight(.heavy)
            
                .padding(10.0)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 10)
                
        }
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
