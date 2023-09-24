//
//  ViewController.swift
//  NativeAvatarTask
//
//  Created by Andrii's Macbook  on 24.09.2023.
//

import UIKit

final class ViewController: UIViewController {
    var scrollView: UIScrollView!
    var navBarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
        setupScrollView()
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        addImageToNavigationBar()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.delegate = self
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(scrollView)
    }
    
    func addImageToNavigationBar() {
        if let largeTitleView = navigationController?.navigationBar.largeTitleView {
            navBarImageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
            navBarImageView.contentMode = .scaleAspectFit
            navBarImageView.translatesAutoresizingMaskIntoConstraints = false
            navBarImageView.tintColor = .systemGray
            largeTitleView.addSubview(navBarImageView)
            NSLayoutConstraint.activate([
                navBarImageView.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor, constant: -16),
                navBarImageView.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: -12),
                navBarImageView.widthAnchor.constraint(equalToConstant: 36),
                navBarImageView.heightAnchor.constraint(equalToConstant: 36)
            ])
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 50 {
            navigationController?.navigationBar.prefersLargeTitles = false
        } else {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
}

extension UINavigationBar {
    var largeTitleView: UIView? {
        return self.subviews.first { String(describing: type(of: $0)) == "_UINavigationBarLargeTitleView" }
    }
}
