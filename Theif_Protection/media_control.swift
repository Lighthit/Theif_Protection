import Foundation
import AVFoundation
import Combine
import CoreLocation

class media_control: NSObject, ObservableObject {
    @Published var Distances: String?
    var gps = GPS_module()
    private var cancellables = Set<AnyCancellable>()

    // พิกัดอ้างอิง (คุณสามารถเปลี่ยนเป็นที่อยู่ของคุณได้)
    private let referenceLocation = CLLocation(latitude: 13.7563, longitude: 100.5018) // กรุงเทพฯ

    override init() {
        super.init()
        observeLocation()
    }
    
    //MARK: Distance calculation
    private func observeLocation() {
        gps.$currentLocation
            .compactMap { $0 } // เอาเฉพาะค่าที่ไม่เป็น nil
            .sink { [weak self] location in
                let distance = location.distance(from: self?.referenceLocation ?? location) // fallback เผื่อ reference เป็น nil
                self?.Distances = String(format: "%.2f", distance) // ระยะทางเป็นเมตร
                print("📡 Updated Distance: \(self?.Distances ?? "-") meters")
            }
            .store(in: &cancellables)
    }
}
