import Foundation

// configuration for URLSession
public enum SRNCachePolicy: String {
    // кэширование
    case useProtocolCachePolicy = "useProtocolCachePolicy"
}

public enum SRNRequestCachePolicy: String {
    case reloadIgnoringLocalCacheData = "reloadIgnoringLocalCacheData"
}


public class SRNSessionConfig { // wrap around URLSessionConfiguration
    
    var cachePolicy: SRNCachePolicy = .useProtocolCachePolicy
    var requestCachePolicy: SRNRequestCachePolicy = .reloadIgnoringLocalCacheData
    
    public init() {}
    
    // default configuration
    public static func defaultConfig() -> SRNSessionConfig {
        return SRNSessionConfig()
    }
    
    // convert SRNSessionConfig to URLSessionConfiguration
    func toURLSessionConfiguration() -> URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        
        config.requestCachePolicy = URLRequest.CachePolicy(rawValue: self.requestCachePolicy.rawValue)!
        
        return config
    }
    
    
}
