//
//  GetFridegeManager.swift
//  sinsungo
//
//  Created by 원동진 on 2024/01/10.
//

import Foundation
// 냉장고 전체 조회
// https://sinsungo.store/api/fridge?page=0&size=0
let token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkb25namluOTciLCJhdXRoIjoiTUVNQkVSIiwiZXhwIjoxNzA1MDQ1MjEyLCJpYXQiOjE3MDUwNDE2MTJ9.ysj9IYpwJiOC4g1qxq-VCDfv2t7E__XGEtkvZdaK5hs"
class GetFridgeManager{
    
    static let shared = GetFridgeManager()
    func getFridgeData(size : Int,completion: @escaping(GetFridgeModel) ->Void){
        guard let url = URL(string: "https://sinsungo.store/api/fridge?page=0&size=\(size)") else {
            print("Error: URL ")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
//        request.setValue("*/*",forHTTPHeaderField: "Accept") // 설정 안해줘도 실행 됨
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // 설정 안해줘도 실행됨
        URLSession(configuration: .default).dataTask(with: request) { data,response,error in
            guard error == nil else{
                print("Error : \(String(describing: error?.localizedDescription))")
                return
            }
            guard let data = data else {
                return
            }
            do{
                let fridge : GetFridgeModel = try JSONDecoder().decode(GetFridgeModel.self, from: data)
                completion(fridge)
            }catch{
                print("Decoding Error : \(String(describing: error.localizedDescription))")
            }
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode)else {
                return
            }
//            print("HTTP Status Code: \(httpResponse.statusCode)")
            
        }.resume()
    }
}
 
