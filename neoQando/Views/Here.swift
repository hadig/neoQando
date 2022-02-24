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
                    MonitorDataRow(monitor: monitor)
                    
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

struct MonitorDataRow: View {
    var monitor: RealTime.Data.Monitor
    var body: some View {
        let title = monitor.locationStop.properties.title
        let line = monitor.lines[0]
        let lineTime = 4
        
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                HStack {
                    Text(line.name)
                        .bold()
                        .padding(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.primary, lineWidth: 2)
                        )
                    
                    Text(title)
                        .bold()
                }
                
                
                HStack {
                    Image(systemName: "arrow.right")
                    Text("\(line.towards)")
                }
                
                if (!line.realtimeSupported) {
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.red)
                        Text("No Realtime Data")
                    }
                    .font(.system(size: 10, weight: .light))
                }
                
                
            }
            
            Spacer()
            
            VStack (spacing: 10) {
                Text("\(lineTime) min.")
                    .underline()
                Text("\(lineTime) min.")
                    .foregroundColor(.secondary)
            }
        }
        .padding(.top)
        .padding(.bottom)
        
    }
}

struct Here_Previews: PreviewProvider {
    static var previews: some View {
        Here(vm: MonitorViewModel())
            .previewInterfaceOrientation(.portrait)
    }
}
