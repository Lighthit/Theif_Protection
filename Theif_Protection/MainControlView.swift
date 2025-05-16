import SwiftUI

struct MainControlView: View {
    var CurLat: String
    var CurLong: String
    var Distance: Float

    var body: some View {
        VStack {
            Text("Latitude: \(CurLat)")
            Text("Longitude: \(CurLong)")
            Text("Selected Distance: \(Distance, specifier: "%.1f") m")
        }
        .padding()
    }
}

#Preview {
    // ใส่ตัวอย่างค่าทดสอบให้ครบตามที่ MainControlView ต้องการ
    MainControlView(
        CurLat: "NaN",
        CurLong: "Nan",
        Distance: 0.001
    )
}
