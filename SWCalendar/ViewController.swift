//
//  ViewController.swift
//  SWCalendar
//
//  Created by 신상우 on 2021/08/30.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    let calendarViewWidth: CGFloat = 44 * 7
    let calendarViewHieght: CGFloat = 44 * 6
    let calendarCellWidthAndHeight: CGFloat = 44
    let dayArray = ["일","월","화","수","목","금","토"]
    let array = ["1","2","3","4","5","6","7","8","9","10",
                 "11","12","13","14","15","16","17","18","19","20",
                 "21","22","23","24","25","26","27","28","29","30","31"]
    
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
    }
    
    //MARK: Method
    func addSubView(){
        self.view.addSubview(self.calendarView)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            self.calendarView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.calendarView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.calendarView.widthAnchor.constraint(equalToConstant: self.calendarViewWidth),
            self.calendarView.heightAnchor.constraint(equalToConstant: self.calendarViewHieght)
        ])
    }

    //MARK:- CollectionView Delegate,DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == calendarView {
            return array.count
//        }
//        else{
//            return dayArray.count
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        if collectionView == self.calendarView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:indexPath) as! CollectionCell
        cell.dateLabel.text = self.array[indexPath.row]
        cell.dateLabel.font = .systemFont(ofSize: 16, weight: .thin)
        
        return cell
//        }else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
//            cell.dateLabel.text = self.dayArray[indexPath.row]
//            return cell
//        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as! CollectionHeaderView
        
        return headerView
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    //뷰 크기 리턴
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(
                width: self.calendarCellWidthAndHeight,
                height: self.calendarCellWidthAndHeight
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
            width: 44 * 7,
            height: 44)
    }

}

