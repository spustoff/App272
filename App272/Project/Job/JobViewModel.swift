//
//  JobViewModel.swift
//  App272
//
//  Created by Вячеслав on 12/7/23.
//

import SwiftUI

final class JobViewModel: ObservableObject {
 
    @AppStorage("currencies") var currencies: [String] = []
    @Published var isAdd: Bool = false
}

