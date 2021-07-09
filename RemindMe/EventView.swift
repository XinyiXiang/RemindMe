//
//  EventView.swift
//  RemindMe
//
//  Created by Vicky Xiang on 7/8/21.
//

import SwiftUI

struct EventView: View {
    @State private var events: [Event] = [
        Event(name: "Math Final", time: Date()),
        Event(name: "French Lesson", time: Date())
    ]
    
    struct Event: Identifiable {
        let id = UUID()
        let name: String
        let time: Date
    }
    
    var body: some View{
        
        ScrollView {
            VStack {
                NavigationView{
                    List{
                        Text("New Event")
                            .toolbar{
                                ToolbarItemGroup(
                                    placement: .automatic,
                                    content:{
                                        Button(
                                            action: {
                                                events.append(createNewEvent(name: "Complete Framework Freestyle", time: Date()))
                                            },
                                            label: {
                                                Text("Create new")
                                                    .background(Color.blue)
                                            })
                                    }
                                 )
                            }

                            ForEach(events) { event in
                                NavigationLink(
                                    destination: DetailView(eventName: event.name, eventDateAndTime: event.time),
                                    label: {
                                        Text(event.name)
                                    })
                            }
                    }
                }
            }
        }
    }
    
    func createNewEvent(name: String, time: Date) -> Event{
        let newEvent = Event(name: name, time: time)
        return newEvent
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
