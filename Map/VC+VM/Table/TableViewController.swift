//
//  TableViewController.swift
//  Map
//
//  Created by Sathsara Maduranga on 6/23/20.
//  Copyright © 2020 Sathsara Maduranga. All rights reserved.
//

import UIKit
import EMResourcer

class TableViewController: UIViewController {
    
    
    @IBOutlet weak var btnAllAnno: UIBarButtonItem!
    @IBOutlet weak var tblView: UITableView!{didSet{tblView.reloadData()}}
    
    
    
    var place :[Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setupUI()
        
    }
    
    func setupUI()
    {
        tblView.delegate = self
        tblView.dataSource = self
        
    }
    
    func setData()
    {
        
        let place1 = Place(title: "Keells Super, Union Place", address: "Union Place, 199 Union Pl, Colombo 00200", latitude: 6.8972087, longitude: 79.8555767, userData: nil)
        let place2 = Place(title: "Arpico Super Centre, Maharagama", address: "A4 - Maharagama, Maharagama 10280", latitude: 6.8655794, longitude: 79.8775226, userData: nil)
        let place3 = Place(title: "Commercial Bank - Kaduwela Branch", address: "No 508/5, Avissawella Road,, Kaduwela", latitude: 6.9374199, longitude: 79.9444619, userData: nil)
        let place4 = Place(title: "Nugegoda Railway Station", address: "Station Ln, Nugegoda 10250", latitude: 6.8705181, longitude: 79.8910023, userData: nil)
        let place5 = Place(title: "Fashion Bug Head Office", address: "405 Pepiliyana Rd, Colombo", latitude: 6.8630855, longitude: 79.8751405, userData: nil)
        let place6 = Place(title: "Passport office", address: "Subuthi Dr, Sri Jayawardenepura Kotte", latitude: 6.8856518, longitude: 79.8788409, userData: nil)
        let place7 = Place(title: "Shanthi Plastic (Pvt) Ltd", address: "379 Galle Rd, Mount Lavinia 10370", latitude: 6.8548248, longitude: 79.8538318, userData: nil)
        let place8 = Place(title: "University of Moratuwa", address: "Bandaranayake Mawatha, Moratuwa 10400", latitude: 6.8324879, longitude: 79.8635441, userData: nil)
        let place9 = Place(title: "Kelaniya Raja Maha Viharaya", address: "Peliyagoda", latitude: 6.9145982, longitude: 79.8537785, userData: nil)
        let place10 = Place(title: "Ananda College", address: "111/9E Temple Rd, Colombo 01500", latitude: 6.8979841, longitude: 79.8511114, userData: nil)
        
        place = [place1, place2, place3, place4, place5, place6, place7, place8, place9, place10]
    }
    
    @IBAction func clickOnBtn(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "AllAnnotationsApple") as! AnnotationsApple
        vc.place = self.place
        navigationController?.pushViewController(vc, animated: true)
        
        
        // let vc = sb.instantiateViewController(withIdentifier: "AllAnnotationsApple") as!
        // vc.place  = self.place
        // navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}

extension TableViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return place.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblView.dequeueReusableCell(withIdentifier: "reuseCell" , for : indexPath) as! TableCell
        cell.lblPlaceName.text = place[indexPath.row].title
        cell.lblPlaceAddress.text = place[indexPath.row].address
        cell.cellDelegate = self
        cell.index = indexPath
        
        return cell
    }
    
    
}

extension TableViewController:TableViewNew
{
    func onClickApple(index: Int) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AppleMap") as! AppleMapsViewController
        vc.place  = place[index]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func onClickCell(index: Int) {
        
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "GoogleMap") as! GoogleMapsViewController
        vc.place  = place[index]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}



