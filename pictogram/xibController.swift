//
//  xibController.swift
//  pictogram
//
//  Created by Egor Devyatov on 22.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class xibView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        print("xib is started!")
    }
}
