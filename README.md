# InternetProgramming
인프 프로젝트용

BUSAN STORE 쇼핑몰

큰 틀(배치 글꼴 스타일)은 템플릿받아왔고
내가 알아서 내부를 거의 다 뜯어고침
----------------------------------------------------------------------
스타일:부트스트랩
자바스크립트: 회원가입시 항목채크 하는데 사용, 로그인 회원가입창 modal로 띄우는데 사용
사용 데이터베이스:오라클
데이터베이스 종류:사용자정보DB / 상품정보DB / 장바구니DB / 게시판DB / 

MVC 패턴을 사용하여 get/post 요청에 유연하게 처리가능
각 DB는 각각의 Servlet, VO, DVO 를 거쳐감

JQuery 사용하여 상품의 하위항목 테그버튼을 누르면 해당 항목만 띄우는 기능을 넣음

-----------------------------------------------------------------------
회원가입
로그인
로그아웃
내정보

카테고리
카테고리 하위카테고리 상품정보
장바구니
결재창
게시판(공지사항/Q&A)







인터넷 프로그래밍 프로젝트
한지훈 , 곽정훈


혹시나 사이트를 실행하실지도 모르기 때문에 매뉴얼을 써봤습니다. 
1. 압축파일을 이클립스로 성공적으로 보내기 – 제일중요
2. 데이터 베이스 테이블+시퀀스 생성
3. 데이터 베이스에 CSV파일 불러오기
4. Server.xml에 커넥션 풀 설정
5. 게시판 데이터베이스 아이디/비번 수정

1번 과정은 경로가 매우 중요하기 때문에 (서블릿, 자바스크립트, css 파일, 이미지가 있어서)
	
2번 과정은 밑으로 쭉 내리면 테이블 생성 코드 복사 붙여넣기 하시면 되고
3번은 폴더에 있는 설명서를 참고
4번 Server.xml 들어가셔서 맨 아래부분
<Context docBase="Store" path="/Store" reloadable="true" source="org.eclipse.jst.jee.server:Store"/> 

이부분을

<Context docBase="Store" path="/Store" reloadable="true" source="org.eclipse.jst.jee.server:Store"><Resource auth="Container" driverClassName="oracle.jdbc.OracleDriver" maxIdle="10" maxTotal="20" maxWaitMillis="-1" name="jdbc/myoracle" password="dkanrjsk123" type="javax.sql.DataSource" url="jdbc:oracle:thin:@127.0.0.1:1521:XE" username="hun2ya9"/></Context>

로 수정해주시고 아이디 비밀번호를 알아서 바꿔주시고

5. jsp페이지 중에 따로 데이터베이스 아이디/비번 적어놓은부분이 있는데
	현재 scott/tiger 로 되어있는거 바꿀거면 알아서 바꿔야합니다.


DB는 오라클 사용 -------------------------------------------------------------

DB 테이블 이름  설명			쓰이는곳
member		사용자 정보		로그인 / 화원가입 / 내정보
store 		옷 정보			카테고리 / 옷정보 / 장바구니
cart 		장바구니 정보		장바구니 / 주문 / 결제 
board1		게시판 정보		게시판
+
DB 시퀀스 
board1_seq	게시판 번호 부여		게시판 

테이블 생성 – sqlplus 명령창에서 이대로 복사 붙여넣기 하시면 됩니다.

사용자 정보 테이블
create table member(name varchar2(30), userid varchar(30) not null, pwd varchar(30), email varchar2(40), phone char(40), admin number(1), age varchar2(20)); 

옷 정보 테이블
create table store(num varchar2(20), name varchar2(30), siz varchar2(30), maintype varchar2(30), subtype varchar2(30), color varchar2(20), cost number(10), gender varchar2(10), season varchar2(10), best number(2), new number(2) );

장바구니 테이블
create table cart(userid varchar2(50) not null, num varchar2(50) not null, name varchar2(100) not null, siz varchar2(50) not null, maintype varchar2(50) not null, subtype varchar2(50) not null, color varchar2(50) not null, cost number(20) not null, amount number(20) not null);

게시판 테이블
create table board1(num number(38,0) not null, username varchar2(20) not null, password varchar2(20) not null, title varchar2(20) not null, memo varchar2(20) not null, time date not null, hit number, ref number, indent number, step number, step2 number );

게시판 시퀀스
create sequence board1_seq increment by 1 start with 1 MINVALUE 1;






사용 자바빈			함께 사용한 DB 테이블	     사용 되는 페이지 (.jsp)
-----------------------------------------------------------------------------
MemberVO - 사용자 정보	member 테이블과 함께사용 | login,join,myPage
InfoVO - 옷 정보		store 테이블과 함께사용    | Category,info,cart
ScartVO - 장바구니		cart 테이블과 함께사용     | cart,Order,payment

-----------------------------------------------------------------------------

Main.jsp - 메인페이지 , BEST,NEW 상품을 보여줌 
	
이 페이지에서 페이지 실행하셔야 합니다.
(이클립스에서 서버 실행할 때)
이유는 MVC 패턴으로 만들어진 웹페이지이 이기 때문이고
Main.jsp와 다른 페이지들이 Servlet으로 연결되어 있기 때문에
다른 jsp 페이지들은 실제로 jsp 파일로 바로 연결되는 것이 아니고 서블릿 거치게 됩니다. -> (사용자들은 jsp파일의 경로를 알 수 없음)
따라서 다른 jsp 페이지에서 실행하시면 오류가 납니다!!!!!!!!!!!!!!! 
-> 따라서 Main 페이지 혹은 서블릿(.java 페이지)에서 실행하면 실행됩니다.
-----------------------------------------------------------------------------

Side.jsp - 좌측 매뉴바, 모든 페이지에 include page로 붙어있음
이곳에 부트스트랩, css파일 링크를 걸어두어 모든 페이지에서 적용할 수있도록 하였음

세션을 통해 로그인 여부를 확인하여
로그인시 : logout, mypage, board가 카테고리
미 로그인시 : login, join
그와 상관없이는 홈 버튼과 옷 카테고리가 보임


login, join은 부트스트랩 modal을 사용하여 구현

로그인 버튼 누르면
LoginServlet.java 파일로 넘어가게된다. 
(우리 프로젝트에서는 URL Mapping 을 /Login.do로 해놨음
URL 맵핑을 하면 /Login.do(내가 임의로 정한 url)을 입력해도 /LoginServlet(원래 url 페이지 내용)이 보이게 됨)

get방식으로 요청하면 Main페이지로 돌아감 - 비정상적으로 접근한 경우임
post방식으로 요청하면 - 우리가 form에서 post방식으로 넘겼으므로 무조건 이쪽으로 오게됨
1.입력한 아이디 비밀번호를 가져옴
2. MemberDAO.java 파일에서 미리 싱글톤 패턴으로 만들어둔 객체를 가져옴
MemberDAO mDAO = MemberDAO.getInstance();

3.DB에 아이디,비밀번호가 일치하는 사용자가 있는지 찾아보는 메소드 호출
mDAO.userCheck(userid, pwd); 
반환값은 int형이다.
1이면: 성공
0이면 : 비밀번호 없거나 틀린경우 
-1이면: 아이디 없거나 틀린경우

1인 경우에는 로그인 성공이니 세션에 아이디 추가


4. 반환값에 따라 메시지를 실어서 Main페이지로 보냄 - 처리하는곳은 Side.jsp에서 처리함

request.setAttribute("message", "0"); 이런식으로 실어서 보내는거임
int message = request.getAttribute("message"); 받을때는 이렇게 받고
0을 받으면 - 비밀번호가 틀렸다는 메시지와 로그인창 다시띄움
-1을 받으면 - 존재하지 않는 회원이라는 메시지와 로그인창 다시띄움

회원가입 버튼을 누르면
자바스크립트 파일로 넘어가 아이디,비밀번호,비밀번호확인,이름 항목이 비어있는지 간단한 체크를하고
JoinServlet.java 로 넘겨준다.

로그인과 마찬가지로
Get방식 - 비정상적 접근 Main으로 돌려보냄
Post방식 - 
1.입력한 아이디 비밀번호 이름....을 가져옴
2. MemberDAO.java 파일에서 미리 싱글톤 패턴으로 만들어둔 객체를 가져옴
MemberDAO mDAO = MemberDAO.getInstance();

3.DB에 아이디가 똑같은 사용자가 있는지 채크하는 메소드 호출
mDAO.getMember(request.getParameter("userid"))

겹치는 아이디가 있으면 message값 0을 주어 이미 존재하는 아이디입니다 라는 메시지호출
겹치는 아이디 없으면 자바빈 객체를 생성
MemberVO mVo = new MemberVO();
mVo.setUserid(request.getParameter("userid"));
mVo.setPwd(request.getParameter("pwd"));
mVo.setName(request.getParameter("name"));

이런식으로 받아온 값들을 하나씩 set으로 집어넣고
마지막에 자바빈 객체를 DB에 저장하는 메소드 호출한다.
mDAO.insertMember(mVo);
성공시 -1값을 반환하여 message로 넘겨줌

4. Side.jsp에서 message값을 확인
-1이면 회원가입 성공 메시지
0이면 이미 존재하는 아이디라는 메시지와 회원가입창 다시 띄움

---------------------------------------------------------------------------
Category

매뉴바에서 Category 접근시
<a href="Category.do?type=OUTER">OUTER</a>
<a href="Category.do?type=BEST">BEST</a>
이런식으로 쿼리스트링에type값을 넘겨줌

1.CategoryServlet 에서 위의 type값을 받는다.
2.type이 null이면 비정상적 접근으로 Main페이지로 보냄
  그게 아니면 해당 타입값을 가진 옷을 db에서 모두 찾는 메소드호출
  iDAO.getType(type);
  반환값은 ArrayList<InfoVO>형으로 객체가 담긴 리스트임
 
  객체와 type값을 Category.jsp 페이지로 넘겨준다.

3.받아온 type은 Best와 New를 보여줄때 쓰이고
  받아온 list 크기만큼 반복하여 모든 옷을 화면에 보여준다.
  이때 각 list의 subtype (하위카테고리)값으로 테그를 붙여서
 
 페이지 우측상단에서 하위 카테고리를 버튼을 눌렀을때 그 카테고리만 보이도록
  (Outer에서 - Coat와 Padding 에서 Coat누르면 Coat만 보이도록)
  이 기능은 JQuery를 사용하였음



----------------------------------------------------------------------------
Info

상품 정보 페이지

Category.jsp에서 상품 이미지를 클릭시 아래처럼 InfoServlet로 상품 고유번호를 넘겨줌
<a href="Info.do?number=<%=list.get(i).getNum()%>"><상품 이미지></a>

그러면 InfoServlet로 넘어감
request.getParameter("number") 해서 방금 넘긴 상품고유번호를 가져오는데
만약에 없다 => 비정상적 접근 = Main.jsp로 넘겨줌
있다 => 상품이름으로 DB검색해서 객체형태로 info.jsp로 보내줌


info.jsp 여기서는 옵션 선택과 페이지 넘기는게 중요
옵션 : 색상+사이즈 / 수량 2가지로 나뉨
수량 조절버튼은 자바스크립트로 처리

버튼은 장바구니 / 즉시구매 
두 가지 버튼이 있다. 둘다 post 방식으로 CartServlet으로 보내짐
즉시구매 버튼 누르면 direct라는 가상의 값을 넘겨주어
direct값이 존재할때 payment.jsp (= 구매창)으로 넘어가게 유도

장바구니를 누르면 선택한 옷과 옵션의 정보를 장바구니 DB에 저장하고 cart.jsp로 넘겨준다.

-----------------------------------------------------------
cart

장바구니로의 접근은 3가지 방식이 있다.
1. 로그인 안하고 비정상적인 접근 - Get => Main.jsp로 (예를들면 로그인 안하고 주소창에 그냥 Store/Cart.do 이런식으로 접근한경우)
2. 로그인한 상태에서 매뉴바로 접근 - Get => 사용자 아이디로 장바구니 db 검색하여
				     모든 내용을 cart.jsp로

3. 상품을 장바구니에 담았을경우 - Post => 상품을 db에 넣고 사용자 아이디로 장바구니 db 검색하여 모든 내용을 cart.jsp로
 + info.jsp에서 상품 즉시구매시 - Post => payment.jsp로 유도


cart.jsp에서는 두가지 버튼
비우기 / 구매 버튼이 있다.

채크박스를 상품 하나마다 (for문 안에)
<input type="checkbox" name="ck" value=<%=list.get(i).getNum()%>>선택
이런식으로 달아놓고

PayServlet에서
String[] data = request.getParameterValues("ck"); 이렇게 받는다.
이렇게하면 ck라는 동일한 이름으로 들어있는 다양한 데이터를 배열형태로 받아올수있음

비우기 선택시 자바스크립트로 delete라는 가상의 값을 넘겨주어서
db에서 삭제하고 response.sendRedirect("Cart.do"); 로 리다이렉트로 넘어가게 하였다.
(forward로 넘기게 되면 뒤로가기 시 에러발생 - 리다이렉트로 완전히 새로운 창을 넘어가게 해서 이전 페이지를 버린거임)

구매 선택시 payment.jsp로 넘어간다.

------------------------------------------------------------
payment

payment.jsp 에서는 장바구니에서 선택한 옷 정보만 보여줌 ( 5개 중에 2개 선택했으면 2개만 보여주는거임)

보내는 사람 받는사람 주소 .. 이런거 입력 자바스크립트로 현재는 입력했는지 안했는지만 체크해서

OrderServlet으로 보낸다.

여기서 장바구니 DB에 있던 상품을 없앤다음에 주문완료 페이지(Order.jsp)로 넘겨줌

------------------------------------------------------------------------
Order
일단은 금액만 출력하는걸로









------------------------------------------------------------------------
게시판

게시판은 웹사이트를 분업해서 만들었기 때문에 위의 내용과는 완전히 독립적임
글쓰기 write
수정 modify
목록 list
글 보기 view
삭제 delete

수정과 삭제는 modal 사용하였고
오라클 시퀀스 사용하여 글 목록에서 글쓰면 번호가 자동으로 순서대로 매겨지게 하였음
-------------------------------------------------------------------------

footer.jsp - 페이지 마무리하는 부분임
모든 페이지 하단에 include page로 붙어있음






