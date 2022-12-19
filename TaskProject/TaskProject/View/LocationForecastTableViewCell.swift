//
//  LocationForecastTableViewCell.swift
//  TaskProject
//
//  Created by Manikandan on 17/12/22.
//

import UIKit

class LocationForecastTableViewCell: UITableViewCell {
    
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
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private let labelTitleDate: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.text = "Date"
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
    private let labelTitleMaxTemp: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.text = "Max Temperature"
        return label
    }()
    private let labelMaxTemp: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    private let labelTitleMinTemp: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.text = "Min Temperature"
        return label
    }()
    private let labelMinTemp: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    private let labelTitleCondition: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.text = "Weather Condition"
        return label
    }()
    private let labelCondition: UILabel = {
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
        self.backgroundColor = .clear
        
        viewBackground.translatesAutoresizingMaskIntoConstraints = false
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelMaxTemp.translatesAutoresizingMaskIntoConstraints = false
        labelMinTemp.translatesAutoresizingMaskIntoConstraints = false
        labelCondition.translatesAutoresizingMaskIntoConstraints = false
        
        labelTitleDate.translatesAutoresizingMaskIntoConstraints = false
        labelTitleMaxTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTitleMinTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTitleCondition.translatesAutoresizingMaskIntoConstraints = false
        imageWeather.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(viewBackground)
        viewBackground.addSubview(labelDate)
        viewBackground.addSubview(labelMaxTemp)
        viewBackground.addSubview(labelMinTemp)
        viewBackground.addSubview(labelCondition)
        
        viewBackground.addSubview(labelTitleDate)
        viewBackground.addSubview(labelTitleMaxTemp)
        viewBackground.addSubview(labelTitleMinTemp)
        viewBackground.addSubview(labelTitleCondition)
        viewBackground.addSubview(imageWeather)
        
        let viewsDict = [
            "viewBackground": viewBackground,
            "labelDate": labelDate,
            "labelMaxTemp": labelMaxTemp,
            "labelMinTemp": labelMinTemp,
            "labelCondition": labelCondition,
            "labelTitleDate": labelTitleDate,
            "labelTitleMaxTemp": labelTitleMaxTemp,
            "labelTitleMinTemp": labelTitleMinTemp,
            "labelTitleCondition": labelTitleCondition,
            "imageWeather": imageWeather,
            
        ]
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[viewBackground(140)]-5-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[viewBackground]-10-|", options: [], metrics: nil, views: viewsDict))
        
        
        viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[labelDate(30)][labelMaxTemp(30)][labelMinTemp(30)][labelCondition(30)]-10-|", options: [], metrics: nil, views: viewsDict))
        viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[labelTitleDate(30)][labelTitleMaxTemp(30)][labelTitleMinTemp(30)][labelTitleCondition(30)]-10-|", options: [], metrics: nil, views: viewsDict))
        
        viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[labelTitleDate(==labelDate)]-20-[labelDate]-10-|", options: [], metrics: nil, views: viewsDict))
        viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[labelTitleMaxTemp(==labelMaxTemp)]-20-[labelMaxTemp]-10-|", options: [], metrics: nil, views: viewsDict))
        viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[labelTitleMinTemp(==labelMinTemp)]-20-[labelMinTemp]-10-|", options: [], metrics: nil, views: viewsDict))
        viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[labelTitleCondition(==labelCondition)]-20-[labelCondition]-10-|", options: [], metrics: nil, views: viewsDict))
        
        viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[imageWeather(30)]", options: [], metrics: nil, views: viewsDict))
        viewBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[imageWeather(30)]-10-|", options: [], metrics: nil, views: viewsDict))
        
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func cellConfigData(cellData: Forecastday ) {
        labelDate.text = cellData.date
        labelMaxTemp.text = "\(cellData.day?.maxtempC ?? 0)"
        labelMinTemp.text = "\(cellData.day?.mintempC ?? 0)"
        labelCondition.text = "\(cellData.day?.condition?.text ?? "")"
        
        let url = URL(string: "https:\(cellData.day?.condition?.icon ?? "")")
        if let data = try? Data(contentsOf: url!)
        {
            let image: UIImage = UIImage(data: data)!
            imageWeather.image = image
        }
    }
}
