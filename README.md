# SSAC_10_KAKAO_OCR
Kakao Vison API의 OCR을 활용하여 이미지애서 검출되는 문자를 텍스트 정보로 변환해주는 앱

# Requirement
- [Kakao Vison API](https://developers.kakao.com/product/vision)에서  KAKAO APIKEY를 발급받아 APIKEY.plist에 작성해주세요.

# 구현 사항
- [x] 'Request' 버튼을 통해 Kakao Vison API를 호출 후 JSON 형식의 데이터를 받아온다.
- [x] 받아온 데이터를 파싱하여 이미지 속 OCR 정보를 textView에 띄워준다.
- [x] '사진고르기' 버튼을 통해 다른 이미지를 불러올 수 있다.

# 추가 구현 사항
- [x] request 중일 때, 로딩중이라는 표시로  indicator 보여주기
- [ ] request 시간이 너무 길거나, 인식할 수 없는 이미지를 넣었을 때에 대한 error 대처하기

# 실행 영상
<p align="center"><img src="https://user-images.githubusercontent.com/59866819/139678032-db25feb8-1769-4ff8-a2ab-fa638c0b6878.mp4" /></p>
