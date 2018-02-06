//
//  WidgetConstants.swift
//  ScoreWidget
//
//  Created by Pallav Trivedi on 15/01/18.
//  Copyright © 2018 Pallav Trivedi. All rights reserved.
//

import Foundation
import UIKit

let EXPANDED_HEIGHT :CGFloat    =   220
let SHRINKED_HEIGHT :CGFloat    =   110


/// Enum to control expanded and shrinked state of widget
///
/// - basicInfo: Widget is shrinked, only basic info section would be visible.
/// - detailInfo: Widget is expanded and both (Basic and Detail) sections would be visible.
enum ViewType
{
    case basicInfo
    case detailInfo
}
