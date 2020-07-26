//
//  DialogFactory.swift
//  MC3
//
//  Created by Arif Luthfiansyah on 26/07/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class DialogFactory {

    enum Scene {
        case animalInfo(dialogId: String, delegate: DialogAnimalInfoViewDelegate?)
    }

    private var displayedDialogs: [String : UIView] = [:]

    func show(scene: Scene) {
        switch scene {
        case .animalInfo(let dialogId, let delegate):
            DispatchQueue.main.async {
                let keyWindow = UIApplication
                    .shared
                    .windows
                    .filter({ $0.isKeyWindow })
                    .first
                if let unwrappedKeyWindow = keyWindow {
                    let view = self.instantiateDialogAnimalInfoView()
                    view.delegate = delegate
                    self.displayedDialogs[dialogId] = view
                    unwrappedKeyWindow.addSubview(view)
                }
            }
        }
    }

    func hide(dialogId: String) {
        DispatchQueue.main.async {
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            guard let view = self.displayedDialogs[dialogId],
                let _ = keyWindow else { return }
            view.removeFromSuperview()
        }
    }

}

extension DialogFactory {

    private func instantiateDialogAnimalInfoView() -> DialogAnimalInfoView {
        let xPoint = (UIScreen.main.bounds.width / 2) -
            (DialogAnimalInfoView.Constant.kDialogAnimalInfoViewWidth / 2)
        let yPoint = (UIScreen.main.bounds.height / 2) -
            (DialogAnimalInfoView.Constant.kDialogAnimalInfoViewHeight / 2)
        let rect = CGRect(
            x: xPoint,
            y: yPoint,
            width: DialogAnimalInfoView.Constant.kDialogAnimalInfoViewWidth,
            height: DialogAnimalInfoView.Constant.kDialogAnimalInfoViewHeight
        )
        return DialogAnimalInfoView(frame: rect)
    }

}
