//
//  Font+Extension.swift
//  Buzzy
//
//  Created by 김정원 on 9/24/24.
//

import Foundation
import SwiftUI

extension Font {
    /// Bold Fonts
    static var bold24: Font {
        return Font.custom("Pretendard-Bold", size: 24)
    }
    static var bold20: Font {
        return Font.custom("Pretendard-Bold", size: 20)
    }
    static var bold16: Font {
        return Font.custom("Pretendard-Bold", size: 16)
    }

    /// SemiBold Fonts
    static var semibold24: Font {
        return Font.custom("Pretendard-SemiBold", size: 24)
    }
    static var semibold20: Font {
        return Font.custom("Pretendard-SemiBold", size: 20)
    }
    static var semibold16: Font {
        return Font.custom("Pretendard-SemiBold", size: 16)
    }
    static var semibold12: Font {
        return Font.custom("Pretendard-SemiBold", size: 12)
    }
    static var semibold8: Font {
        return Font.custom("Pretendard-SemiBold", size: 8)
    }

    /// Regular Fonts
    static var regular24: Font {
        return Font.custom("Pretendard-Regular", size: 24)
    }
    static var regular20: Font {
        return Font.custom("Pretendard-Regular", size: 20)
    }
    static var regular16: Font {
        return Font.custom("Pretendard-Regular", size: 16)
    }
    static var regular12: Font {
        return Font.custom("Pretendard-Regular", size: 12)
    }
    static var regular10: Font {
        return Font.custom("Pretendard-Regular", size: 10)
    }
}
