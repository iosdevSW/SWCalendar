//
//  Model.swift
//  SWCalendar
//
//  Created by 신상우 on 2021/09/08.
//

import UIKit

struct CalendarViewInfo{
    var cellSize: CGFloat = 0
    private var calendarViewWidth: CGFloat?
    private var calendarViewHeight: CGFloat?
    let widthNumberOfCell = 7
    var hieghtNumberOfCell:Int?
    var dayArray = ["일","월","화","수","목","금","토"]
}
