//
//  HomeScreen.swift
//  RouterTest
//
//  Created by David Gary Wood on 1/05/21.
//

import SwiftUI

protocol HomeScreenRouter: AnyObject {
}

struct HomeScreen: View {
    @State var router: HomeScreenRouter?    
    @StateObject var viewModel: HomeScreenViewModel = HomeScreenViewModel()
    
    var body: some View {
        Text("Home")
    }
}

struct HomeScreenPreviews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
