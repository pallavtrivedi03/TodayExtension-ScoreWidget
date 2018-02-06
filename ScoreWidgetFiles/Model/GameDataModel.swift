//
//  GameDataModel.swift
//  ScoreWidget
//
//  Created by Pallav Trivedi on 15/01/18.
//  Copyright © 2018 Pallav Trivedi. All rights reserved.
//

import Foundation
import UIKit

struct GameDataModel
{
    var leftImageUrl        :String = ""
    var rightImageUrl       :String = ""
    var leftTitleText       :String = ""
    var rightTitleText      :String = ""
    var leftSubtitleText    :String = ""
    var rightSubtitleText   :String = ""
    var headerText          :String = ""
    var detailText          :String = ""
    var moreDetailText      :String = ""
    
    init(leftImageUrl:String,rightImageUrl:String,leftTitleText:String,rightTitleText:String,leftSubtitleText:String,rightSubtitleText:String,headerText:String,detailText:String,moreDetailText:String)
    {
        self.leftImageUrl = leftImageUrl
        self.rightImageUrl = rightImageUrl
        self.leftTitleText = leftTitleText
        self.rightTitleText = rightTitleText
        self.leftSubtitleText = leftSubtitleText
        self.rightSubtitleText = rightSubtitleText
        self.headerText = headerText
        self.detailText = detailText
        self.moreDetailText = moreDetailText
    }
}
