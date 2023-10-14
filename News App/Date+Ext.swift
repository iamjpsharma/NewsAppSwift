//
//  Date+Ext.swift
//  News App
//
//  Created by jaiprakash sharma on 14/10/23.
//

import Foundation

extension Date {
    func relativeTime(to date: Date = Date()) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full

        return formatter.string(from: self, to: date) ?? "N/A"
    }
}
