//
//  NVProgressHUD.swift
//  BASwift
//
//  Created by Burak Akkaya on 3.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//
import NVActivityIndicatorView
import UIKit

open class NVProgressHUD: ProgressHUDProtocol {
    // MARK: - Properties
    public var isLoading: Bool

    public var options: ProgressHUDOptions

    var activityIndicator: NVActivityIndicatorView!

    var parentView: UIView?

    var transparentView: UIView?

    // MARK: - Initalization
    public required init(withOptions options: ProgressHUDOptions) {
        self.options = options
        self.isLoading = false
        setActivityIndicatorOption()
    }

    // MARK: - Methods
    public func show(in view: UIView) {
        parentView = view
        isLoading = true
        options.showTransparentView ? startWithTransparentView(inView: view)
            : startWithoutTransparentView(inView: view)
        setActivityIndicatorCenterPoint()
        activityIndicator.startAnimating()

    }

    public func hide() {
        isLoading = false
        transparentView?.removeFromSuperview()
        parentView?.isUserInteractionEnabled = true
        parentView = nil
        activityIndicator.stopAnimating()
    }

    // MARK: - Private Methods
    private func startWithTransparentView(inView view: UIView) {
        initTransparentView(withFrame: CGRect(x: 0, y: 0, width: view.bounds.width,
                                              height: view.bounds.height))
        transparentView?.addSubview(activityIndicator)
        view.addSubview(transparentView!)
    }

    private func startWithoutTransparentView(inView view: UIView) {
        view.addSubview(activityIndicator)
    }

    private func setUserInteractionStatus() {
        guard let nvOptions = options as? NVProgressHUDOptions else {
            fatalError("Options not nvprogressoption")
        }

        parentView?.isUserInteractionEnabled = nvOptions.userInteractionEnabled
    }

    private func setActivityIndicatorOption() {
        guard let nvOptions = options as? NVProgressHUDOptions else {
            fatalError("Options not nvprogressoption")
        }

        activityIndicator = NVActivityIndicatorView(frame: nvOptions.frame, type: nvOptions.type, color: nvOptions.color)
        activityIndicator.layer.cornerRadius = 3
        activityIndicator.clipsToBounds = true
    }

    private func initTransparentView(withFrame frame: CGRect = .zero) {
        transparentView = UIView(frame: frame)
        transparentView?.backgroundColor = UIColor.animationBackground
    }

    private func setActivityIndicatorCenterPoint() {
        let centerX = (parentView?.bounds.width)! / 2.0
        let centerY = (parentView?.bounds.height)! / 2.0
        activityIndicator.center = CGPoint(x: centerX, y: centerY)
    }

}
