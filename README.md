# ddip-iOS
🍎 솝커톤 7조 아요 띱!!! 🍎

# 띱!
### 내 주변 사람들과 무엇이든 무료로 나눌 수 있는, 아나바다를 위한 서비스 
" 나눔은 즐거움이다 " : 일상속의 나눔을 어렸을 적 하던 "딥!" 과 같은 재미 요소로 풀어냄으로써
나누는 사람에게는 처리하기 곤란한, 나누고 싶은 물건을 빠르게 나눌 수 있는 편리함을, 
나눔을 받는 사람에게는 생활에 필요한 여러 물건들을 무료로 제공받을 수 있는 기회를 제공.

## 역할 분담
   |김인환|배은서|신윤아|
|:------:|:---:|:---:|
|`DDip Detail`<br>|`DDip Create`<br>|`DDip List`<br>|
|딥 상세보기 뷰 구현| 딥 생성 뷰 구현 |딥 메인 뷰 구현, 서버 연결|


## Code Convention
   - 함수

     ```swift
       func setupLayout() {
     
       } 
       
     // lowerCamelCase 사용하고 동사로 시작
     ```

   - 변수

     ```swift
     var members = 13
       
     // lowerCamelCase 사용
     ```

   - 상수

     ```swift
     let developers: [String] = ["인환", "은서", "윤아"]
       
     // lowerCamelCase 사용
     ```

   - 클래스

     ```swift
       class HomeVC {
     
       }
     
       // UpperCamelCase 사용
     ```

   - 파일명
   
        - ViewController -> VC

        - TableViewCell -> TVC

        - CollectionViewCell -> CVC

   - 메서드

     - **설정 관련 메서드**는 `setup`  으로 시작

       ```swift
       func setupNavigationBar() {
       
       }
       
       func configUI() {
       	
       }
       ```

   ### **기타규칙**

   - `self`는 최대한 사용을 **지양**

   - `viewDidLoad()` `viewwillAppear()` `viewwillDisappear`에서는 함수호출만

     - delegate 지정, UI관련 설정 등등 모두 함수로

   - 함수는 `extension` `Util`에 정의하고 정리

     - `extension`은 목적에 따라 분류

   - Component는 꼭 빼야하는 것만 생성

   

   ### **빈 줄**

   - 빈 줄에는 공백이 포함되지 않도록 합니다.

   - 모든 파일은 빈 줄로 끝나도록 합니다.

   - MARK 구문 위와 아래에는 공백이 필요합니다.

     ```swift
     // MARK: Layout
     
     override func layoutSubviews() {
       // doSomething()
     }
     
     // MARK: Actions
     
     override func menuButtonDidTap() {
       // doSomething()
     }
     ```

   ### **임포트**

   모듈 임포트는 알파벳 순으로 정렬합니다. 내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.

   ```swift
   import UIKit
   
   import SwiftyColor
   import SwiftyImage
   import Then
   import URLNavigator
   ```

## git 사용 전략

   1. git branch 전략

      ```
      1. Commit, Push, Merge, Pull Request 등 모든 작업은 앱이 정상적으로 실행되는 지 확인 후 수행한다.
      ```

      ```
      main
      feature/10-DDip-detail
      ```

      ➡️ Branch를 생성하기 전 Issue를 먼저 작성한다. Issue 작성 후 생성되는 번호와 Issue의 간략한 설명 등을 조합하여 Branch의 이름을 결정한다. ```<Prefix>/<Issue_Number>-<Description>``` 의 양식을 따른다

   2. issue naming rule

      ```
      [FEAT] 회원가입 구현
      [DEBUG] MainActivity 버그 수정
      [STYLE] 폰트 변경
      ```

      ➡️ ``` [PREFIX] Description```의 양식을 준수하되, Prefix는 협업하며 맞춰가기로 한다. 또한 Prefix는 대문자를 사용한다.

   3. **git commit message**

      ```[ADD] 새로운 VC 생성(#1)```

      - [FIX] : 버그, 오류 해결
      - [CHORE] : 코드 수정, 내부 파일 수정
      - [CORRECT] : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
      - [ADD] : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 View 생성
      - [FEAT] : 새로운 기능 구현
      - [DEL] : 쓸모없는 코드 삭제
      - [DOCS] : README나 WIKI 등의 문서 개정
      - [MOD] : storyboard 파일만 수정한 경우
      - [MOVE] : 프로젝트 내 파일이나 코드의 이동
      - [RENAME] : 파일 이름 변경이 있을 때 사용합니다.
      - [STYLE] , [UI] : 디자인 변경 → issue naming rule

      ```
      [접두어] 내용(#이슈번호)<br>
      세부내용<br>
      각주<br>
      ```

   5. **git flow**

      ```
      1. Issue를 생성한다.
      2. feature Branch를 생성한다.
      3. Add - Commit - Push - Pull Request 의 과정을 거친다.
      5. Pull Request 작성자가 Main Branch로 merge 한다.
      6. 종료된 Issue와 Pull Request의 Label과 Project를 관리한다.
      ```

      - `main` : 개발이 완료된 산출물이 저장될 공간
      - `feature` : 기능을 개발하는 브랜치, 이슈별/작업별로 브랜치를 생성하여 기능을 개발한다

## **프로젝트 폴더링**

      DDip-iOS 
        │
        |── Network
        │   │── Manager 
        │   │── Model
        │   │── APIService 
        │   └── Foundation
        |── Source
        │   |── Literal
        │   |── Util
        │   |── Protocol
        │   |── Extensions
        │   |── Components
        │   |── Cells
        │	|── ViewControllers
        │   └── Supports
        │	        |── AppDelegate.swift
        │           └── SceneDelegate.swift
        └── Resource
                |── Views
                |	 |── Storyboards
                │    |       └── LaunchScreen.storyboard
                |	 └── Xibs
                |── Assets.xcassets
                └── Info.plist
