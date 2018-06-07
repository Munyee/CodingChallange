//
//  AutoSuggestTableView.swift
//  CodingChallange
//
//  Created by Munyee on 07/06/2018.
//  Copyright © 2018 Chan Mun Yee. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView{
    func placeBelow(targetView: UIView){
        let bottomOfTargetView = targetView.frame.maxY
        let leftOfTargetView = targetView.frame.minX
        let widthOfTargetView = targetView.frame.width
        
        // put the table view on bottom of the target view, left aligned to the target view and same width
        self.frame = CGRect(x: leftOfTargetView, y: bottomOfTargetView, width: widthOfTargetView, height: 300.0)
        
    }
    
    func resizeHeightToFitCell(){
        let numOfCells = 5
        
        var fitHeight = CGFloat(Double(numOfCells) * Constants.stationCellHeight)
        
        if(self.contentSize.height < fitHeight ){
            fitHeight = self.contentSize.height
        }
        
        self.frame = CGRect(x: self.frame.origin.x , y: self.frame.origin.y, width: self.frame.size.width, height: fitHeight)
    }
}
