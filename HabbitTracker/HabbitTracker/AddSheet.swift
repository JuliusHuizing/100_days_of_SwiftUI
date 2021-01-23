//
//  AddSheet.swift
//  HabbitTracker
//
//  Created by Julius Huizing on 21/01/2021.
//

import SwiftUI

struct AddSheet: View {
    @Environment(\.presentationMode) var presentationMode
    var habbits: Habbits
    @State private var activityName = ""
    @State private var motivation = ""
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Activity Name:")
                        .font(.headline)
                    TextField("Activity", text: $activityName)
                    }
                Section {
                    Text("Motivation:")
                    TextField("Motivation", text: $motivation)
                }
                
                Button("Add Activity") {
                    let activity = Habbit(name: activityName, motivation: motivation)
                    habbits.habbits.append(activity)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }.navigationTitle("Habbit Adder")
        }
    }
}

struct AddSheet_Previews: PreviewProvider {
    static var habbits = Habbits()
    static var previews: some View {
        AddSheet(habbits: habbits)
    }
}
