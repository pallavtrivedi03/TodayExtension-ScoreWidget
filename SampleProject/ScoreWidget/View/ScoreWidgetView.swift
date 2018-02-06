//
//  ScoreWidgetView.swift
//  ScoreWidget
//
//  Created by Pallav Trivedi on 15/01/18.
//  Copyright © 2018 Pallav Trivedi. All rights reserved.
//

import UIKit


/// Confirm to this protocol to handle deeplink and open app when user taps on widget
protocol DeeplinkHandlerDelegate
{
    func navigateToBasicInfoScreen()
    func navigateToDetailInfoScreen()
}

class ScoreWidgetView: UIView
{

    @IBOutlet weak private var basicInfoContainerView: UIView!
    @IBOutlet weak private var loadingView: UIView!
    @IBOutlet weak private var detailInfoContainerView: UIView!
    @IBOutlet weak private var teamOneImageView: UIImageView!
    @IBOutlet weak private var teamTwoImageView: UIImageView!
    @IBOutlet weak private var teamOneTitleLabel: UILabel!
    @IBOutlet weak private var teamTwoTiltleLabel: UILabel!
    @IBOutlet weak private var teamOneScoreLabel: UILabel!
    @IBOutlet weak private var teamTwoScoreLabel: UILabel!
    @IBOutlet weak private var gameInfoLabel: UILabel!
    @IBOutlet weak private var gameDetailLabel: UILabel!
    @IBOutlet weak private var gameMoreDetailLabel: UILabel!
    @IBOutlet weak private var detailTeamOneImageView: UIImageView!
    @IBOutlet weak private var detailTeamTwoImageView: UIImageView!
    @IBOutlet weak private var detailOneTitleLabel: UILabel!
    @IBOutlet weak private var detailTwoTitleLabel: UILabel!
    @IBOutlet weak private var detailOneScoreLabel: UILabel!
    @IBOutlet weak private var detailTwoScoreLabel: UILabel!
    @IBOutlet weak private var detailOneInfoLabel: UILabel!
    @IBOutlet weak private var detailTwoInfoLabel: UILabel!
    @IBOutlet weak private var detailThreeInfoLabel: UILabel!
    
    var delegate:DeeplinkHandlerDelegate?
    
    /// Sets the values to the components (viz. labels, image views etc) in the widget view.
    ///
    /// - Parameters:
    ///   - data: Object of GameDataModel. This should contain the data to be set on the components.
    ///   - viewType: A case of enum ViewType.
    func populateViewWith(data:GameDataModel,viewType:ViewType)
    {
        if viewType == .basicInfo
        {
            teamOneImageView.downloadedFrom(link: data.leftImageUrl)
            teamTwoImageView.downloadedFrom(link: data.rightImageUrl)
            teamOneScoreLabel.text      = data.leftTitleText
            teamTwoScoreLabel.text      = data.rightTitleText
            teamOneTitleLabel.text      = data.leftSubtitleText
            teamTwoTiltleLabel.text     = data.rightSubtitleText
            gameInfoLabel.text          = data.headerText
            gameDetailLabel.text        = data.detailText
            gameMoreDetailLabel.text    = data.moreDetailText
        }
        else if viewType == .detailInfo
        {
            detailTeamOneImageView.downloadedFrom(link: data.leftImageUrl)
            detailTeamTwoImageView.downloadedFrom(link: data.rightImageUrl)
            detailOneTitleLabel.text =  data.leftSubtitleText
            detailTwoTitleLabel.text = data.rightSubtitleText
            detailOneScoreLabel.text = data.leftTitleText
            detailTwoScoreLabel.text = data.rightTitleText
            detailOneInfoLabel.text  = data.headerText
            detailTwoInfoLabel.text = data.detailText
            detailThreeInfoLabel.text = data.moreDetailText
        }
    }
    
    
    /// Toggle the state (hidden/unhidden) of detail info view. This view should be hided when show less option is selected on widget.
    ///
    /// - Parameter state: Bool value to control hidden state.
    func shouldDetailInfoViewBeHidden(state:Bool)
    {
        detailInfoContainerView.isHidden = state
    }
    
    
    /// Action method to deeplink when user taps on basic info view
    ///
    /// - Parameter sender: Reference of the UIButton place in basic info view
    @IBAction func didClickOnBasicInfoDeepLinkButton(_ sender: UIButton)
    {
        delegate?.navigateToBasicInfoScreen()
    }
    
    /// Action method to deeplink when user taps on detail info view
    ///
    /// - Parameter sender: Reference of the UIButton place in detail info view
    @IBAction func didClickOnDetailInfoDeepLinkButton(_ sender: UIButton)
    {
        delegate?.navigateToDetailInfoScreen()
    }
    
}
