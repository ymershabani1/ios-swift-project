//
//  PerNeViewController.swift
//  ecommerce
//
//  Created by Baton Ferri on 5/17/21.
//  Copyright © 2021 Student 08. All rights reserved.
//

import UIKit
import MapKit

class PerNeViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tvNisja: UITextField!
    var citiesAnnotations: [MKAnnotation] = []
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        getMyLocation()
    }
    
    @IBAction func btnKerko(_ sender: Any) {
        getDestinationFromUser()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
         if(segue.identifier == "kontaktSeg"){
            if segue.destination is AlertViewController{
                   
               }
            }
    }
    
    func getDestinationFromUser(){
               let destination = tvNisja.text
               
               if destination == "Vushtrri" || destination == "vushtrri"{
                   mapView.removeOverlays(mapView.overlays)
                   mapView.showAnnotations([getMyLocation(), getVushtrriLocation()], animated: true)
                   drawPathFromMeToDestination(myLocation: getMyLocation(), destLocation: getVushtrriLocation())
                   
               }else if destination == "Mitrovica" || destination == "mitrovica"{
                   mapView.removeOverlays(mapView.overlays)
                   mapView.showAnnotations([getMyLocation(), getMitrovicaLocation()], animated: true)
                   drawPathFromMeToDestination(myLocation: getMyLocation(), destLocation: getMitrovicaLocation())
            
               }else if destination == "Presheva" || destination == "presheva"{
                   mapView.removeOverlays(mapView.overlays)
                   mapView.showAnnotations([getMyLocation(), getPreshevaLocation()], animated: true)
                   drawPathFromMeToDestination(myLocation: getMyLocation(), destLocation: getPreshevaLocation())
               }
               else{
                   let alert = UIAlertController(title: "Try Again", message:"Aktualisht nuk ka filiale ne kete vend", preferredStyle: .alert)

                   alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

                   self.present(alert, animated: true)
               }
           }
    
    func setZoomAndRegion(regionCenter: CLLocationCoordinate2D){
            let coordinateRegion = MKCoordinateRegion(center: regionCenter, latitudinalMeters: 150000, longitudinalMeters: 150000)
            mapView.region = coordinateRegion
    }
    
    func getMyLocation() -> MKPointAnnotation{
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
                 
        if(CLLocationManager.locationServicesEnabled()){
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
                 
        let myLocation = MKPointAnnotation()
 
        myLocation.coordinate = CLLocationCoordinate2D(latitude:42.658121991150985, longitude: 21.148394733012747)
        myLocation.title = "HQ"
        mapView.addAnnotation(myLocation)
        setZoomAndRegion(regionCenter: myLocation.coordinate)
            return myLocation
    }
           
    func getVushtrriLocation() -> MKPointAnnotation {
        let vushtrri = MKPointAnnotation()
        vushtrri.coordinate = CLLocationCoordinate2D(latitude: 42.82781679346679, longitude: 20.970438620984673)
        vushtrri.title = "Vushtrri"
        mapView.addAnnotation(vushtrri)
               
        return vushtrri
    }
           
           
    func getMitrovicaLocation() -> MKPointAnnotation{
        let mitrovica = MKPointAnnotation()
        mitrovica.coordinate = CLLocationCoordinate2D(latitude: 42.889399326244494, longitude: 20.865788009048075)
        mitrovica.title = "Mitrovica"
        mapView.addAnnotation(mitrovica)

        return mitrovica
        
    }
           
           
    func getPreshevaLocation() -> MKPointAnnotation{
        let presheva = MKPointAnnotation()
        presheva.coordinate = CLLocationCoordinate2D(latitude: 42.309209433150166, longitude: 21.64887000926586)
        presheva.title = "Presheva"
        mapView.addAnnotation(presheva)
               
        return presheva
    }
           
           func drawPathFromMeToDestination(myLocation: MKPointAnnotation, destLocation: MKPointAnnotation){
               let myPlaceMark = MKPlacemark(coordinate: myLocation.coordinate)
               let destPlaceMark = MKPlacemark(coordinate: destLocation.coordinate)
               
               let myLocationMapItem = MKMapItem(placemark: myPlaceMark)
               let destLocationMapItem = MKMapItem(placemark: destPlaceMark)
               
               let directionRequest = MKDirections.Request()
               directionRequest.source = myLocationMapItem
               directionRequest.destination = destLocationMapItem
               directionRequest.requestsAlternateRoutes = true
               directionRequest.transportType = .automobile
               
               let direction = MKDirections(request: directionRequest)
               direction.calculate { (response, error) in
                   if(error == nil){
                       for route in response!.routes{
                           self.mapView.addOverlay(route.polyline, level: .aboveLabels)
                       }
                   }
               }
           }


          
       
               func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
               let renderer = MKPolylineRenderer(overlay: overlay)
               renderer.strokeColor = UIColor(named: "header")
               renderer.lineWidth = 4.0
             
               
               return renderer
           }
    
    
    
}
