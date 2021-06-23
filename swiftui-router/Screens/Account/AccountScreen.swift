//
//  AccountScreen.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import SwiftUI

protocol AccountScreenRouter: AnyObject {
    func accountScreenProfileScreen() -> ProfileScreen
}

struct AccountScreen: View {
    @State var router: AccountScreenRouter
    
    @StateObject var viewModel: AccountScreenViewModel
    
    var body: some View {
        VStack {
            List {
                NavigationLink(destination: self.router.accountScreenProfileScreen()) {
                    Text("User Profile")
                }
            }.listStyle(PlainListStyle())
            
            Button {
                self.viewModel.logout()
            } label: {
                Text("Log out")
            }
        }
        .padding()
    }
}

struct AccountScreenPreviews: PreviewProvider {
    static var previews: some View {
        AccountScreen(router: AccountRouter(services: MockServices()), viewModel: AccountScreenViewModel(services: MockServices()))
    }
}
