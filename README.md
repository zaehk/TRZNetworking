# TRZNetworking
Straightforward and easy to use api rest framework.

[![Swift](https://img.shields.io/badge/Swift-5.4-orange)](https://img.shields.io/badge/Swift-5.4-orange)
[![Swift](https://img.shields.io/badge/pod-v1.0.0-blue)](https://img.shields.io/badge/pod-v1.0.0-blue)


## Install

Installing TRZNetworking using cocoapods is possible:

```
pod 'TRZNetworking'
```

## How to create an api call configuration

Dont forget to import:

```
import TRZNetworking
```


You can implement URLRequestConfiguration protocol in an enum for example, so in the same file you can have different api calls that are related (for example api calls regarding a social network posts):

```
enum PostsConfig: URLRequestConfiguration {
    
    case allPosts
    case deletePost(id:String)
    
    var method: APIClientMethod {
        switch self {
        
        case .allPosts:
            return .get
        case .deletePost:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        
        case .allPosts:
            return "https://jsonplaceholder.typicode.com/posts"
        case .deletePost(let id):
            return "https://jsonplaceholder.typicode.com/post/\(id)"
        }
    }
    
}
```

## Launching the actual API call

Once the config of the calls has been filled (using an enum, struct or whatever) now we can launch the actuall call:


```
    private func getPosts(){
        ApiClient.shared.makeRequest(callConfig: PostsConfig.allPosts, responseModel: AllPostsResponseModel.self) { postsRM in
            self.managePosts(posts: postsRM)
        } failure: { apiError in
            print(apiError.localizedDescription)
        }
    }
```

## Response models used to parse

Keep in mind that the response model must be created beforehand and conform to decodable, in this example the model would be:

```
struct PostResponseModel: Decodable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias AllPostsResponseModel = [PostResponseModel]
```
