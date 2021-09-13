//
//  Model.swift
//  SWCalendar
//
//  Created by 신상우 on 2021/09/08.
//

import UIKit

struct CalendarViewInfo{
    var cellSize: CGFloat?
    var getCalendarViewWidth: CGFloat {
        return cellSize! * CGFloat(widthNumberOfCell)
    }
    var getCalendarViewHeight: CGFloat {
        return cellSize! * CGFloat(heightNumberOfCell!)
    }
    let widthNumberOfCell = 7
    var heightNumberOfCell:Int?
    var numberOfItem: Int {
        return widthNumberOfCell * (heightNumberOfCell! - 1) // - 1은 요일 표기하는 헤더 셀 크기 빼주기.
    }
    var dayArray = ["일","월","화","수","목","금","토"]
}
