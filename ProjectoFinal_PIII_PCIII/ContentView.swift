//  NÃO EDITAR
//  ContentView.swift
//  ProjectoFinal_PIII_PCIII
//
//  Created by João Monge on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            StatsView().tabItem {
                Image(systemName: "figure.walk")
                Text("Stats")
            }
            MapView().tabItem {
                Image(systemName: "map")
                Text("Map")
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
