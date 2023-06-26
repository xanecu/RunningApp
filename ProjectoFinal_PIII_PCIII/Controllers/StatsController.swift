//  PARA EDITAR
//  SportsController.swift
//  ProjectoFinal_PIII_PCIII
//
//  Created by João Monge on 05/01/2021.
//

import Foundation
import CoreLocation

var stats = StatsController()

class StatsController:ObservableObject{
   
    //Variáveis para a fazer update StatsView
    @Published var speed = 0.0
    @Published var distance = 0.0
    @Published var avg_speed = 0.0
    @Published var duration = "00:00:00"
    @Published var calories = 0
    
    
    /**
      Coordenadas por onde o utilizador passou
    */
    var locations : [CLLocation] = []
    
    /**
     Data de inicio de treino (Quando clica no play)
    */
    var startDate : Date?
    
    /**
     Está função é chamada sempre que ocorre uma actualização na posição do utilizador
     O Objecto CLLocation contêm as informações relevantes sobre as coordenas geografica, altitude, heading e velocidade
    */
    func updatePosition(_ p: CLLocation){
        //Adiciona a nova posicao ao array de lo
        locations.append(p)
        calcDistance()
        getDuration()
        calcDistance()
        getSpeed()
        getAvgSpeed()
    }
    
    //Função chamada quando o treino é iniciado
    func startWorkout(){
        if(startDate==nil){
         startDate=Date()
        }
    }
    
    //Função chamada quando o treino termina
    func stopWorkout(){
        
    }
    
    //Função para colocar o treino em pausa
    func pauseWorkout(){
        
    }
    
    
    /**
        Função para calcular a velocidade .
        Deve actualizar a variavel speed com a nova velocidade.
        Esta função é chamada sempre que existe um update na localizacao.
        Dica: Na lista de localizacoes (var locations) os objectos têm informação sobre a velocidade com que o user passou pelo ponto
     */
    func getSpeed(){
        speed = 0
        
        for i in locations {
            speed = i.speed
        }
        
    }
    /**
        Função para calcular a velocidade  média.
        Deve actualizar a variavel average_speed com a nova velocidade media.
        Esta função é chamada sempre que existe um update na localizacao.
        Dica: Na lista de localizacoes os objectos têm informação sobre a velocidade com que o user passou pelo ponto
     */
    func getAvgSpeed(){
        avg_speed = 0
        
        for i in locations {
            avg_speed += i.speed / Double(locations.count)
            
        }
        
        
    }
    /**
        Função para calcular a distância percorrida.
        Deve actualizar a variavel distance com a nova distância.
        Esta função é chamada sempre que existe um update na localizacao
        Dica: O CLLocation contêm um método .distance(from: CLLocation) que devolve a distância de uma coordenada a outra em Metros
     */
    func calcDistance(){
        distance = 0.0
        
        for i in locations{
            let _distance: Double
            
            _distance = i.distance(from: locations.last!) / 1000.0
            
            distance += _distance
            
        }
        
    }
   
    
    
    /**
        Função para calcular a duracao do treino .
        Deve actualizar a variavel duration com a nova duracao.
        Esta função é chamada sempre que existe um update na localizacao.
        Dica: Na lista de localizacoes (var locations) os objectos têm informação sobre a velocidade com que o user passou pelo ponto
     */
    func getDuration(){
        duration = "00:00:00"
        
        for i in locations {
            let _duration: Double
            
            _duration = i.timestamp.timeIntervalSince(locations.first!.timestamp)
            
            duration = String(_duration)
            
        }
        
    }
    
    /**
         Função para calcular uma estimativa das calorias gastas .
         Deve actualizar a variavel calories com a quantidade de calorias gasta.
         Esta função é chamada sempre que existe um update na localizacao.

     Consultar o website para obter a formula matemática que permite o cálculo das calorias gastas:
     https://www.hss.edu/conditions_burning-calories-with-exercise-calculating-estimated-energy-expenditure.asp
     */
    func calcCalories(){
        calories = 0 
    }
    
}
