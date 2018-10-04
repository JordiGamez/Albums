import Foundation
import SystemConfiguration

/// Responsible for the network status
class NetworkProvider {
    
    init() {}
}

// MARK: - NetworkProviderProtocol protocol conformance

extension NetworkProvider: NetworkProviderProtocol {
    
    /// Check if device has Internet connection
    ///
    /// - Returns: True if has connection, false otherwise
    func hasInternetConnection() -> Bool {

        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let toReturn = (isReachable && !needsConnection)
        
        return toReturn
    }
}
