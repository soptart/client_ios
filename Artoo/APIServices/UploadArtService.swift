//
//  UploadArtService.swift
//  Artoo
//
//  Created by 보윤 on 11/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//

import Foundation
import Alamofire

struct UploadArtService: APIManager, Requestable{
    
    typealias NetworkData = ResponseArray<ArtWork>
    static let shared = UploadArtService()
    let uploadURL = url("/artworks")
    let header: HTTPHeaders = [
        "Content-Type": "multipart/form-data"
    ]
    
    func upload(a_name: String, a_width: Int, a_height: Int, a_depth: Int, a_category: String,
                a_purchaseState: Int, a_form: String, a_price: Int, a_detail: String, a_year: String, pic_url: UIImage, a_tags: String, a_license: String, completion: @escaping(NetworkData) -> Void){
        
        let uploadHeaders: HTTPHeaders = [
             "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
        ]
        
        // 업로드 함수를 통해 먼저 여러 데이터를 multipart로 인코딩하는 과정을 거치게 됩니다.
        // 아래의 과정으로 텍스트와 이미지 데이터를 Data 타입으로 변환시켜 multipart에 append를 해줍니다.
        Alamofire.upload(multipartFormData: { (multipart) in
            multipart.append(a_name.data(using: .utf8)!, withName: "a_name") //""안에는 서버에서 주는 이름
            multipart.append(String(describing: a_width).data(using: .utf8)!, withName: "a_width")
            multipart.append(String(describing: a_height).data(using: .utf8)!, withName: "a_height")
            multipart.append(String(describing: a_depth).data(using: .utf8)!, withName: "a_depth")
            multipart.append(a_form.data(using: .utf8)!, withName: "a_form")
            multipart.append(a_detail.data(using: .utf8)!, withName: "a_detail")
            multipart.append(a_year.data(using: .utf8)!, withName: "a_year")
             multipart.append(a_category.data(using: .utf8)!, withName: "a_category")
             multipart.append(a_tags.data(using: .utf8)!, withName: "a_tags")
             multipart.append(a_license.data(using: .utf8)!, withName: "a_license")
             multipart.append(String(describing: a_purchaseState).data(using: .utf8)!, withName: "a_purchaseState")
             multipart.append(String(describing: a_price).data(using: .utf8)!, withName: "a_price")
            multipart.append(pic_url.jpegData(compressionQuality: 0.5)!, withName: "pic_url", fileName: "image.jpeg", mimeType: "image/jpeg")
            
        }, to: uploadURL,
           headers: uploadHeaders) { (result) in
            
            //멀티파트로 성공적으로 인코딩 되었다면 success, 아니라면 failure 입니다.
            switch result {
            case .success(let upload, _, _):
                
                // 성공 하였다면 아래의 과정으로 응답 리스폰스에 대한 처리를 합니다.
                // 여기부터는 request 함수와 동일합니다.
                upload.responseObject { (res: DataResponse<ResponseArray<ArtWork>>) in
                    switch res.result {
                    case .success(let value):
                        completion(value)
                    case .failure(let err):
                        print(err)
                    }
                }
                
            case .failure(let err):
                print(err)
            }
        }
    }
    
}

