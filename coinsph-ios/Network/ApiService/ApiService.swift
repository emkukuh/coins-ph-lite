import Alamofire
import ObjectMapper

class ApiService<T: Mappable> {
        func request(
            path: String,
            httpMethod: HTTPMethod,
            completion: @escaping (T) -> Void,
            errorHandler: @escaping (ResponseError) -> Void
        ) {
            let urlString = NetworkConstant.baseUrlString + path
            AF.request(urlString, method: httpMethod).response { response in
                do {
                    guard let statusCode = response.response?.statusCode else {
                        errorHandler(ResponseError())
                        return
                    }
                    if let error = self.errorChecker(statusCode: statusCode) {
                        var responseError = ResponseError()
                        responseError.code = statusCode.toString
                        responseError.message = error
                        errorHandler(responseError)
                        return
                    }
                    guard let jsonDict = try JSONSerialization
                        .jsonObject(with: response.data ?? Data(), options: []) as? [String: Any]
                    else {
                        var responseError = ResponseError()
                        responseError.message = "error convert json"
                        errorHandler(responseError)
                        return
                    }
                    guard let mapper = Mapper<T>().map(JSON: jsonDict) else {
                        var responseError = ResponseError()
                        responseError.message = "error mapping"
                        errorHandler(responseError)
                        return
                    }
                    completion(mapper)
                } catch {
                    var responseError = ResponseError()
                    responseError.message = error.localizedDescription
                    errorHandler(responseError)
                }
            }
        }

    private func errorChecker(statusCode: Int) -> String? {
        switch statusCode {
        case 401:
            return NetworkError.authenticationError.localizedDescription
        case 500:
            return NetworkError.badRequest.localizedDescription
        case 400...500:
            return NetworkError.failed.localizedDescription
        default:
            return nil
        }
    }
}
