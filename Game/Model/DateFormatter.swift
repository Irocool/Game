//
//  DateFormatter.swift
//  Game
//
//  Created by Irina Kuligina on 02.02.2022.
//

import Foundation

let globalDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
    return dateFormatter
}()
