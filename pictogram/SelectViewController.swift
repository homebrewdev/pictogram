//
//  SelectViewController.swift
//  pictogram
//
//  Created by Egor Devyatov on 22.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
   // var tapBtn: UIButton = {
   //     let btn = UIButton()
   //     btn.setTitle("Tap", for: .normal)
   //     btn.setTitleColor(UIColor.red, for: .normal)
   //     return btn
   // }()
    
    let userDefaultsBase = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tapBtn.frame = CGRect(x: self.view.bounds.width / 2 - 50, y: self.view.bounds.height / 2 - 50, width: 100, height: 100)
        //self.view.addSubview(self.tapBtn)
        //self.view.backgroundColor = UIColor.white
        let width = Int(selectView.bounds.width) // ширина
        let height = Int(selectView.bounds.height)

        print("Ширина View: \(width)")
        print("Высота View: \(height)")

    }
    
    // при нажатии на кнопку "Transform"
    @IBAction func pushTransformButton(_ sender: UIButton) {
        let scale = CGAffineTransform(scaleX: 0.25, y: 0.25)

        let randomInt = Int.random(in: -16..<16)
        var rotation = CGAffineTransform(rotationAngle: .pi / 2)
        if randomInt == 0 {
            rotation = CGAffineTransform(rotationAngle: .pi / 1)
        } else {
            rotation = CGAffineTransform(rotationAngle: .pi / CGFloat(randomInt))
        }

        selectView.transform = scale // меняем масштаб
        selectView.transform = rotation // вращаем
        //selectView.backgroundColor = UIColor.lightGray // делаем чтобы вью стала серой

    }

    // при нажатии кнопки "OK"
    // передадим количество создаваемых кнопок в GameViewController
    @IBAction func pushToOKButton(_ sender: Any) {
        let numberOfBtn = Int(numberOfButtonsTextField?.text ?? "1")

        print("Buttons \(String(describing: numberOfBtn))")
            // запишем число кнопок в UserDefaults

        userDefaultsBase.set(numberOfBtn, forKey: "buttons")

    }


    @IBAction func pushXibButton(_ sender: UIButton) {

    }

    @IBOutlet weak var selectView: UIView!

    @IBOutlet weak var numberOfButtonsTextField: UITextField!

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        switch previousTraitCollection?.horizontalSizeClass.rawValue {
        case 1:
            print("Horizontal Size Class = Compact")
        case 2:
            print("Horizontal Size Class = Regular")
        default:
            print("Horizontal Size Class = Unspecified")
        }

        switch previousTraitCollection?.verticalSizeClass.rawValue {
        case 1:
            print("Vertical Size Class = Compact")
        case 2:
            print("Vertical Size Class = Regular")
        default:
            print("Vertical Size Class = Unspecified")
        }
    }

    func createUI() {
        // заливаем вью градиентом
        let gradient = CAGradientLayer()

        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]

        self.view.layer.insertSublayer(gradient, at: 0)
        self.view.autoresizingMask = [.flexibleWidth, .flexibleLeftMargin, .flexibleRightMargin]
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.createUI()
    }
}
