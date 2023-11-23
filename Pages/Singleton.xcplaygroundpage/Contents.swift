class Sun {
    static let shared = Sun()
    
    private init() {

    }
    
    func rise() {
        print("Восход!!!!")
    }
    
    func set() {
        print("Закат?????")
    }
    
    func shine() {
        print("Свечу...")
    }
}

// Использование:
Sun.shared.rise()
Sun.shared.shine()
Sun.shared.set()
