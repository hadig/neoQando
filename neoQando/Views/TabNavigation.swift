//
//  TabNavigation.swift
//  neoQando
//
//  Created by Hadi G. on 17.11.21.
//

import SwiftUI

struct TabNavigation: View {
    
    enum Tab {
        case here
        case favorites
        case route
        case more
    }
    
    @State private var selection: Tab = .here
    
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView{
                
                    Here(vm: MonitorViewModel())
            }.navigationBarHidden(true)
            
            
            
            .tabItem {
                let menuText = Text("Here", comment: "Here tab title")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "location.north.fill")
                }.accessibility(label: menuText)
            }
            .tag(Tab.here)
            
            NavigationView {
                ContentView()
                    .edgesIgnoringSafeArea(.top)
            }
            .tabItem {
                Label {
                    Text("Favorites",
                         comment: "Favorites tab title")
                } icon: {
                    Image(systemName: "star.fill")
                }
            }
            
            .tag(Tab.favorites)
            
            NavigationView {
                ContentView()
            }
            .tabItem {
                Label {
                    Text("Route",
                         comment: "Routes tab title")
                } icon: {
                    Image(systemName: "arrow.triangle.swap")
                }
            }
            .tag(Tab.route)
            
            NavigationView {
                ContentView()
            }
            .tabItem {
                Label {
                    Text("More",
                         comment: "More tab title")
                } icon: {
                    Image(systemName: "ellipsis")
                }
            }
            .tag(Tab.more)
        }
        
        .onAppear {
            //UITabBar.appearance().backgroundColor = UIColor(Color.white.opacity(0.8))
            
            if #available(iOS 15.0, *) {
                let appearance = UITabBarAppearance()
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            
        }
    }
}

struct TabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigation()
    }
}
