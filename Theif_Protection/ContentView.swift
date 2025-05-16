import SwiftUI

struct ContentView: View {
    @StateObject var gps = GPS_module()
    @State private var TextSelection:String = "Select Distance Alert"
    @State var DistanceSelection:Float = 1
    @State private var navigate = false  // 👈 state สำหรับควบคุมการนำทาง
    @State var CurrentLat:String = ""
    @State var CurrentLong:String = ""
    var body: some View {
        /*
         VStack(spacing: 10) {
         if let loc = gps.currentLocation {
         Text("Lat: \(loc.coordinate.latitude)")
         Text("Lon: \(loc.coordinate.longitude)")
         } else {
         Text("กำลังหาตำแหน่ง...")
         }
         
         if let distance = media.Distances {
         Text("📏 Distance: \(distance) meters") // 👈 แสดงระยะทาง
         } else {
         Text("⏳ คำนวณระยะทาง...")
         }
         }
         .padding()
         */
        NavigationStack {  // ✅ ครอบด้วย NavigationStack
            VStack(spacing: 10) {
                // >>>> Button action to main
                Button(action:{
                    navigate = true
                    if let loc = gps.currentLocation {
                        CurrentLat = String(loc.coordinate.latitude)
                        CurrentLong = String(loc.coordinate.longitude)
                    }
                    print(navigate)
                }) {
                    Image("ButtonIcon")
                        .resizable()
                        .frame(width: 100 , height: 100)
                }
                // <<<< Button action to main
                
                // >>>> Dropdown menu ต่อจากปุ่ม
                Menu {
                    Button("2 meter") {
                        TextSelection = "2 meter"
                        DistanceSelection = 2.0
                    }
                    Button("1.5 meter") {
                        TextSelection = "1.5 meter"
                        DistanceSelection = 1.5
                    }
                    Button("1 meter") {
                        TextSelection = "1 meter"
                        DistanceSelection = 1.0
                    }
                } label: {
                    Text(TextSelection)
                        .padding()
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(8)
                }
                // <<<< Dropdown menu
            }
            .padding()
            .navigationDestination(isPresented: $navigate) {
                MainControlView(
                    CurLat: CurrentLat,
                    CurLong: CurrentLong,
                    Distance: DistanceSelection
                    
                )
                    
            }
        }
    }
}

#Preview {
    ContentView()
}
