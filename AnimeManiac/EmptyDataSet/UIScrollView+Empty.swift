//
//  UIScrollView+Empty.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation
import EmptyDataSet_Swift

extension UIScrollView {
    
    func updateEmptyScreen(emptyReason: EmptyReason) {
        self.emptyDataSetView { emptyView in
            emptyView.titleLabelString(emptyReason.attributedTitle)
                .customView(emptyReason.customView)
                .verticalOffset(emptyReason.verticalOffset)
                .detailLabelString(emptyReason.attributedDescription)
                .image(emptyReason.image)
                .buttonTitle(emptyReason.attributedButtonTitle, for: .normal)
                .buttonBackgroundImage(emptyReason.buttonBackgroundImage, for: .normal)
                .dataSetBackgroundColor(emptyReason.backgroundColor)
                .didTapDataButton {
                    emptyReason.completionBlock?()
                }
                .detailLabelString(emptyReason.attributedDescription)
                .verticalSpace(emptyReason.verticalSpace)
        }
        
    }
}
