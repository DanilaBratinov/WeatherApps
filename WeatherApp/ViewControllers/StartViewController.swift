import UIKit
import CoreLocation

final class StartViewController: UICollectionViewController {
    private var cities: [Cities] = []
    private var timer: Timer?
    
    private let locationManager = CLLocationManager()
    private let refreshControl = UIRefreshControl()
        
    //    MARK: - ViewDidLoad
    override func viewDidLoad() {
        startLocationManager()
        autoUpdate()
        setupRefreshController()
        
        title = CalendarManager.shared.getWeekday()
    }

    //    MARK: - UICollectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StartViewCell
        let city = cities[indexPath.item]
        
        cell.configure(with: city)
        
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.2
        
        cell.backgroundColor = UIColor(named: "cellColor")
        
        return cell
    }

//    MARK: - Private methods
    private func setupRefreshController() {
        collectionView.alwaysBounceVertical = true
        refreshControl.addTarget(self, action: #selector(refreshWeather), for: .valueChanged)
        collectionView.addSubview(refreshControl)
        collectionView.refreshControl = refreshControl
    }
    
    private func autoUpdate() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(refreshWeather), userInfo: nil, repeats: false)
        title = CalendarManager.shared.getWeekday()
    }
    
    //  MARK: - upToRefresh
    @objc private func refreshWeather() {
        collectionView.refreshControl?.beginRefreshing()
        
        cities.removeAll()
        
        for link in NetworkManager.shared.links {
            self.updateWeather(with: link)
            self.refreshControl.endRefreshing()
        }
    }
    
    
    //MARK: - SearchButton
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
        showSearchAlert(placeholder: "Город:") {[weak self] text in
            let url = "https://api.openweathermap.org/data/2.5/weather?q=\(text.trimmingCharacters(in: .whitespaces))&appid=28ede8c4626bcba101f47c928f53f1b9&units=metric&lang=ru"
            NetworkManager.shared.links.append(url)
            self?.updateWeather(with: url)
            self?.collectionView.reloadData()
        }
    }
}

extension StartViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Int(UIScreen.main.bounds.width) - 48, height: 75)
    }
}

//MARK: - JSONParse
extension StartViewController {
    private func updateWeather(with url: String) {
        NetworkManager.shared.fetch(Weather.self, from: url) { [weak self] result in
            switch result {
            case .success(let weatherData):
                self?.cities.append(
                    Cities(
                        name: weatherData.name,
                        temperature: weatherData.main.temp,
                        description: weatherData.weather.first?.description ?? "",
                        tempMin: weatherData.main.tempMin,
                        tempMax: weatherData.main.tempMax,
                        lat: weatherData.coord.lat,
                        lon: weatherData.coord.lon)
                )
                
                self?.collectionView.reloadData()
            case .failure(let error):
                NetworkManager.shared.links.removeLast()
                print(error)
            }
        }
    }
}

//MARK: - CLLocation
extension StartViewController: CLLocationManagerDelegate {
    private func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
                self.locationManager.pausesLocationUpdatesAutomatically = false
                self.locationManager.startUpdatingLocation()
            }
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocations = locations.last {
            let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(lastLocations.coordinate.latitude)&lon=\(lastLocations.coordinate.longitude)&lang=ru&appid=28ede8c4626bcba101f47c928f53f1b9&units=metric"
            
            for link in NetworkManager.shared.links {
                if url != link {
                    NetworkManager.shared.links.remove(at: 0)
                    NetworkManager.shared.links.insert(url, at: 0)
                    
                    updateWeather(with: link)
                }
            }
        }
    }
}

//MARK: - UIAlertController
extension StartViewController {
    private func showSearchAlert(placeholder: String, completion: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "Добавление города", message: "Введите название города", preferredStyle: .alert)
        let searchAction = UIAlertAction(title: "Найти", style: .default) { _ in
            let textField = alert.textFields?.first
            guard let text = textField?.text else { return }
            completion(text)
        }
        
        let closeAction = UIAlertAction(title: "Закрыть", style: .destructive)
        alert.addAction(searchAction)
        alert.addAction(closeAction)
        alert.addTextField { textField in
            textField.placeholder = placeholder
        }
        
        present(alert, animated: true)
    }
}
