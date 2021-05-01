//___FILEHEADER___

import SwiftUI

protocol ___FILEBASENAMEASIDENTIFIER___Router: AnyObject {
}

struct ___FILEBASENAMEASIDENTIFIER___: View {
    @State var router: ___FILEBASENAMEASIDENTIFIER___Router?
    
    @ObservedObject var viewModel: ___FILEBASENAME___ViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ___FILEBASENAMEASIDENTIFIER___Previews: PreviewProvider {
    static var previews: some View {
        ___FILEBASENAMEASIDENTIFIER___(viewModel: ___FILEBASENAME___ViewModel(services: MockServices()))
    }
}
