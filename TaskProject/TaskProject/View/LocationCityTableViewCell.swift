//
//  LocationCityTableViewCell.swift
//  TaskProject
//
//  Created by Manikandan on 17/12/22.
//

import UIKit

class LocationCityTableViewCell: UITableViewCell {

     private let viewBackground: UIView = {
         let view = UIView()
         view.backgroundColor = .white
         view.layer.shadowOffset =  CGSize(width: 0, height: 2)
         view.layer.shadowColor = UIColor.black.cgColor
         view.layer.shadowRadius = 1.5
         view.layer.shadowOpacity = 0.65
         view.layer.cornerRadius = 10
         view.clipsToBounds = true
         view.layer.masksToBounds = false
         view.layer.cornerRadius = 10
         return view
     }()
     
     private let imageWeather: UIImageView = {
         let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 20, height: 20)))
         imageView.contentMode = .center
         imageView.backgroundColor = .lightGray
         return imageView
     }()
     
     private let labelTitleCountry: UILabel = {
         let label = UILabel()
         label.lineBreakMode = .byTruncatingTail
         label.numberOfLines = 0
         label.font = .boldSystemFont(ofSize: 15)
         label.textColor = .black
         label.text = "Country"
         return label
     }()
     
     private let labelCountry: UILabel = {
         let label = UILabel()
         label.lineBreakMode = .byTruncatingTail
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 15)
         label.textColor = .black
         return label
     }()
     private let labelTitleState: UILabel = {
         let label = UILabel()
         label.lineBreakMode = .byTruncatingTail
         label.numberOfLines = 0
         label.font = .boldSystemFont(ofSize: 15)
         label.textColor = .black
         label.text = "State"
         return label
     }()
     private let labelState: UILabel = {
         let label = UILabel()
         label.lineBreakMode = .byTruncatingTail
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 15)
         label.textColor = .black
         return label
     }()
     private let labelTitleCity: UILabel = {
         let label = UILabel()
         label.lineBreakMode = .byTruncatingTail
         label.numberOfLines = 0
         label.font = .boldSystemFont(ofSize: 15)
         label.textColor = .black
         label.text = "City"
         return label
     }()
     private let labelCity: UILabel = {
         let label = UILabel()
         label.lineBreakMode = .byTruncatingTail
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 15)
         label.textColor = .black
         return label
     }()
     private let labelTitleDate: UILabel = {
         let label = UILabel()
         label.lineBreakMode = .byTruncatingTail
         label.numberOfLines = 0
         label.font = .boldSystemFont(ofSize: 15)
         label.textColor = .black
         label.text = "Date and Time"
         return label
     }()
     private let labelDate: UILabel = {
         let label = UILabel()
         label.lineBreakMode = .byTruncatingTail
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 15)
         label.textColor = .black
         return label
     }()
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         viewSetup()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
         
     }
     
     func viewSetup ()  {
         imageWeather.backgroundColor = .blue
         self.backgroundColor = .clear

         viewBackground.translatesAutoresizingMaskIntoConstraints = false
         labelDate.translatesAutoresizingMaskIntoConstraints = false
         labelCountry.translatesAutoresizingMaskIntoConstraints = false
         labelState.translatesAutoresizingMaskIntoConstraints = false
         labelCity.translatesAutoresizingMaskIntoConstraints = false
         
         labelTitleDate.translatesAutoresizingMaskIntoConstraints = false
         labelTitleCountry.translatesAutoresizingMaskIntoConstraints = false
         labelTitleState.translatesAutoresizingMaskIntoConstraints = false
         labelTitleCity.translatesAutoresizingMaskIntoConstraints = false

         contentView.addSubview(viewBackground)
         
         viewBackground.addSubview(labelDate)
         viewBackground.addSubview(labelCountry)
         viewBackground.addSubview(labelState)
         viewBackground.addSubview(labelCity)
         
         viewBackground.addSubview(labelTitleDate)
         viewBackground.addSubview(labelTitleCountry)
         viewBackground.addSubview(labelTitleState)
         viewBackground.addSubview(labelTitleCity)

         let viewsDict = [
             "viewBackground": viewBackground,
             "labelDate": labelDate,
             "labelCountry": labelCountry,
             "labelState": labelState,
             "labelCity": labelCity,
             "labelTitleDate": labelTitleDate,
             "labelTitleCountry": labelTitleCountry,
             "labelTitleState": labelTitleState,
             "labelTitleCity": labelTitleCity,
         ]
         contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[viewBackground(140)]-5-|", options: [], metrics: nil, views: viewsDict))
         contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[viewBackground]-10-|", options: [], metrics: nil, views: viewsDict))


         viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[labelTitleCountry(30)][labelTitleState(30)][labelTitleCity(30)][labelTitleDate(30)]-10-|", options: [], metrics: nil, views: viewsDict))
         viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[labelCountry(30)][labelState(30)][labelCity(30)][labelDate(30)]-10-|", options: [], metrics: nil, views: viewsDict))

         viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[labelTitleCountry(==labelCountry)]-20-[labelCountry]-10-|", options: [], metrics: nil, views: viewsDict))
         viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[labelTitleState(==labelState)]-20-[labelState]-10-|", options: [], metrics: nil, views: viewsDict))
         viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[labelTitleCity(==labelCity)]-20-[labelCity]-10-|", options: [], metrics: nil, views: viewsDict))
         viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[labelTitleDate(==labelDate)]-20-[labelDate]-10-|", options: [], metrics: nil, views: viewsDict))
     }

    func cellConfigData(cellData: Location ) {
        labelCountry.text = cellData.country
        labelState.text = cellData.region
        labelCity.text = cellData.name
        labelDate.text = cellData.localtime

    }
}
