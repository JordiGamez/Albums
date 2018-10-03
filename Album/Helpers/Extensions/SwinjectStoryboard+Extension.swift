import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

extension SwinjectStoryboard {
    @objc class func setup() {
        
        // MARK: - ViewControllers
        
        defaultContainer.storyboardInitCompleted(AlbumsViewController.self) { resolver, controller in
            controller.presenter = resolver ~> AlbumsPresenterProtocol.self
        }
        
        // MARK: - Presenters
        
        defaultContainer.autoregister(AlbumsPresenterProtocol.self, initializer: AlbumsPresenter.init)
        
        // MARK: - UseCases
        
        defaultContainer.register(LoadAlbumsUseCaseProtocol.self) { resolver in
            LoadAlbumsUseCase(provider: resolver.resolve(AlbumsProviderProtocol.self)!)
        }
        
        // MARK: - Providers
        
        defaultContainer.autoregister(AlbumsProviderProtocol.self, initializer: AlbumsProvider.init)
        
        // MARK: - DataSources
        
        defaultContainer.autoregister(RemoteDataSourceProtocol.self, initializer: RemoteDataSource.init)
        
        // MARK: - Clients
        
        defaultContainer.register(ClientProtocol.self) { resolver in
            Client()
        }
        defaultContainer.register(ApiClientProtocol.self) { resolver in
            ApiClient(client: resolver.resolve(ClientProtocol.self)!)
        }
    }
}