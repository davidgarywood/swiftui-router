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
    @StateObject var viewModel: LoginScreenViewModel = LoginScreenViewModel()
    
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
                ProgressView()
            }
        }
        .padding()
        .navigationTitle("Login somewhere")
    }
}

struct LoginScreenViewPreviews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
