//
//  TaskCardView.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 28/06/23.
//

import SwiftUI

struct TaskCardView: View {
    
    var taskTitle: String
    var taskDescription: String
    var petName: String
    var petImage: Data?
    var time: String
    
    @State var offSet: CGFloat = 0.0
    @State var isSwipe: Bool = false
    
    var actionToDelete: () -> Void
    
    init(task: TaskModel, time: String, action: @escaping () -> Void) {
        self.taskTitle = task.title ?? "Sem titulo"
        self.taskDescription = task.text ?? "Sem descrição"
        self.petName = task.pet?.name ?? "Pet"
        self.petImage = task.pet?.imageName
        self.time = time
        self.actionToDelete = action
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: .init(colors: [Color(uiColor: .white), Color.red]), startPoint: .leading, endPoint: .trailing)
            HStack {
                Spacer()
                Button(action: { withAnimation(.easeInOut(duration: 0.3), actionToDelete) },
                       label: {
                    Image(systemName: "trash")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 50)
                })
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(taskTitle)
                        .font(FontManager.poppinsBold(size: 16))
                        .foregroundColor(Color("PrimaryText"))
                    Text(taskDescription)
                        .font(FontManager.poppinsRegular(size: 16))
                        .foregroundColor(Color("PrimaryText"))
                    HStack {
                        Image("ClockIcon")
                        Text(time)
                            .font(FontManager.poppinsRegular(size: 16))
                            .foregroundColor(Color("PrimaryText"))
                    }
                }
                Spacer()
                VStack(spacing: 8) {
                    if let data = petImage, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .clipShape(Circle())
                            .padding(.trailing, 4)
                            .frame(width: 64, height: 64)
                    } else {
                        Circle()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                        
                    }
                    Text(petName)
                        .font(FontManager.poppinsBold(size: 13))
                        .foregroundColor(Color("PrimaryText"))
                }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(Color("CardBorderColor"), lineWidth: 2))
                .offset(x: offSet)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("CardBackgroundColor"))
                    .offset(x: offSet)
            )
            .gesture(DragGesture().onChanged(onChanged).onEnded(onEnd))
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    func onChanged(_ value: DragGesture.Value) {
        
        if value.translation.width < 0 {
            if isSwipe {
                offSet = value.translation.width - 90
            } else {
                offSet = value.translation.width
            }
        }
    }
    
    func onEnd(_ value: DragGesture.Value) {
        
        withAnimation {
            
            if value.translation.width < 0 {
                
                if (-value.translation.width) > (UIScreen.main.bounds.width / 2) {
                    offSet = (-1000)
                    actionToDelete()
                } else if -offSet > 50 {
                    isSwipe = true
                    offSet = (-90)
                } else {
                    isSwipe = false
                    offSet = 0
                }
                
            } else {
                isSwipe = false
                offSet = 0
            }
        }
    }
}

struct TaskCardView_Previews: PreviewProvider {

    static var previews: some View {
        
        TaskCardView(task: TaskModel.mock, time: "18:50", action: {})
    }
}
