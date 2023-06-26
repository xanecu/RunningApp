//  NÃO EDITAR
//  LocationManager.swift
//  DemoLocalizacaoPCIIIPL
//
//  Created by João Monge on 05/01/2021.
//

import Foundation
//1º Passo importar a biblioteca
import CoreLocation

//Instancia global
var location = LocationManager()

class LocationManager : NSObject, ObservableObject{
    var manager : CLLocationManager?
    @Published var locations: [CLLocationCoordinate2D] = []
    
    var lastLocation : CLLocation?
    
    
    
    override init(){
        super.init()
        //2ºPasso instaciar o location manager
        manager = CLLocationManager()
        manager!.delegate = self
    }
    
    //3ºPedir permissão para usar gps
    func askPermission(){
        guard let m = manager else {return}
        m.requestWhenInUseAuthorization()
    }
    
    //4º Pedir a localização
    func getLocation(){
        guard let m = manager else {return}
        if(m.authorizationStatus == .authorizedWhenInUse){
            
            m.startUpdatingLocation()
            
        }
    }
    func stopLocation(){
        guard let m = manager else {return}
        m.stopUpdatingLocation()
        
    }
    func clearLocations(){
        self.locations = []
    }
}

extension LocationManager : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let p = locations.last else {return}
        
        self.locations.append(CLLocationCoordinate2D(latitude: p.coordinate.latitude, longitude: p.coordinate.longitude))
        self.lastLocation = locations.last
        stats.updatePosition(lastLocation!)
    }
}
