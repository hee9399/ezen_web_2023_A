package java2.day23.Ex3;

public class Calculator {

	// 필드
	private int momory;
	// 생성자
	// 메소드

	public int getMomory() {return momory;}
	// public void setMomory1(int memory) { // 메소드
	public synchronized void setMomory1(int memory) { // 동기화 메소드 : 해당메소드를 여럿 스레드가 호출시 대기상태 
		
		// 1. 매개변수를 들어온 값을 필드에저장 [ setter ]
		this.momory = momory;
		
		// 2. 현재 스레드를 2초간 일시정지
		try {Thread.sleep(2000);} catch (Exception e) {} 
		
		// 3. 2초 후 필드 값 확인
		System.out.println(Thread.currentThread().getName() +"요청한 2초 후 저장된 메모리 : " +this.momory );
		
	}
	
	// 2. 메소드내 특징 블록에서만 동기화 하는 방법
	public void setMemory2(int memory) {
		
		System.out.println("비동기화 구역");
		
		synchronized (this) { // 현재 객체 생성 
		System.out.println("동기화 구역");
		this.momory = momory;
		
		try {Thread.sleep(2000);} catch (Exception e) {} 
		
		System.out.println(Thread.currentThread().getName() +"요청한 2초 후 저장된 메모리 : " +this.momory );
	  }
	}
	
}
