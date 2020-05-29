//
//  OrientationViewController.swift
//  Euler Demo
//
//  Created by Jack Mousseau on 5/28/20.
//  Copyright © 2020 Jack Mousseau. All rights reserved.
//

import ARKit
import Foundation
import Euler
import RealityKit
import UIKit

public class OrientationViewController : UIViewController {

    private lazy var arView: ARView? = {
        let arView = ARView(frame: .zero)
        arView.session.delegate = self
        return arView
    }()

    private lazy var orientationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .systemYellow
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()

    private let orientationTracker = ELROrientationTracker()

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.translatesAutoresizingMaskIntoConstraints = false
        setUpARView()
        setUpOrientationLabel()

        runConfiguration()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationDidChange(_:)),
            name: .ELROrientationDidChange,
            object: nil
        )
    }

    @objc private func orientationDidChange(_ notification: Notification) {
        guard let orientationRawValue = (notification.object as? NSNumber)?.intValue,
            let orientation = UIInterfaceOrientation(rawValue: orientationRawValue) else {
                return
        }

        orientationLabel.text = string(for: orientation)
    }

    // MARK: - User Interface Setup

    func setUpARView() {
        guard let arView = arView else {
            return
        }

        arView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(arView)

        NSLayoutConstraint.activate([
            arView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            arView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            arView.topAnchor.constraint(equalTo: view.topAnchor),
            arView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func setUpOrientationLabel() {
        orientationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(orientationLabel)

        NSLayoutConstraint.activate([
            orientationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orientationLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            orientationLabel.widthAnchor.constraint(equalToConstant: 240),
            orientationLabel.heightAnchor.constraint(equalToConstant: 80),
        ])
    }

    // MARK: - Session Lifecycle

    private func runConfiguration() {
        arView?.session.run(ARWorldTrackingConfiguration())
    }

    // MARK: - Helpers

    private func string(for orientation: UIInterfaceOrientation) -> String {
        switch orientation {
            case .unknown:
                return "Unknown"

            case .portrait:
                return "Portrait"

            case .landscapeLeft:
                return "Landscape Left"

            case .portraitUpsideDown:
                return "Portrait Upside Down"

            case .landscapeRight:
                return "Landscape Right"

            @unknown default:
                fatalError()
        }
    }

}

// MARK: - AR Session Delegate

extension OrientationViewController: ARSessionDelegate {

    public func session(_ session: ARSession, didUpdate frame: ARFrame) {
        orientationTracker.add(frame)
    }

}
