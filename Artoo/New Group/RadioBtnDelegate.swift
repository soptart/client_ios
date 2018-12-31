
import Foundation


//delegate : 어떤 객체가 할 일을 일부분적으로 확장해서 대신 처리
//두 가지 : 대신 해줄 객체 <-> 처리하라고 시키는 객체
protocol RadioBtnDelegate {
    
    //테이블 뷰 라디오 버튼 함수
    func selectRadioBtn(at indexPath: IndexPath)
    //컬렉션 뷰 라디오 버튼 함수
    func cvSelectRadio(at indexPath: IndexPath)
}
