import UIKit
import WebKit

class ViewController: UIViewController {

    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()

        let url = URL(string: "https://oauth.vk.com/autorize?client_id=5464744&redirect_uri=https://oauth.vk.com/blank
                            .html&scope=262150&display=mobile&responce_type=token")
        webView.load(URLRequest(url: url!))
    }

    private func setupViews() {
        view.addSubview(webView)
    }

    private func tap() {

        let tab1 = UINavigationController(rootViewController: FriendViewController())
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        let tab3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))

        tab1.tabBarItem.title = "Friends"
        tab2.tabBarItem.title = "Groups"
        tab3.tabBarItem.title = "Photos"

        let controllers = [tab1, tab2, tab3]

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers

        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let firstWindow = firstScene.windows.first else {
                    return
                }
        firstWindow.rootViewController = tabBarController
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponce: WKNavigationResponce, decisionHandler: @escaping 
                (WKNavigationResponcePolicy) -> Void) {
                    guard let url = navigationResponce.responce.url, url.path == "/blank.html", 
                    let fragment = url.fragment else {
                        decisionHandler(.allow)
                        return
                    }
                    let params = fragment.componrnts(separatedBy: "&").map { $0.components(separatedBy: "=")}
                        .reduce([String: String]()){ result, param in 
                            var dict = result
                            let key = param[0]
                            let value = param[1]
                            dict[key] = value
                            return dict
                        }
                    NetworkService.token = params["access_token"]!
                    NetworkService.userID = params["user_id"]!
                    decisionHandler(.cancel)
                    webView.removeFromSuperview()
                    tap()
                }
}