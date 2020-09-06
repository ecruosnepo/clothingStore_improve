<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" flush="false" />
<jsp:include page="sideNav.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    a{
    color: black;
    }
    section{
       min-height:400px;
    }
    section h1{
        text-align: center;
    }
    #fat{
    }
    #sectionDiv{
       background-color:#fff;
    }
    #sectDiv{
      margin:0 auto;
      max-width:70%;
      margin-bottom:100px;
   }
    select{
       text-align: center;
       float: right;
    }
    .btn{
       float: right;
       margin: 10px;
       width: 100px;
    }

</style>
</head>
<body>
   <section>
      <div id="sectDiv">
         <h1>주문 상세보기</h1><br><br>
         <div id="sectionDiv" data-spy="scroll" data-target="#navbar-example2" data-offset="0">
            <form  action='/admin/adOrderUpdate' method="post" >
             <select id="inputState" name="order_state" class="form-control" style="width: 200px;">
                      <option disabled selected>=== 상품현황 ===</option>
                      <option value="결제완료">결제완료</option>
                      <option value="배송중">배송중</option>
                      <option value="배송완료">배송완료</option>
                      <option value="환불">환불</option>
                      <option value="교환">교환</option>
                </select>
              <h4 id="fat">주문번호 : ${ order.order_id }</h4>
              <input type="hidden" value="${order.order_id }" name="order_id"/>
              <div id="detail">
                 <b>이메일</b><br>
                 <p>${ order.user_email }</p>
                 
                 <b>받는 사람 이름</b><br>
                 <p><input type="text" placeholder="이름" name="dv_name" value="${ order.dv_name}"></p>
                 
                 <b>배송주소</b><br>
                 <input type="text" id="sample6_postcode" placeholder="우편번호" name="dv_address1" value="${ order.dv_address1}">
               <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text" id="sample6_address" placeholder="주소" name="dv_address2" value="${ order.dv_address2}"><br>
               <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="dv_address4" value="${ order.dv_address4}">
               <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="dv_address3" value="${ order.dv_address3}"><br><br>
                 
                 <b>전화번호</b><br>
                 <input type="text" name="dv_phone" placeholder="010-0000-0000" value="${ order.dv_phone }"><br>
                 
                 <b>요청사항</b><br>
                 <p><input type="text" placeholder="요청사항" name="dv_message" value="${ order.dv_message }"></p><br>
                 
                 <b>주문 상품</b><br>
                 <table class="table table-hover" id="qna">
                      <thead>
                         <tr>
                             <th scope="col">상품명</th>
                             <th scope="col">색상</th>
                             <th scope="col" >사이즈</th>
                             <th scope="col" >상품가격</th>
                             <th scope="col">수량</th>
                             <th scope="col">재고</th>
                             <th scope="col">삭제</th>
                         </tr>
                      </thead>
                      <tbody>
                         <c:forEach var="pd" items="${ detail }">
                             <tr class="pd_row">
                                 <td scope="row">
                                    <input type="hidden" name="pd_id" value="${ pd.pd_id }">
                                    ${ pd.pd_name }
                                 </td>
                                 <td>${ pd.pd_color }</td>
                                 <td>
                                    <select name="pd_size" class="form-control" >
                                    <c:forEach var="stock" items="${stockList.get(pd.pd_id)}">
                                       <c:choose>
                                          <c:when test="${ pd.pd_size==stock.pd_size }">
                                             <option value="${ stock.pd_size }" selected>${ stock.pd_size }</option>
                                          </c:when>
                                          <c:otherwise>
                                             <option value="${ stock.pd_size }">${ stock.pd_size }</option>
                                          </c:otherwise>
                                       </c:choose>
                                    </c:forEach>
                                    </select>
                                 </td>
                                 <td class="price">${ pd.pd_price }</td>
                                 <td><input class="pd_quantity" type="number" name="pd_quantity" value="${ pd.pd_quantity }"></td>
                                 <td>
                              <c:forEach var="stock" items="${stockList.get(pd.pd_id)}">
                                 ${ stock.pd_size } : ${ stock.pd_stock }<br>
                                    </c:forEach>
                           </td>
                                 <td><span class="btn" onclick="deleteLine(this);">삭제</span></td>
                             </tr>
                          </c:forEach>
                       </tbody>
                  </table>
                 <div class="btn btn-dark" id="addTable"  data-toggle="modal" data-target="#exampleModal">추가</div>
                 
                 <b>배송료</b><br>
                 <div class="deliveryMethodSelect inputContents">
                  <div class="radioBox">
                     <c:if test="${ order.dv_option=='2500' }">
                        <input type="radio" name="dv_option" checked="checked" value="2500" checked/>
                        <label for="basicMethod">일반 배송</label><br>
                        <input type="radio" name="dv_option" value="3000"/>
                        <label for="fastMethod">특급 익일 배송</label>
                     </c:if>
                     <c:if test="${ order.dv_option=='3000' }">
                        <input type="radio" name="dv_option" checked="checked" value="2500" />
                        <label for="basicMethod">일반 배송</label><br>
                        <input type="radio" name="dv_option" value="3000" checked/>
                        <label for="fastMethod">특급 익일 배송</label>
                     </c:if>
                  </div>
               </div><br>
                 <b>총 결제금액</b><br>
                 <p><span id="totalPrice">${ order.total_price }</span>원</p><br>
                 <b>결제방법</b><br>
                 <p>${ order.payment_method }</p><br>
                 <b>결제일</b><br>
                 <p>${ order.payDate }</p><br>
              </div>
             <input type="submit" class="btn btn-dark" value="저장">
           </form>
         </div>
      </div>
   </section>
   <div class="form-row">
         <!-- Modal -->
         <div class="modal fade" id="exampleModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">주문 내역</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               <div class="modal-body">
                  <form  action='' method="post" >
                    <input type="text" placeholder="상품명" name="search" id="search">
                    <div class="btn" onclick="searchBt()">검색</div>
                 </form>
                 <div id="searchResult"></div>
               </div>
               <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
             </div>
           </div>
         </div>
     </div>
   <jsp:include page="../footer.jsp" flush="false" />

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
     
    
   
   //상품 검색
   function searchBt() {
      var searchVal=$("#search").val();
      var str="";
       $.ajax({
          url : "/admin/adPdMiniSearch",
          type : "GET",
          data : { search : searchVal },
          dataType: "text",
          async : false,
          success : function(list){
             console.log("complete");
             console.log("result:"+list);
                
                var obj = JSON.parse(list);
                var searchList = obj.pdList;
            var html = "";
            html += "<br><table>";
            html += "<tr> <td>상품번호</td> <td>상품명</td> <td>색상</td> <td>가격</td> </tr>";
            
            for(var i = 0; i < searchList.length; i ++) {
               html += "<tr>";
               html += "<td>" + searchList[i].pd_id + "</td>";
               html += "<td><a onclick='pdChoose("+searchList[i].pd_id+")' style='cursor:pointer' id='name"+searchList[i].pd_id+"'>" + searchList[i].pd_name + "</a></td>";
               html += "<td id='color"+searchList[i].pd_id+"'>" + searchList[i].pd_color + "</td>";
               html += "<td id='price"+searchList[i].pd_id+"'>" + searchList[i].pd_price + "</td>";
               html += "</tr>";
            }
            html += "</table>";

            $("#searchResult").html(html);
          },
          error : function(request, status, error) {
             console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
      });
   }
   
   function pdChoose(id){
      console.log(id);
      var color=$('#color'+id).text();
      var name=$('#name'+id).text();
      var price=$('#price'+id).text();
      
      //테이블 추가
      $('.table tr:last').after('<tr class="pd_row">'+
            '<input type="hidden" name="pd_id" value="'+id+'">'+
                 '<td>'+name+'</td> <td>'+color+'</td> '+
                 '<td><select name="pd_size" class="form-control" id="size'+id+'"></select></td>'+
                 '<td class="price">'+price+'</td> <td><input class="pd_quantity" type="number" name="pd_quantity"></td> <td id="stock'+id+'"></td>'+
                 '<td><button class="btn" onclick="deleteLine(this);">삭제</button></td> </tr>');
          $(".modal").attr("aria-hidden","true");

          
        $.ajax({
          url : "/admin/adSelectStock",
          type : "GET",
          data : { pd_id : id },
          dataType: "text",
          async : false,
          success : function(stock){
             var stockList = JSON.parse(stock);
             var html = "";
            for(var i = 0; i < stockList.length; i ++) {
               html += '<option value="${ '+stockList[i].pd_size+' }">'+stockList[i].pd_size+'</option>';
            }
             $("#size"+id).append(html); 
             
             var html = "";
            for(var i = 0; i < stockList.length; i ++) {
               html += stockList[i].pd_size+" : "+stockList[i].pd_stock+" <br>";
            }

             $("#stock"+id).append(html); 
             
             console.log("complete");
             console.log("result:"+stockList);
                
          },
          error : function(request, status, error) {
             console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
      }); 
      return false;
   }

    //테이블 삭제
   function deleteLine(obj) {
       var tr = $(obj).parent().parent();
       tr.remove();
   }

   // 상품 현황 select
   $(function(){
      $("select[name=order_state]").find("option").each(function(index){
         if($(this).val()=='${order.order_state}'){
            $("select[name=order_state]").val('${order.order_state}').prop("selected", true);
         }
      });
       //총 합계
        $(document).on('focusin',".pd_quantity", function(){
            console.log("Saving value " + $(this).val());
            $(this).data('val', $(this).val());
        });
        
        $(document).on("change keyup paste",".pd_quantity", function(){
           var currentTotalPrice = $('#totalPrice').text();
           var prevQuantity = $(this).data('val');
           var changeTotalPrice = 0;
           var thisPrice = $(this).parents('.pd_row').children('.price').text();
           changeTotalPrice = (currentTotalPrice-(prevQuantity*thisPrice))+(thisPrice * $(this).val());
           $('#totalPrice').text(changeTotalPrice);
           $(this).data('val', $(this).val());
        });
   });
</script>
</body>
</html>