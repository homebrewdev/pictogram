//
//  XibViewController.swift
//  pictogram
//
//  Created by Egor Devyatov on 24.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class XibViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let xibView = XibView.instanceFromNib()
        self.view.addSubview(xibView)
    }

}
