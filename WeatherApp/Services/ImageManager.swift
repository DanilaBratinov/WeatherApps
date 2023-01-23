import UIKit

final class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func setImage(with title: String?, imageView: UIImageView) {
        func set(color: String) {
            imageView.image = UIImage(systemName: color)
        }
        
        guard let text = title else { return }
        
        switch text {
        case "пасмурно":
            set(color: "cloud.fill")
        case "ясно":
            set(color: "sun.min.fill")
        case "небольшая облачность", "облачно с прояснениями":
            set(color: "cloud")
        case "небольшой снег":
            set(color: "cloud.snow")
        case "дождь":
            set(color: "cloud.rain")
        default:
            set(color: "xamrk")
        }
        
        imageView.tintColor = UIColor.white
    }
}
