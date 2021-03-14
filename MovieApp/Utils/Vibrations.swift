//
//  SuccessVibration.swift
//  MovieApp
//
//  Created by Desu Miko on 14.03.2021.
//

import Foundation
import SwiftUI

func successVibration() {
    UINotificationFeedbackGenerator().notificationOccurred(.success)
}

func errorVibration() {
    UINotificationFeedbackGenerator().notificationOccurred(.error)
}

func warningVibration() {
    UINotificationFeedbackGenerator().notificationOccurred(.warning)
}
