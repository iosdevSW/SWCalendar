//
//  CoreMethod.swift
//  SWCalendar
//
//  Created by 신상우 on 2021/09/07.
//

import Foundation

let standardYear = 1 // 기준 년월일 1년 1월 1일 월요일

func isLeapYear(year: Int) -> Bool {
    if (year%4 == 0 && year%100 == 0) || year%400 == 0{
        return true //4로 떨어지고 100으로 안떨어지거나 400으로 떨어지면 윤년
    }else{ return false } //아니면 평년
}


func getFirstDay(year: Int, month: Int, day: Int) -> Int {
    let first = (year-1) / 400 // 400으로 떨어진건 무조건 윤년.
    let second = (year-1) / 100 - first //100으로 나눈 수는 평년 그러나 400으로 나눈건 윤년이니까 빼준다.
    let leapYear =  (year-1) / 4 - second // 4로 떨어진 수에 100으로 떨어진 수를 빼면 윤년
    var days = (year - 1) * 365 + leapYear + 1 // 1년 1월 1일 기준 월요일로 잡고 월요일값 1에 일 수 만큼 더한 후 7로 나누어 그 해 첫 요일 값을 구한다.
    
    var monthDay = 0
    for i in 1..<month {
        monthDay += getMonthDay(year: year, month: i)
    }
    
    days += monthDay
    days += day
    
    return days % 7
}

func getMonthDay(year: Int, month: Int) -> Int {
    switch month {
    case 4 : fallthrough
    case 6 : fallthrough
    case 9 : fallthrough
    case 11 : return 30
        
    case 2 :
        if isLeapYear(year: year) {
            return 29
        }else { return 28 }
        
    default:
        return 31
    }
}
