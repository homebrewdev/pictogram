//
//  SelectViewController.swift
//  pictogram
//
//  Created by Egor Devyatov on 22.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    // инициируем user defaults
    let userDefaultsBase = UserDefaults.standard
    
    // view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = Int(selectView.bounds.width) // ширина
        let height = Int(selectView.bounds.height)

        print("Ширина View: \(width)")
        print("Высота View: \(height)")
        
        // добавляем жест рекогнайзер долгое нажатие на экран
        let recognizer = UILongPressGestureRecognizer()
        recognizer.addTarget(self, action: #selector(handleLongPressGesture(_:)))
        view.addGestureRecognizer(recognizer)

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
    }

    // при нажатии кнопки "OK"
    // передадим количество создаваемых кнопок в GameViewController
    @IBAction func pushToOKButton(_ sender: UIButton) {
        let numberOfBtn = Int(numberOfButtonsTextField?.text ?? "1")

        print("Buttons \(String(describing: numberOfBtn))")
            // запишем число кнопок в UserDefaults

        userDefaultsBase.set(numberOfBtn, forKey: "buttons")

    }

    // обработка активациижеста долгого нажатия
    @objc func handleLongPressGesture(_ gestureRecognizer: UILongPressGestureRecognizer) {
        numberOfButtonsTextField.text = "10"
    }
    
    //MARK: - аутлеты
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

    // MARK: - Создание интерфейса
    func createUI() {
        // заливаем вью градиентом
        let gradient = CAGradientLayer()

        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]

        self.view.layer.insertSublayer(gradient, at: 0)
        self.view.autoresizingMask = [.flexibleWidth, .flexibleLeftMargin, .flexibleRightMargin]
    }
    
    //  если границы view меняются
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //self.createUI()
    }
}
