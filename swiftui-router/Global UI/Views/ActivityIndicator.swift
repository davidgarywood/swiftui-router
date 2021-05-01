//
//  ActivityIndicator.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//


import SwiftUI
import UIKit

//  via: https://github.com/programmingwithswift/SwiftUI-Activity-Indicator from @devwithswift

struct ActivityIndicator: UIViewRepresentable {
    @Binding var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
