//
//  LoginScreen.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import SwiftUI

protocol LoginScreenViewRouter: AnyObject {
}

struct LoginScreen: View {
    @State var router: LoginScreenViewRouter?    
    @StateObject var viewModel: LoginScreenViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Button {
                    self.viewModel.logIn()
                } label: {
                    Text("Login")
                }
                .disabled(self.viewModel.loggingIn)
            }
            
            if self.viewModel.loggingIn {
                ActivityIndicator(shouldAnimate: self.$viewModel.loggingIn)
            }
        }
        .padding()
        .navigationTitle("Login somewhere")
    }
}

struct LoginScreenViewPreviews: PreviewProvider {
    static var previews: some View {
        LoginScreen(viewModel: LoginScreenViewModel(services: MockServices()))
    }
}
