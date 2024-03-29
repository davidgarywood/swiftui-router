//
//  ProfileScreen.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import SwiftUI

protocol ProfileScreenRouter: AnyObject {
}

struct ProfileScreen: View {
    @State var router: ProfileScreenRouter?
    @StateObject var viewModel: ProfileScreenViewModel = ProfileScreenViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Username: \(self.viewModel.userName)")
                Spacer()
            }
            Spacer()
        }
        .padding()        
    }
}

struct ProfileScreenPreviews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
