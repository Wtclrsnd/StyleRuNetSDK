import Foundation

// configuration for URLSession
public enum SRNCachePolicy: String {
    // кэширование
    case useProtocolCachePolicy = "useProtocolCachePolicy"

}

public enum SRNRequestCachePolicy {
    case useProtocolCachePolicy
    case reloadIgnoringLocalCacheData

    var urlRequestCachePolicy: URLRequest.CachePolicy {
        switch self {
        case .useProtocolCachePolicy:
            return .useProtocolCachePolicy
        case .reloadIgnoringLocalCacheData:
            return .reloadIgnoringLocalCacheData
        }
    }
}

public class SRNSessionConfig {
    
    var cachePolicy: SRNCachePolicy = .useProtocolCachePolicy
    var requestCachePolicy: SRNRequestCachePolicy = .reloadIgnoringLocalCacheData
    
    public init() {}
    
    public static func defaultConfig() -> SRNSessionConfig {
        return SRNSessionConfig()
    }
    
    // convert SRNSessionConfig to URLSessionConfiguration
    func toURLSessionConfiguration() -> URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = self.requestCachePolicy.urlRequestCachePolicy
        return config
    }
}
