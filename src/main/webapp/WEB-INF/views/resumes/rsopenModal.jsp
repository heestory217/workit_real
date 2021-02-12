<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal fade" id="rsOpen" tabindex="-1" role="dialog" aria-labelledby="resOpenLabel" aria-hidden="true">
   <div class="modal-dialog" style="max-width:560px;">
      <!-- Modal content-->
      <div class="modal-content" style="width: 560px; overflow-x: auto; overflow-y: auto;">
         <div class="modal-header">
             <h5 class="modal-title" id="resOpenLabel">이력서 공개</h5>
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
             </button>
         </div>
         <div class="modal-body" style="padding:20px">
            <div class="modalservice">
               <h1>이력서를 공개하시겠습니까?</h1>
               <h2>이력서 공개는 관리자 확인후 이루어집니다<br>
               		(공개여부 결과까지 1~2일 소요됩니다)</h2>
               		${resumeVo.resumeNo}
               <br>
            </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn opBtn" data-dismiss="modal" style="padding: 5px 10px !important;"
            	value="${resumeVo.resumeNo}">확인</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 5px 10px !important;">닫기</button>
         </div>
      </div>
   </div>
</div>