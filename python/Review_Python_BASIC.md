
##Review_Python_BASIC

#### Class

1. 기본 클래스의 사용
- 변수와 함수를 묶어놓은 개념
- <b>사용 방법</b>
		*  변수와 함수가 들어있는 클래스를 선언 
		* 클래스를 객체로 만들어서 클래스 안에 안에 선언된 변수와 함수를 사용
	<pre>
	<code> 
	from bs4 import BeautifulSoup  
	dom = BeautifulSoup()
	</code>
	</pre>


2. Class에서의 self : 객체 자신

<pre>
<code>
class Calculator:
	num1 = 1
	num2 = 2
	
	def plus(self):
		return self.num1 + self.num2
	def minus(self):
		return self.num1 - self.num2
</code>
</pre>

<pre>
<code>
calc2 = Calculator()
calc2.num1 = 10
calc2.plus()  
</code>
</pre>

<pre>
<code>
12
</code>
</pre>

- <b>"객체자신"</b> 
	- Class 내에 있는 변수를 받는 Class 내의 함수라고 이해하고 있다. 
		- 변수를 따로 self.num1=4라고 콕 집어 선언해주지 않는 이상 /__init__에 설정된 변수 값으로 default가 설정
		- 설정한 변수의 타입들로 설정해야한다는 규칙
		-  \__init__ 규칙에 따른 변수들이 포함된 함수에서 돌아가는 기능 

		등 을 내포하고 있는 단어인 것 같다.




> Written with [StackEdit](https://stackedit.io/).