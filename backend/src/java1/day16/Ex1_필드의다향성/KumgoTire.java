package java1.day16.Ex1_필드의다향성;

public class KumgoTire extends Tire {

	// 상속받으면 자식클래스에서 부모클래스의 멤버 (맴버 , 생성자 , 메소드) 사용할수 없다.
             
	@Override
	public void roll() { // 
		
		super.roll();
	}
	
}
