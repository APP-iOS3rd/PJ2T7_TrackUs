import Foundation
import SwiftUI
import Lottie
// SwiftUI에서 사용하기 위헤 UIKit을 import해주세요
import UIKit

// 로티 애니메이션 뷰
struct LottieView:UIViewRepresentable{
    var name : String
    var loopMode: LottieLoopMode
    
    // 간단하게 View로 JSON 파일 이름으로 애니메이션을 실행합니다.
    init(jsonName: String = "", loopMode : LottieLoopMode = .loop){
        self.name = jsonName
        self.loopMode = loopMode
    }

}
