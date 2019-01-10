//
//  UploadArtService.swift
//  Artoo
//
//  Created by 보윤 on 09/01/2019.
//  Copyright © 2019 홍정민. All rights reserved.
//



import Foundation
import Alamofire

//struct UploadArtService: APIManager, Requestable{
//    
//    typealias NetworkData = ResponseObject<ArtWork>
//    static let shared = UploadArtService()
//    let uploadURL = url("/artworks")
//    let headers: HTTPHeaders = [
//        "Content-Type" : "multipart/form-data",
//        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? "hi"
//    ]
//    
//    //작품 업로드 api
//    func upload(a_name: String,a_width: Int, a_height: Int, a_depth: Int, a_category: String, a_form: String, a_price: Int, u_idx: Int, a_detail: String, a_date: Date, a_year: String, /*pic_url: MultipartFile,*/ a_tags:String, a_license: String ){
//        
//        Alamofire.upload(multipartFormData: { (multipart) in multipart.append(a_name.data(using: .utf8)!, withName: "a_name")
//            
//            multipart.append(a_width.Int(using: .init)!, withName: "a_width")
//            multipart.append(a_height.data(using: .utf8)!, withName: "a_height")
//            multipart.append(a_depth.data(using: .utf8)!, withName: "a_depth")
//            multipart.append(a_category.data(using: .utf8)!, withName: "a_category")
//            multipart.append(a_form.data(using: .utf8)!, withName: "a_form")
////            multipart.append(a_price.data(using: .utf8)!, withName: "a_price")
//            multipart.append(u_idx.data(using: .utf8)!, withName: "u_idx")
//            multipart.append(a_detail.data(using: .utf8)!, withName: "a_detail")
//            multipart.append(a_date.date(using: .utf8)!, withName: "a_date")
//            multipart.append(a_year.data(using: .utf8)!, withName: "a_year")
//            multipart.append(pic_url.jpegData(compressionQuality: 0.5)!, withName: "pic_url", fileName:"image.jpeg", mimeType: "image/jpeg")
//            multipart.append(a_tags.data(using: .utf8)!, withName: "a_tags")
//            multipart.append(a_license.data(using: .utf8)!, withName: "a_license")
//        }, to: uploadURL, headers: headers){
//            (result) in
            
//            switch result {
//            case .success(let upload, _, _):
//
//                // 성공 하였다면 아래의 과정으로 응답 리스폰스에 대한 처리를 합니다.
//                // 여기부터는 request 함수와 동일합니다.
//                upload.responseObject { (res: DataResponse<ResponseArray<Board>>) in
//                    switch res.result {
//                    case .success:
//                        completion()
//                    case .failure(let err):
//                        print(err)
//                    }
//                }
//
//            case .failure(let err):
//                print(err)
//            }
//        }
//    }
//}

    


