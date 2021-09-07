//
//  collectionCell.swift
//  SWCalendar
//
//  Created by 신상우 on 2021/08/30.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    //MARK: ProPerties
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        
        return label
    }()
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubView()
        self.layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:Method
    func addSubView(){
        self.addSubview(dateLabel)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            self.dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
