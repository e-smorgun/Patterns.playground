
class ApiManager {
    func getUserData() -> UserData {
        // Сделаем вид, что данные грузятся из сети
    }
}

class CacheManager {
    private var cachedUserData: UserData?
    
    func getCachedUserData() -> UserData? {
        return cachedUserData
    }
    
    func setCachedUserData(_ userData: UserData) {
        cachedUserData = userData
    }
}

class UserManager {
    private let apiManager: ApiManager
    private let cacheManager: CacheManager
    
    init() {
        apiManager = ApiManager()
        cacheManager = CacheManager()
    }
    
    func getUserData() -> UserData {
        if let cachedData = cacheManager.getCachedUserData() {
            return cachedData
        } else {
            let newUserData = apiManager.getUserData()
            cacheManager.setCachedUserData(newUserData)
            return newUserData
        }
    }
}
