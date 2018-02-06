//
//  TodayViewController.swift
//  ScoreWidget
//
//  Created by Pallav Trivedi on 15/01/18.
//  Copyright © 2018 Pallav Trivedi. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    var scoreWidgetView:ScoreWidgetView?

    var dummyCricketData = [GameDataModel]()
    var dummyFootballData = [GameDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOSApplicationExtension 10.0, *) {
            extensionContext?.widgetLargestAvailableDisplayMode = .expanded
            
        } else {
            // Fallback on earlier versions
        }
        
        scoreWidgetView = ScoreWidgetView.loadNib()
        scoreWidgetView?.delegate = self
        scoreWidgetView?.frame = self.view.frame
        self.view.addSubview(scoreWidgetView!)
        
        populateDummyData()
        testWithCricketData()
        
    }
    
    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        self.preferredContentSize = (activeDisplayMode == .expanded) ? CGSize(width: self.view.frame.size.width, height: EXPANDED_HEIGHT) : CGSize(width: self.view.frame.size.width, height: SHRINKED_HEIGHT)
        self.scoreWidgetView?.shouldDetailInfoViewBeHidden(state: (activeDisplayMode == .expanded) ? false : true)
    }
    
    
    /// Populates arrays with dummy data.
    func populateDummyData()
    {
        dummyCricketData.append(GameDataModel(leftImageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/4/42/Royal_Challengers_Bangalore_Logo.svg/878px-Royal_Challengers_Bangalore_Logo.svg.png", rightImageUrl: "https://www.thesouledstore.com/public/theSoul/uploads/catalog/product/20170331171533-1.jpg", leftTitleText: "RCB", rightTitleText: "KKR", leftSubtitleText: "", rightSubtitleText: "", headerText: "IPL 2018", detailText: "Semi Final", moreDetailText: "KKR chose to bat first"))
        
        dummyCricketData.append(GameDataModel(leftImageUrl: "http://p.imgci.com/db/PICTURES/CMS/203000/203043.1.jpg", rightImageUrl: "http://iplstatic.s3.amazonaws.com/players/210/84.png", leftTitleText: "McCullum", rightTitleText: "Gambhir", leftSubtitleText: "4", rightSubtitleText: "0", headerText: "KKR 4/0", detailText: "0.3 overs", moreDetailText: ""))
        
        dummyFootballData.append(GameDataModel(leftImageUrl: "https://www.maxgolfprotein.com/app/uploads/2017/02/MGP-Portugal-Flag-Square.jpg", rightImageUrl: "https://static.webshopapp.com/shops/094414/files/051865160/flag-of-argentina.jpg", leftTitleText: "Porugal", rightTitleText: "Argentina", leftSubtitleText: "", rightSubtitleText: "", headerText: "Worl Cup", detailText: "1-1", moreDetailText: "HALF TIME"))
        
        dummyFootballData.append(GameDataModel(leftImageUrl: "https://image.afcdn.com/story/20140630/cristiano-ronaldo-pendant-la-coupe-du-monde-2014-26-juin-267823_w767h767c1cx1561cy1030.jpg", rightImageUrl: "https://www.foottheball.com/wp-content/uploads/2017/02/messi-1.jpg", leftTitleText: "Ronaldo", rightTitleText: "Messi", leftSubtitleText: "1", rightSubtitleText: "1", headerText: "", detailText: "Ronaldo - 1", moreDetailText: "Messi - 1"))
    }
    
    
    /// Sets dummy cricket data on widget
    func testWithCricketData()
    {
        scoreWidgetView?.populateViewWith(data: dummyCricketData[0], viewType: .basicInfo)
        scoreWidgetView?.populateViewWith(data: dummyCricketData[1], viewType: .detailInfo)
    }
    
    
    /// Sets dummy football data on widget
    func testWithFootballData()
    {
        scoreWidgetView?.populateViewWith(data: dummyFootballData[0], viewType: .basicInfo)
        scoreWidgetView?.populateViewWith(data: dummyFootballData[1], viewType: .detailInfo)
    }
    
}
extension TodayViewController:DeeplinkHandlerDelegate
{
    func navigateToBasicInfoScreen()
    {
//        let url = URL(string: "some deeplink url for basic info screen")
//        self.extensionContext?.open(url!, completionHandler: nil)
    }
    
    func navigateToDetailInfoScreen()
    {
//        let url = URL(string: "some deeplink url for detail info screen")
//        self.extensionContext?.open(url!, completionHandler: nil)
    }
    
    
}
