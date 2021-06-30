//
//  HomeView.swift
//  RemindMe
//
//  Created by Vicky Xiang on 6/17/21.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView{
            NavigationView{
                VStack {
                    NavigationLink(
                        destination: EventView(),
                        label: {
                            Text("Events")
                        })
                    NavigationLink(
                        destination: IdeaView(),
                        label: {
                            Text("Ideas")
                        })
                    NavigationLink(
                        destination: NoteView(),
                        label: {
                            Text("Notes")
                        })
                    NavigationLink(
                        destination: SketchView(),
                        label: {
                            Text("Sketches")
                        })
                }
            }
        }
    }
}

struct DetailView: View {
    var eventName: String
    var eventDateAndTime: Date
        
    var body: some View {
        VStack {
            Text(eventName)
            Text(eventDateAndTime, style: .time)
        }
    }
}

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
    
    func createNewEvent(name: String, time: Date) -> Event{
        let newEvent = Event(name: name, time: time)
        return newEvent
    }
}


struct IdeaView: View {
    var body: some View {
        // TODO: Change this to table view
        Text("Ideas")
    }
}

struct NoteView: View {
    var body: some View {
        // TODO: Change this to table view
        Text("Notes")
    }
}

struct SketchView: View {
    var body: some View {
        Path { path in
            let width: CGFloat = 20.0
            let height = width
            path.move(to: CGPoint(
                        x: width * 0.50,
                        y: height * 0.75))
        }
        .fill(Color.blue)
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewLayout(.device)
            .previewDevice("Apple Watch Series 6 - 40mm")
    }
}
