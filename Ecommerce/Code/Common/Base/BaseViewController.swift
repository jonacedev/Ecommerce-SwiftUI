//
//  BaseViewController.swift
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import UIKit
import Combine
import SwiftUI

class BaseViewController<Content>: UIHostingController<Content> where Content: View {

    // MARK: Properties

    private var baseViewModel: BaseViewModel?

    // MARK: - Object lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Private methods

    // MARK: - Public methods

    func set(baseViewModel: BaseViewModel) {
        self.baseViewModel = baseViewModel
    }

    // MARK: - Private methods

    // MARK: - BaseViewControllerProtocol

}
