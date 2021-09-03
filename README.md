#  화면 전환

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
