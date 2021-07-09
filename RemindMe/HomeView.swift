//
//  HomeView.swift
//  RemindMe
//
//  Created by Vicky Xiang on 6/17/21.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
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
    var eventName: TextField<Text>
    var eventDateAndTime: Date
        
    var body: some View {
        VStack {
            eventName
            Text(eventDateAndTime, style: .time)
        }
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
//        Path { path in
//            let width: CGFloat = 20.0
//            let height = width
//            path.move(to: CGPoint(
//                        x: width * 0.50,
//                        y: height * 0.75))
//        }
//        .fill(Color.blue)
        Text("Test Sketch")
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewLayout(.device)
            .previewDevice("Apple Watch Series 6 - 40mm")
    }
}
