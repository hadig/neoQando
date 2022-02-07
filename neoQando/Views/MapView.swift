//
//  MapView.swift
//  neoQando
//
//  Created by Hadi G. on 22.11.21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    var body: some View {
        
        Map(coordinateRegion: $viewModel.region,
            interactionModes: MapInteractionModes(),
            showsUserLocation: true)
            
            .ignoresSafeArea()
            .frame(minWidth: 300, maxHeight: 200)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .padding()
            .onAppear {
                viewModel.checkIfLocationIsEnabled()
            }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
