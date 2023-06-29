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
    var time: Date
    
    var body: some View {
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
                    Text(time, style: .time)
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
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color("CardBorderColor"), lineWidth: 2))
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("CardBackgroundColor"))
        )
    }
}

struct TaskCardView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCardView(taskTitle: "Dar banho na carol", taskDescription: "Ela ta muito sujinha", petName: "Carol", time: .now)
    }
}
