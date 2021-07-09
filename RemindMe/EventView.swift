//
//  EventView.swift
//  RemindMe
//
//  Created by Vicky Xiang on 7/8/21.
//

import SwiftUI
//import WatchKit

// Add hosting controller
//class HostingController: WKHostingController<EventView> {
//    override var body: EventView {
//        return EventView(hostingController: self)
//    }
//}

struct EventView: View {
    @State private var description: String = ""
    @State private var isEditing: Bool = false
    
    @State private var events: [Event] = [
        
    ]
    struct Event: Identifiable {
        let id = UUID()
        let description: TextField<Text>
        let time: Date
    }
    
    
    //@State private var capturedText = ""
        
    //let hostingController: WKHostingController<Self>
    
    var body: some View{
        
        ScrollView {
            VStack {
                List{
                    Text("New Event")
                        .toolbar{
                            ToolbarItemGroup(
                                placement: .automatic,
                                content:{
                                    Button(
                                        action: {
                                            events.append(createNewEvent(description: TextField(
                                                                                "Description",
                                                                                text: $description
                                                                            ){ isEditing in
                                                                                self.isEditing = isEditing
                                                                            }
                                                                            ,time: Date()))
                                        },
                                        label: {
                                            Text("Create New")
                                                .background(Color.blue)
                                        })
                                }
                             )
                        }

                        ForEach(events) { event in
                            NavigationLink(
                                destination: DetailView(eventName: event.description, eventDateAndTime: event.time),
                                label: {
                                    event.description
                                })
                        }
                }
            }
        }
    }
    
    func createNewEvent(description: TextField<Text>, time: Date) -> Event{
        let newEvent = Event(description: description, time: time)
        return newEvent
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
