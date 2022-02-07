//
//  Here.swift
//  neoQando
//
//  Created by Hadi G. on 18.11.21.
//

import SwiftUI

struct Here: View {
    @StateObject var vm = MonitorViewModel(forPreview: true)
    var body: some View {
        VStack {
            MapView()
            List {
                ForEach(vm.monitor) { monitor in
                    let title = monitor.locationStop.properties.title
                    let line = monitor.lines[0]
                    
                    if( title != line.towards) {
                        Text(title).bold()
                        VStack(alignment: .leading) {
                            Text(line.name).bold()
                            Text("➡️ \(line.towards)")
                            
                            line.realtimeSupported ?
                            Text("🟢") : Text("🔴")
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .onAppear {
            vm.getData()
        }
    }
}

struct Here_Previews: PreviewProvider {
    static var previews: some View {
        Here(vm: MonitorViewModel())
    }
}
