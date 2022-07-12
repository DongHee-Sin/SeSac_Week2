import UIKit

let rawString1 = "안녕하세요 평범한 문자열입니다. 쌍따옴표를 입력하려면 백슬래시를 앞에 붙여줘야 돼요. \" \""
print(rawString1)
// 안녕하세요 평범한 문자열입니다. 쌍따옴표를 입력하려면 백슬래시를 앞에 붙여줘야 돼요. " "


let rawString2 = #"이건 RawString입니다. 샾을 앞뒤로 붙여주면 문자열을 있는 그대로 표현할 수 있어요. \\\ 백슬래시도 그냥 넣구요 """"쌍따옴표도 그냥 넣어요"#
print(rawString2)
// 이건 RawString입니다. 샾을 앞뒤로 붙여주면 문자열을 있는 그대로 표현할 수 있어요. \\\ 백슬래시도 그냥 넣구요 """"쌍따옴표도 그냥 넣어요


let rawString3 = #"RawString에서는 \n같은 줄바꿈 기호도 문자 그대로 인식하기 때문에 샾을 붙여줘야 사용할 수 있어요. \#n이렇게요"#
print(rawString3)
// RawString에서는 \n같은 줄바꿈 기호도 문자 그대로 인식하기 때문에 샾을 붙여줘야 사용할 수 있어요.
// 이렇게요


let someString = "맥북"
let rawString4 = #"RawString에서의 문자열 보간법도 샾을 붙여줘야 사용할 수 있어요. 저는 신형 m2 \#(someString)이 가지고 싶습니다."#
print(rawString4)
// RawString에서의 문자열 보간법도 샾을 붙여줘야 사용할 수 있어요. 저는 신형 m2 맥북이 가지고 싶습니다.
