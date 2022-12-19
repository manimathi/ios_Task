//
//  LocationViewController.swift
//  TaskProject
//
//  Created by Manikandan on 17/12/22.
//

import UIKit

class LocationViewController: UIViewController {
    
    var locationListModel = LocationListViewModal()
    let sectionTitle = ["City Details","Forecast"]
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Weather Condition"
        label.textAlignment = .center
        return label
    }()
    
    private var tableLocationList: UITableView = {
        let table = UITableView()
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        table.backgroundColor = .white
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        viewSetupMethod()
        self.initViewModal()
        self.viewInitializedMethod()
        
    }
    func viewSetupMethod()  {
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        tableLocationList.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(labelTitle)
        self.view.addSubview(tableLocationList)
        
        let viewsDict = [
            "labelTitle": labelTitle,
            "tableLocationList": tableLocationList
        ]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[labelTitle(40)]-15-[tableLocationList]|", options: [], metrics: nil, views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[labelTitle]-10-|", options: [], metrics: nil, views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableLocationList]|", options: [], metrics: nil, views: viewsDict))

    }
    func viewInitializedMethod()  {
        tableLocationList.register(LocationForecastTableViewCell.self, forCellReuseIdentifier: "LocationForecastTableViewCell")
        tableLocationList.register(LocationCityTableViewCell.self, forCellReuseIdentifier: "LocationCityTableViewCell")
        tableLocationList.backgroundColor = .clear
        tableLocationList.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableLocationList.dataSource = self
        tableLocationList.delegate = self
    }
    
    func initViewModal()  {
        tableLocationList.estimatedRowHeight = 150
        tableLocationList.rowHeight = UITableView.automaticDimension
        locationListModel.reloadTableView = {
            DispatchQueue.main.async { self.tableLocationList.reloadData() }
        }
        locationListModel.getData(city: "chennai")
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .darkContent
       }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           DispatchQueue.main.async { [weak self] in
               self?.navigationController?.navigationBar.sizeToFit()
           }
       }
}

extension LocationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .lightGray
        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = sectionTitle[section]
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        
        headerView.addSubview(label)
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
            
        default:
            return locationListModel.locationList?.forecast?.forecastday?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        switch indexPath.section {
        case 0:
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCityTableViewCell", for: indexPath) as! LocationCityTableViewCell
            cell.selectionStyle = .none
            if let cellModal = locationListModel.locationList?.location {
                cell.cellConfigData(cellData: cellModal)
            }
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationForecastTableViewCell", for: indexPath) as! LocationForecastTableViewCell
            cell.selectionStyle = .none
            if let cellModal = locationListModel.locationList?.forecast?.forecastday?[indexPath.row] {
                cell.cellConfigData(cellData: cellModal)

            }
            return cell
        }
    }
    
}
