//
//  UnorderedListRowCell.swift
//  Accessibility Training
//
//  Created by Will Richardson on 9/29/16.
//  Copyright © 2016 Will Richardson. All rights reserved.
//

import UIKit

class UnorderedListRowCell: ContentsRowCell {
    
    override func configure(rowModel: BaseRow) {
        
        if rowModel is ContentRow {
            super.configure(rowModel: rowModel)
        }
        
        if let unorderedRow = rowModel as? UnorderedRow {
            
            var spacer = ""
            for _ in 1...unorderedRow.level {
                spacer.append(" ")
            }
            let level = "•"
            // let content = unorderedRow // .toAttribString()
            // textContentsLabel.text = "\(spacer) \(level) \(content)"
            let attribString = NSMutableAttributedString(string:"\(spacer) \(level) ")
            attribString.append(textContentsLabel.attributedText!)
            textContentsLabel.attributedText = attribString
            
            if unorderedRow.lastListRow {
                self.accessibilityValue = "List End"
            }
        }
    }
    
    func unorderedRowModel() -> UnorderedRow? {
        
        return baseRowModel as? UnorderedRow
    }
}
