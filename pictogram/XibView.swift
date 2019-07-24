//
//  XibView.swift
//  pictogram
//
//  Created by Egor Devyatov on 24.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class XibView: UIView {
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "XibViewController", bundle: Bundle.main).instantiate(withOwner: nil, options: nil).first as! UIView
    }
}
