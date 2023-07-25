//
//  TasksListView.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 28/06/23.
//

import SwiftUI

struct TasksListView: View {
    
    @StateObject var tasksListViewModel = TasksListViewModel()
    @State private var showCreateTask = false
    @State var showCalendar = false
    let columns = [GridItem()]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    CardCuriosityView()
                        .padding(.top)
                    
                    VStack {
                        if showCalendar && !showCreateTask {
                            CalendarGraphView(startDate: $tasksListViewModel.selectedDate, updateEvents: tasksListViewModel.getDatesWithTaskInMonth)
                                .cornerRadius(12)
                        } else {
                            CalendarInline(selectedDate: $tasksListViewModel.selectedDate)
                        }
                    }
                    .animation(.easeInOut, value: showCalendar)
                    
                    Text("Tarefas pendentes")
                        .font(FontManager.poppinsBold(size: 20))
                        .foregroundColor(Color("PrimaryText"))
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(tasksListViewModel.unfinishedTasks, id: \.id) { task in
                            NavigationLink {
                                TaskDetailsView(task: task) {
                                    tasksListViewModel.updateList()
                                }
                                .onDisappear {
                                    tasksListViewModel.updateList()
                                }
                            } label: {
                                TaskCardView(
                                    task: task,
                                    time: tasksListViewModel.timeFormatter(task: task)
                                )
                            }
                        }
                    }
                    if !tasksListViewModel.showToDoTasks {
                        EmptyToDoList(showCreateTask: showCreateTask) { tasksListViewModel.updateList() }
                            .onAppear {
                                tasksListViewModel.updateList()
                            }
                    }
                    if tasksListViewModel.showCompletedTasks {
                        CompletedToDoList(tasksListViewModel: tasksListViewModel)
                    }
                }
                .padding(.horizontal)
            }
            .frame(width: UIScreen.main.bounds.width)
            .background(Color("BackgroundColor"))
            .navBarTask(action: {
                showCreateTask.toggle()
            }, showCalendar: $showCalendar)
            .sheet(isPresented: $showCreateTask, content: {
                CreateTaskView()
            })
        }
        .onChange(of: showCreateTask, perform: { _ in
            tasksListViewModel.updateList()
        })
        .onChange(of: tasksListViewModel.selectedDate, perform: { _ in
            tasksListViewModel.updateList()
        })
        .onAppear(perform: {
            tasksListViewModel.updateList()
        })
        .environmentObject(tasksListViewModel)
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TasksListViewModel()
        return VStack {
            TasksListView(tasksListViewModel: viewModel)
        }
    }
}
