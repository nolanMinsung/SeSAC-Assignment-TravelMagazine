//
//  Game369Manager.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/14/25.
//

enum Game369Error: Error {
    case inputNotANumber
    case inputNotInteger
    case inputOutOfRange
}

struct Game369Manager {
    
    func validateInputText(_ text: String) throws -> Int {
        let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard Double.init(trimmedText) != nil else {
            throw Game369Error.inputNotANumber
        }
        guard !trimmedText.contains("."), let intValue = Int(trimmedText) else {
            throw Game369Error.inputNotInteger
        }
        guard 0 < intValue && intValue <= 10000 else {
            throw Game369Error.inputOutOfRange
        }
        return intValue
    }
    
    func show369Numbers(maxNumber: Int) -> (String, Int) {
        var clapCount: Int = 0
        let fullNumbers = (1...maxNumber)
        // 개선 필요.
        // map을 사용하면 큰 수가 들어올 때 성능 저하가 발생하는 것을 확인.
        // 현재는 임시로 10000까지만 입력받도록 제한함.
        let returnValue = fullNumbers.map { number in
            let (convertingResult, newClapCount) = convertTextToClapEmojiString(number)
            clapCount += newClapCount
            return convertingResult
        }
        let textViewResult = returnValue.reduce("") { partialResult, newValue in
            partialResult + ", " + newValue
        }
        return (textViewResult, clapCount)
    }
    
    
    /// - Note: convertTextToClapEmojiString 버전 1 - Swift 내장 함수를 최대한 활용하는 방법.
    /// - 장점: 가독성 좋음
    /// - 단점; 3, 6, 9의 수를 세는 것과 이모지를 바꾸는 동작을 두 번 반복함. 숫자가 커질 경우 문자열 전체를 순회하는 동작이 필요 이상으로 많아질 것 같음..?
    
    /// 특정 숫자를 박수가 포함된 문자열로 변환하는 함수.
    /// - Parameter number: 변환할 숫자
    /// - Returns: 변환된 문자열과, 박수 이모지로 변환된 횟수를 튜플로 묶어서 반환.
//    func convertTextToClapEmojiString(_ number: Int) -> (String, Int) {
//        let numberInString = String(number)
//
//        let count3 = numberInString.count { $0 == "3" }
//        let count6 = numberInString.count { $0 == "6" }
//        let count9 = numberInString.count { $0 == "9" }
//
//        let convertedString = numberInString
//            .replacingOccurrences(of: "3", with: "👏")
//            .replacingOccurrences(of: "6", with: "👏")
//            .replacingOccurrences(of: "9", with: "👏")
//
//        return (convertedString, (count3 + count6 + count9))
//    }
    
    
    
    /// - Note: convertTextToClapEmojiString 버전 2 - 문자열을 직접 순회하는 방법.
    /// - 장점: 한 번만 순회함.
    /// - 단점: 버전 1에 비해 비교적 가독성이 떨어짐.
    
    /// 특정 숫자를 박수가 포함된 문자열로 변환하는 함수.
    /// - Parameter number: 변환할 숫자
    /// - Returns: 변환된 문자열과, 박수 이모지로 변환된 횟수를 튜플로 묶어서 반환.
    func convertTextToClapEmojiString(_ number: Int) -> (String, Int) {
        var clapCount = 0
        var numberInString = String(number)
        
        let startIndex = numberInString.startIndex
        for i in 0..<numberInString.count {
            let index = numberInString.index(startIndex, offsetBy: i)
            let char = numberInString[index]
            if ["3", "6", "9"].contains(char) {
                clapCount += 1
                numberInString.replaceSubrange(index...index, with: "👏")
            }
        }
        return (numberInString, clapCount)
    }
    
}
