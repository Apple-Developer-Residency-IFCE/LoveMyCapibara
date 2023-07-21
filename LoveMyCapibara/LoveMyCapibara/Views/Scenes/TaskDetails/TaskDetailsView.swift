//
//  TaskDetailsView.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 27/06/23.
//

import SwiftUI

struct TaskDetailsView: View {
    @StateObject var viewModel: TaskDetailsViewModel
    @Environment(\.dismiss) private var dismiss
    var action: () -> Void
    
    init(task: TaskModel, action: @escaping () -> Void ) {
        self._viewModel = StateObject(wrappedValue: TaskDetailsViewModel(task: task))
        self.action = action
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let data = viewModel.task.pet?.imageName, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.25)
                        .clipped()
                }
                
                Group {
                    HStack {
                        Text(viewModel.task.title ?? "")
                            .font(FontManager.poppinsBold(size: 28))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Group {
                        HStack {
                            Image("Icon Pet _ Filled2")
                            Text(viewModel.task.pet?.name ?? "")
                        }
                        
                        HStack {
                            Image("Icon Calendar_Outline")
                            Text(viewModel.dateFormatted)
                        }
                        
                        HStack {
                            Image("Icon Clock_Outline")
                            Text(viewModel.timeFormatted)
                        }
                        
                        HStack {
                            Image("Icon Alarm _ Filled")
                            Text(viewModel.task.frequency?.rawValue ?? "")
                        }
                    }
                    .padding(.top, 8)
                    
                    Text(viewModel.task.text ?? "")
                        .padding(.vertical, 24)
                    if viewModel.task.completed == false {
                        CustomButton(buttonLabel: "Marcar como concluída", buttonAction: {
                            viewModel.completeTask()
                            action()
                            dismiss()
                        }, buttonColor: "DarkColor")
                    } else {
                        CustomButton(buttonLabel: "Marcar como não concluída", buttonAction: {
                            viewModel.uncompleteTask()
                            action()
                            dismiss()
                        }, buttonColor: "DarkColor")
                    }
                }
                .padding(.horizontal, 24)
                .font(FontManager.poppinsRegular(size: 16))
                
                Spacer()
            }
            .navBarViewInfoTask(title: viewModel.task.type?.rawValue ?? "") {
                EditTaskView(taskInstance: viewModel.task, onDelete: { dismiss() })
            } action: {
                viewModel.updateTask()
            }
        }.background(Color("BackgroundColor"))
    }
}

struct TaskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsView(task: TaskModel()) { }
    }
}
