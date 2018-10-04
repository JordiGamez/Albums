import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

/// Dependency injection
extension SwinjectStoryboard {
    @objc class func setup() {
        
        Container.loggingFunction = nil
        
        // MARK: - ViewControllers
        
        defaultContainer.storyboardInitCompleted(AlbumsViewController.self) { resolver, controller in
            controller.presenter = resolver ~> AlbumsPresenterProtocol.self
        }
        defaultContainer.storyboardInitCompleted(PhotosViewController.self) { resolver, controller in
            controller.presenter = resolver ~> PhotosPresenterProtocol.self
        }
        
        // MARK: - Presenters
        
        defaultContainer.autoregister(AlbumsPresenterProtocol.self, initializer: AlbumsPresenter.init)
        defaultContainer.autoregister(PhotosPresenterProtocol.self, initializer: PhotosPresenter.init)
        
        // MARK: - UseCases
        
        defaultContainer.register(LoadAlbumsUseCaseProtocol.self) { resolver in
            LoadAlbumsUseCase(provider: resolver.resolve(AlbumsProviderProtocol.self)!)
        }
        defaultContainer.register(SaveAlbumsUseCaseProtocol.self) { resolver in
            SaveAlbumsUseCase(provider: resolver.resolve(AlbumsProviderProtocol.self)!)
        }
        defaultContainer.register(LoadPhotosUseCaseProtocol.self) { resolver in
            LoadPhotosUseCase(provider: resolver.resolve(PhotosProviderProtocol.self)!)
        }
        
        // MARK: - Providers
        
        defaultContainer.autoregister(AlbumsProviderProtocol.self, initializer: AlbumsProvider.init)
        defaultContainer.autoregister(NetworkProviderProtocol.self, initializer: NetworkProvider.init)
        defaultContainer.autoregister(PhotosProviderProtocol.self, initializer: PhotosProvider.init)
        
        // MARK: - DataSources
        
        defaultContainer.autoregister(RemoteDataSourceProtocol.self, initializer: RemoteDataSource.init)
        defaultContainer.autoregister(LocalDataSourceProtocol.self, initializer: LocalDataSource.init)
        
        // MARK: - Clients
        
        defaultContainer.register(ClientProtocol.self) { resolver in
            Client()
        }
        defaultContainer.register(ApiClientProtocol.self) { resolver in
            ApiClient(client: resolver.resolve(ClientProtocol.self)!)
        }
    }
}
