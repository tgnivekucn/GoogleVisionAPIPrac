//
//  VisionAPIManager.swift
//  GoogleVisionAPIPrac
//
//  Created by 粘光裕 on 2023/11/1.
//

import Foundation
/*
Google cloud vision api for image search:
https://cloud.google.com/vision/docs/detecting-web
https://cloud.google.com/vision/docs/reference/rest
*/
class VisionAPIManager {
    static var shared = VisionAPIManager()
    private var googleCloudKey: String? {
        return getCloudKey()
    }

    // MARK: - Web detection
    func webDetection(imageData: Data) {
        guard let googleCloudKey = googleCloudKey else { return }

        let requestParams = WebDetectionParams(requests: [
            WebDetectionParams.Request(
                features: [
                    WebDetectionParams.Request.Feature(type: "WEB_DETECTION")
                ],
                image: WebDetectionParams.Request.Image(
                    source: nil,
                    content: imageData.base64EncodedString()
                ),
                imageContext: WebDetectionParams.Request.ImageContext(
                    webDetectionParams: WebDetectionParams.Request.ImageContext.WebDetectionParams(includeGeoResults: true)
                )
            )
        ])

        let url = URL(string: "https://vision.googleapis.com/v1/images:annotate?key=\(googleCloudKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Encode your request parameters to JSON
        do {
            let jsonData = try JSONEncoder().encode(requestParams)
            request.httpBody = jsonData
        } catch {
            print("Error encoding JSON: \(error)")
        }

        // Perform the request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle errors
            if let error = error {
                print("Error making POST request: \(error.localizedDescription)")
                return
            }

            // Handle the response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response or status code")
                return
            }

            // Parse the response data
            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let responseData = try JSONDecoder().decode(WebDetectionResponseStruct.self, from: data)
                // Use the parsed data
                print("Response result: \(responseData)")
            } catch {
                print("Error decoding JSON response: \(error)")
            }
        }

        // Start the task
        task.resume()
    }

    func webDetection(urlString: String) {
        guard let googleCloudKey = googleCloudKey else { return }

        let requestParams = WebDetectionParams(requests: [
            WebDetectionParams.Request(
                features: [
                    WebDetectionParams.Request.Feature(type: "WEB_DETECTION")
                ],
                image: WebDetectionParams.Request.Image(
                    source: WebDetectionParams.Request.Image.Source(imageUri: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Taipei_Arena_20230529.jpg/2880px-Taipei_Arena_20230529.jpg"), content: nil
                ),
                imageContext: WebDetectionParams.Request.ImageContext(
                    webDetectionParams: WebDetectionParams.Request.ImageContext.WebDetectionParams(includeGeoResults: true)
                )
            )
        ])

        let url = URL(string: "https://vision.googleapis.com/v1/images:annotate?key=\(googleCloudKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Encode your request parameters to JSON
        do {
            let jsonData = try JSONEncoder().encode(requestParams)
            request.httpBody = jsonData
        } catch {
            print("Error encoding JSON: \(error)")
        }

        // Perform the request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle errors
            if let error = error {
                print("Error making POST request: \(error.localizedDescription)")
                return
            }

            // Handle the response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response or status code")
                return
            }

            // Parse the response data
            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let responseData = try JSONDecoder().decode(WebDetectionResponseStruct.self, from: data)
                // Use the parsed data
                print("Response result: \(responseData)")
            } catch {
                print("Error decoding JSON response: \(error)")
            }
        }

        // Start the task
        task.resume()
    }
    
    // MARK: - Landmark detection
    func landmarkDetection(imageData: Data) {
        guard let googleCloudKey = googleCloudKey else { return }
        guard let url = URL(string: "https://vision.googleapis.com/v1/images:annotate?key=\(googleCloudKey)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Encode your request parameters to JSON
        let requestParams = LandmarkParams(requests:
                                LandmarkParams.WebDetectionParameterRequests(
                                    image: LandmarkParams.WebDetectionParameterImage(source: nil, content: imageData.base64EncodedString()),
                                            features: [LandmarkParams.WebDetectionParameterFeature(type: "LANDMARK_DETECTION", maxResults: 1)]
                                )
                            )

        do {
            let jsonData = try JSONEncoder().encode(requestParams)
            request.httpBody = jsonData
        } catch {
            print("Error encoding JSON: \(error)")
        }
        // Perform the request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle errors
            if let error = error {
                print("Error making POST request: \(error.localizedDescription)")
                return
            }

            // Handle the response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response or status code")
                return
            }

            // Parse the response data
            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let responseData = try JSONDecoder().decode(LandmarkDetectionResponseStruct.self, from: data)
                // Use the parsed data
                print("Response result: \(responseData)")
            } catch {
                print("Error decoding JSON response: \(error)")
            }
        }

        // Start the task
        task.resume()
    }

    func landmarkDetection(urlString: String) {
        guard let googleCloudKey = googleCloudKey else { return }
        guard let url = URL(string: "https://vision.googleapis.com/v1/images:annotate?key=\(googleCloudKey)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Encode your request parameters to JSON
        let requestParams = LandmarkParams(requests:
                                LandmarkParams.WebDetectionParameterRequests(
                                    image: LandmarkParams.WebDetectionParameterImage(source: LandmarkParams.Source(imageURI: urlString), content: nil),
                                    features: [LandmarkParams.WebDetectionParameterFeature(type: "LANDMARK_DETECTION", maxResults: 1)]
                                )
                            )

        do {
            let jsonData = try JSONEncoder().encode(requestParams)
            request.httpBody = jsonData
        } catch {
            print("Error encoding JSON: \(error)")
        }

        // Perform the request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle errors
            if let error = error {
                print("Error making POST request: \(error.localizedDescription)")
                return
            }

            // Handle the response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response or status code")
                return
            }

            // Parse the response data
            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let responseData = try JSONDecoder().decode(LandmarkDetectionResponseStruct.self, from: data)
                // Use the parsed data
                print("Response result: \(responseData)")
            } catch {
                print("Error decoding JSON response: \(error)")
            }
        }

        // Start the task
        task.resume()
    }

    // MARK: Utilities
    private func getCloudKey() -> String? {
        // Define the name of your custom plist file
        let plistFileName = "googleCloudKey"

        // Access the main bundle to find the path for your plist
        if let path = Bundle.main.path(forResource: plistFileName, ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {

            // Now you can access values from the dictionary
            // Replace "YourKey" with the actual key you're interested in
            if let value = dict["googleCloudKey"] as? String {
                print(value)
                return value
            } else {
                print("Key not found.")
            }
        } else {
            print("Unable to locate \(plistFileName).plist file or it's not a Dictionary.")
        }
        return nil
    }
}
