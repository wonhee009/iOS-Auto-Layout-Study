//
//  Friend.swift
//  AutoLayoutStudy
//
//  Created by Wonhee on 2021/01/09.
//

import Foundation

struct Friend {
    let name: String
    let phone: String
}

let friends: [String : [Friend]] = [
    "ㄱ" : [
        Friend(name: "가가가", phone: "010-1111-1111"),
        Friend(name: "고고고", phone: "010-1111-1111"),
        Friend(name: "규규규", phone: "010-2222-3333")
    ],
    "ㄴ" : [
        Friend(name: "노노노", phone: "010-2222-2222"),
        Friend(name: "누누", phone: "010-2222-2222"),
        Friend(name: "놀놀", phone: "010-2222-2222"),
        Friend(name: "날날날", phone: "010-2222-2222"),
        Friend(name: "낫낫낫", phone: "010-2222-2222"),
        Friend(name: "눈눈", phone: "010-2222-2222"),
        Friend(name: "눅눅눅", phone: "010-2222-2222"),
        Friend(name: "녹녹", phone: "010-2222-2222"),
        Friend(name: "놐녹놐", phone: "010-2222-2222"),
    ],
    "ㄷ" : [
        Friend(name: "다다다", phone: "010-2222-2222"),
        Friend(name: "두두", phone: "010-2222-2222"),
        Friend(name: "돌돌돌", phone: "010-2222-2222"),
        Friend(name: "달달", phone: "010-2222-2222"),
        Friend(name: "닷닷", phone: "010-2222-2222"),
        Friend(name: "둔둔둔", phone: "010-2222-2222"),
        Friend(name: "둑둑둑", phone: "010-2222-2222"),
        Friend(name: "독독", phone: "010-2222-2222"),
        Friend(name: "돗돗", phone: "010-2222-2222"),
    ]
]
