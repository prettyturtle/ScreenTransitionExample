#  화면 전환 & Life Cycle


- ViewController에서 다른 ViewController를 호출하여 화면 전환하기(present, 기존 ViewController 위에 새로운 ViewController를 덮는 방식)
    - present : 보여주기
    - dismiss : 돌아가기
- NavigationController를 사용하여 화면 전환하기(계층적인 성격을 띄는 구조를 관리하기 위해 사용)
    - **stack** 구조(LIFO : Last-In, First-Out)로 ViewController를 쌓아 올려 최상위 ViewController를 보여준다
    - push : ViewController 쌓기 (스택에 추가)
    - pop : ViewController 빼기 (스택에서 삭제)


### 특징
- navigationController에 **push**한 것만 왼쪽 스와이프를 통해 이전 화면으로 넘어갈 수 있다
- **present**한 것은 왼쪽 스와이프를 통해 이전 화면으로 넘어갈 수 없다(직접 구현해야함)

## Segue를 이용한 방법

### segue로 push
- storyboard에서 버튼을 오른쪽 마우스로 드래그하고
- 보여주고 싶은 뷰 컨트롤러에 가져가 놓는다
- Show를 선택한다(용도에 맞게 다른 것으로 설정하자)

### segue로 present
- storyboard에서 버튼을 오른쪽 마우스로 드래그하고
- 보여주고 싶은 뷰 컨트롤러에 가져가 놓는다
- Present Modally를 선택한다
- fullscreen으로 보여주고 싶으면
- 연결된 선을 선택하여 Presentation 속성을 변경

### tapBackButton
- pop

``` swift
@IBAction func tapBackButton(_ sender: UIButton) {

    self.navigationController?.popViewController(animated: true) // 이전 화면으로 가기
    self.navigationController?.popToRootViewController(animated: true) // 루트 뷰로 가기

}
```

- dismiss

``` swift
@IBAction func tapBackButton(_ sender: UIButton) {
    self.presentingViewController?.dismiss(animated: true, completion: nil)
}
```


## 코드를 이용한 방법

- `class ViewController: UIViewController {`**이 안에 작성**`}`
- 가고 싶은 뷰컨트롤러를 인스턴스화 한다(`self.storyboard?.instantiateViewController(identifier: Storyboard ID)`)
    - 가고 싶은 뷰컨트롤러의 Storyboard ID를 지정하고
    - 그것을 `identifier` 속성에 적어준다
    - Optional이므로 guard 문으로 풀어준다
    

### 코드로 push

``` swift
@IBAction func tapCodePushButton(_ sender: UIButton) {

    guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") else { return }
    self.navigationController?.pushViewController(viewController, animated: true)
    
}
```

### 코드로 present
``` swift
@IBAction func tapCodePresentButton(_ sender: UIButton) {

    guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") else { return }
    viewController.modalPresentationStyle = .fullScreen // fullScreen 으로 보여주고 싶다면
    self.present(viewController, animated: true, completion: nil)
    
}
```

### tapBackButton
- pop

``` swift
@IBAction func tapBackButton(_ sender: UIButton) {

    self.navigationController?.popViewController(animated: true) // 이전 화면으로 가기
    self.navigationController?.popToRootViewController(animated: true) // 루트 뷰로 가기

}
```

- dismiss

``` swift
@IBAction func tapBackButton(_ sender: UIButton) {
    self.presentingViewController?.dismiss(animated: true, completion: nil)
}
```


---


## Life Cycle

- `viewDidLoad`
    - 뷰가 로드 되었다
    - 뷰 컨트롤러의 모든 뷰들이 메모리에 로드됐을 때 호출
    - 메모리에 처음 로드될 때 한 번만 호출
    - 뷰에 대한 초기화, 네트워크 호출 등 딱 한번 호출될 행위들을 이 메소드 안에 정의
- `viewWillAppear`
    - 뷰가 나타날 것이다
    - 뷰가 스택(뷰 계층)에 추가 되고, 화면에 보이기 **직전**에 매번 호출
    - 다른 뷰로 이동했다가 돌아오면 재호출
    - 뷰와 관련된 추가적인 초기화 작업
- `viewDidAppear`
    - 뷰가 나타났다
    - 뷰 컨트롤러의 뷰가 스택에 **추가된 후** 호출됩니다.
    - 뷰를 나타낼 때. 필요한 추가 작업
    - 애니메이션을 시작하는 작업
- `viewWillDisappear`
    - 뷰가 사라질 것이다
    - 뷰 컨트롤러의 뷰가 스택에서 **사라지기 전**에 호출됩니다.
    - 뷰가 생성된 뒤 작업한 내용을 되돌리는 작업
    - 최종적으로 데이터를 저장하는 작업
- `viewDidDisappear`
    - 뷰가 사라졌다
    - 뷰 컨트롤러의 뷰가 스택에서 **사라진 뒤**에 호출
    - 뷰가 사라지는 것과 관련된 추가 작업

### 코드로 확인하기

- 루트 뷰 컨트롤러와 이동할 뷰 컨트롤러에 아래와 같이 코드를 작성하고
- 화면을 전환하면서 print된 것을 확인한다

- root View Controller

``` swift
override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad가 실행되었다")
}
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear가 실행되었다")
}
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear가 실행되었다")
}
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillDisapper가 실행되었다")
}
override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("viewDidDisapper가 실행되었다")
}
```

- 이동할 View Controller

``` swift
override func viewDidLoad() {
    super.viewDidLoad()
    print("SeguePushViewController에서 viewDidLoad가 실행되었다")
}
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("SeguePushViewController에서 viewWillAppear가 실행되었다")
}
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("SeguePushViewController에서 viewDidAppear가 실행되었다")
}
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("SeguePushViewController에서 viewWillDisapper가 실행되었다")
}
override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("SeguePushViewController에서 viewDidDisapper가 실행되었다")
}
```
