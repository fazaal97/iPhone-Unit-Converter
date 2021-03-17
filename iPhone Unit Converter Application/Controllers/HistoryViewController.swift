//
//  HistoryViewController.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-15.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedhistories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryTableViewCell
        cell.labelConversionHistory.lineBreakMode = .byWordWrapping
        cell.labelConversionHistory.numberOfLines = 3
        cell.labelConversionHistory.text = String(savedhistories[indexPath.row].getUnitConversion())
        cell.unitIcon.image = savedhistories[indexPath.row].getUnitIcon()

        
        cell.isUserInteractionEnabled = false
        cell.contentView.backgroundColor = UIColor(red: 1/255, green: 21/255, blue: 22/255, alpha: 1.0)
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00).cgColor
        cell.contentView.layer.masksToBounds = false
        
        return cell
    }
    
    
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var historyTable: UITableView!
    
    var savedhistories = [History]()
    var conversionType = "WeightHistory"
    var icon: UIImage = UIImage(named: "icons8-weight-filled-50")!
    var history : [String] = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTable.dataSource = self
        historyTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recallHistory(type: conversionType, icon: icon)
        DispatchQueue.main.async {
            self.historyTable.reloadData()
        }
        
    }

    
    @IBAction func segementedControllChnage(_ sender: UISegmentedControl) {
        switch segmentedControll.selectedSegmentIndex {
        case 0:
            conversionType = "WeightHistory"
            icon = UIImage(named: "icons8-weight-filled-100")!
        case 1:
            conversionType = "TempHistory"
            icon = UIImage(named: "icons8-temperature-filled-100")!
        case 2:
            conversionType = "LengthHistory"
            icon = UIImage(named: "icons8-width-filled-100")!
        case 3:
            conversionType = "SpeedHistory"
            icon = UIImage(named: "icons8-dashboard-filled-100")!
        case 4:
            conversionType = "VolumeHistory"
            icon = UIImage(named: "icons8-volume-101")!
        case 5:
            conversionType = "TimeHistory"
            icon = UIImage(named: "icons8-alarm-clock-100")!
        default:
            break
        }
        
        recallHistory(type: conversionType, icon: icon)
        DispatchQueue.main.async {
            self.historyTable.reloadData()
        }
    }
    
    func recallHistory(type: String, icon: UIImage) {
        savedhistories = []
        let historyList = UserDefaults.standard.value(forKey: conversionType) as? [String]
        
        if historyList?.count ?? 0 > 0 {
            for calculation in historyList! {
                let history = History(unitType: type, icon: icon, conversion: calculation)
                savedhistories += [history]
            }
        }
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }


   
}
