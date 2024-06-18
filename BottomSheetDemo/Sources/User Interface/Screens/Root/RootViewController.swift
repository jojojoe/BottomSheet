//
//  RootViewController.swift
//  BottomSheetDemo
//
//  Created by Mikhail Maslo on 14.11.2021.
//  Copyright © 2021 Joom. All rights reserved.
//

import BottomSheet
import SnapKit
import UIKit

final class RootViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Show BottomSheet", for: .normal)
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
    }

    private func setupSubviews() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }

        view.addSubview(button)
        button.addTarget(self, action: #selector(handleShowBottomSheet), for: .touchUpInside)
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(44)
        }
    }

    @objc
    private func handleShowBottomSheet() {
        let viewController = ResizeViewController(initialHeight: 300)
        /*
         // 默认状态
         presentBottomSheetInsideNavigationController(
             viewController: viewController,
             configuration: .default,
             canBeDismissed: {
                 // return `true` or `false` based on your business logic
                 true
             },
             dismissCompletion: {
                 // handle bottom sheet dismissal completion
             }
         )
         */
        // 自定义，sheet的上拉按钮在View内部
        let customConfig = BottomSheetConfiguration(
            cornerRadius: 10,
            pullBarConfiguration: .insidevisible(.init(height: 20)),
            shadowConfiguration: .init(backgroundColor: UIColor.black.withAlphaComponent(0.6), pullColor: UIColor.white)
        )
        presentBottomSheetInsideNavigationController(
            viewController: viewController,
            configuration: customConfig,
            canBeDismissed: {
                // return `true` or `false` based on your business logic
                true
            },
            dismissCompletion: {
                // handle bottom sheet dismissal completion
            }
        )
    }
}
