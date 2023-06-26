//  PARA EDITAR
//  StatsView.swift
//  ProjectoFinal_PIII_PCIII
//
//  Created by João Monge on 05/01/2021.
//

import SwiftUI

struct StatsView: View {
    @ObservedObject var l = stats
    var body: some View {
        ZStack{
        Image("running-background")
            
            VStack{
                
                HStack(spacing:20){
                
                VStack(spacing:3){
                    Text(String(format: "%.02f  Km/h", l.speed)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Speed")
            }.foregroundColor(.white)
                .frame(width: 160, height: 100, alignment: .center)
                .background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5))
                .cornerRadius(20)
                
            VStack(spacing:3){
            Text(String(format: "%.02f  Km/h", l.avg_speed)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Avg. Speed")
            }.foregroundColor(.white)
            .frame(width: 160, height: 100, alignment: .center)
            .background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5))
            .cornerRadius(20)
                
            }.padding(.all, 5)
                
                VStack(spacing:3){
                Text(l.duration).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Elapsed time")
            }.foregroundColor(.white)
            .frame(width: 340, height: 100, alignment: .center)
            .background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5))
            .cornerRadius(20)
                    
                
                
                HStack(spacing:20){
                
                    VStack(spacing:3){
                        Text(String(format: "%.02f  km", l.distance)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Distance")
                }.foregroundColor(.white)
                    .frame(width: 160, height: 100, alignment: .center)
                    .background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5))
                    .cornerRadius(20)
                
                
                    VStack(spacing:3){
                    Text(String(format: "%d", l.calories)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("cal")
                    
                }
                .foregroundColor(.white)
                .frame(width: 160, height: 100, alignment: .center)
                
                .background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5))
                .cornerRadius(20)
                
                
                }.padding(.all,5)
                
                
            }
            
            
        }.edgesIgnoringSafeArea(.all) }
    }



struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
