//
//  CreateTaskView.swift
//  LoveMyCapibara
//
//  Created by Ravi on 28/06/23.
//

import SwiftUI

struct CreateTaskView: View {
    
    @StateObject var viewModel = CreateTaskViewModel()
    @ObservedObject var taskFormViewModel = CreateTaskViewModel()
    
    var body: some View {
        FormCreateTask()
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
    }
}

struct FormCreateTask: View {
    
    @EnvironmentObject var viewModel: CreateTaskViewModel
    
    var body: some View {
        Text("")
    }
}
