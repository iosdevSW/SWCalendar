//
//  ViewController.swift
//  SWCalendar
//
//  Created by 신상우 on 2021/08/30.
//

import UIKit

class CalendarViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    let cellSize: CGFloat = 44
    let dayArray = ["일","월","화","수","목","금","토",]
    var year = 0
    var month = 0
    var day = 0
    
    let titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .thin)
        label.textAlignment = .center
        
        return label
    }()
    
    let calendarView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CollectionCell.self, forCellWithReuseIdentifier: "cell")
        view.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
        view.backgroundColor = .white
        view.isScrollEnabled = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addSubView()
        self.layout()
        self.calendarView.delegate = self
        self.calendarView.dataSource = self
        self.setGesture()
        
        let today = Date()
        let calendar = Calendar.current
        self.year = calendar.component(.year, from: today)
        self.month = calendar.component(.month, from: today)
        self.day = calendar.component(.day, from: today)
        titleLabel.text = "\(year)년 \(month)월"
    }
    
    //MARK: Method
    func addSubView(){
        self.view.addSubview(self.titleView)
        self.view.addSubview(self.calendarView)
        
        self.titleView.addSubview(self.titleLabel)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            self.titleView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.titleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleView.widthAnchor.constraint(equalToConstant: self.cellSize * 7),
            self.titleView.heightAnchor.constraint(equalToConstant: self.cellSize),
        ])
        
        NSLayoutConstraint.activate([
            self.calendarView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor),
            self.calendarView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.calendarView.widthAnchor.constraint(equalToConstant: self.cellSize * 7),
            self.calendarView.heightAnchor.constraint(equalToConstant: self.cellSize * 6)
        ])
        
        //Lv2
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.titleView.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.titleView.centerYAnchor)
        ])
    }

    //MARK:- CollectionView Delegate,DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 35

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:indexPath) as! CollectionCell
        
        let dayNumber = getFirstDay(year: self.year, month: self.month, day: self.day)
        
        let row = indexPath.row
        
        if row >= dayNumber{
            if row >= getMonthDay(year: self.year, month: self.month) + dayNumber{
                cell.dateLabel.text = "*"
            }else{
                cell.dateLabel.text = "\(indexPath.row + 1 - dayNumber)"
            }
        }else {
            cell.dateLabel.text = "*"
        }
        cell.dateLabel.font = .systemFont(ofSize: 16, weight: .thin)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as! CollectionHeaderView
        
        return headerView
    }
    
    //MARK:- setGesture
    func setGesture(){
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture(_:)))
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture(_:)))
        rightSwipe.direction = .right
        leftSwipe.direction = .left
        
        self.calendarView.addGestureRecognizer(rightSwipe)
        self.calendarView.addGestureRecognizer(leftSwipe)
    }
    
    //MARK: Selector
    @objc func respondToGesture(_ gesture: UISwipeGestureRecognizer){
        switch gesture.direction{
        case .right:
            if month == 1 {
                self.year -= 1
                self.month = 12
            }else{
            self.month -= 1
            }
            break
        case .left:
            if self.month == 12 {
                self.year += 1
                self.month = 1
            }else{
                self.month += 1
            }
        default:
            return
        }
        self.titleLabel.text = "\(year)년 \(month)월"
        self.calendarView.reloadData()
    
    }
}
extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    //뷰 크기 리턴
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(
                width: self.cellSize,
                height: self.cellSize
                )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(
            width: self.cellSize * 7,
            height: self.cellSize)
    }

}


