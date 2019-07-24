//
//  GameViewController.swift
//  pictogram
//
//  Created by Egor Devyatov on 18.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let userDefaultsBase = UserDefaults.standard

    var plates: Array<UIButton> = []
    var stack: UIStackView!
    
    // фабрика кнопок - генерирует одинаковые кнопки
    private func generateButtons(numberOfButtons: Int) {
        var i = 0
        while i < numberOfButtons {
            let btn = UIButton()
            btn.setTitle("\(i)", for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.backgroundColor = UIColor.orange
            btn.layer.cornerRadius = 5
            btn.clipsToBounds = true
            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            btn.tag = i
            plates.append(btn)

            i += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // создаем кнопки
        generateButtons(numberOfButtons: userDefaultsBase.integer(forKey: "buttons"))
    }
    
    // отрисовка интерфейса
    private func createUI() {
        // делаем градиент
        let gradient = CAGradientLayer()
        
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
        self.view.autoresizingMask = [.flexibleWidth, .flexibleRightMargin, .flexibleBottomMargin]
        
        print("кол-во кнопок plates = \(plates.count)")
    
        var i = 0
        
        //let plateSize = self.view.bounds.width / 8 - 40
        let plateSize = 50
        for plate in plates {
            let randomInt = Int.random(in: 0..<200)
            print("plate \(i) random = \(randomInt)")
            plates[i].frame = CGRect(x: 50 + (plateSize + 5) * i, y: 50, width: plateSize, height: plateSize)
            
            i += 1
            self.view.addSubview(plate)
            //plates[i].frame.size = CGSize(width: plateSize, height: plateSize)
            print(self.view.subviews.count)
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        let randomInt = Int.random(in: 0..<200)
        //let randomX = (self.view.bounds.width / 2) - randomInt
        //let randomY = self.view.bounds.height / 2
        if btnsendtag.tag == 1 {
            self.plates[1].frame = CGRect(x: randomInt, y: randomInt, width: 55, height: 55)
        }
        
        if btnsendtag.tag == 0 {
            self.plates[0].frame = CGRect(x: self.view.bounds.width / 2 - 100, y: self.view.bounds.height / 2 - 200, width: 55, height: 55)
            }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.createUI()
    }

}
