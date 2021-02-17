<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>
                            <li class="nav-item ">
                            <!-- <a class="nav-link active"> 로 바꾸면 해당 a활성화  -->
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1">
                                	<i class="fa fa-fw fa-user-circle"></i>회원 관리 <span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1-2" aria-controls="submenu-1-2">
                                            	개인 회원 관리</a>
                                            <div id="submenu-1-2" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<c:url value='/admin/users/indiv/selectIndivUsers.do '/>">개인 회원 조회</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<c:url value='/admin/users/indiv/selectWithdrawUsers.do '/>">탈퇴 회원 조회</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="ecommerce-product.html">이력서 조회</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="ecommerce-product.html">이력서 공개 신청 심사</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1-1" aria-controls="submenu-1-1">기업 회원 관리</a>
                                            <div id="submenu-1-1" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<c:url value='/admin/users/corp/corpList.do'/>">기업 회원 조회</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="<c:url value='/admin/users/corp/recruitList.do'/>">채용 공고 조회</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- 메뉴 하나 끝 -->
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fa fa-credit-card" aria-hidden="true"></i>유료 서비스 관리</a>
                                <div id="submenu-3" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="<c:url value='/admin/paidService/orderslist/ordersList.do'/>">서비스 내역 조회</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="<c:url value='/admin/paidService/coupon/manage.do'/>">쿠폰 관리</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fab fa-fw fa-wpforms"></i>광고 관리</a>
                                <div id="submenu-4" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="<c:url value='/admin/advertising/advertisingOnline.do'/>">광고 서비스 조회</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-5"><i class="fas fa-fw fa-table"></i>웹사이트 관리</a>
                                <div id="submenu-5" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="<c:url value='/admin/siteManage/termsOfService.do'/>">이용 약관</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="<c:url value='/admin/siteManage/privacyPolicy.do'/>">개인정보 처리 방침</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-6" aria-controls="submenu-6"><i class="fa fa-users" aria-hidden="true"></i>고객센터 관리</a>
                                <div id="submenu-6" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/general-table.html">FAQ 조회</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/data-tables.html">Q&A 조회</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="<c:url value='/admin/notice/noticeList.do?type=0'/>">공지사항 조회</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-divider">
                               		사이트 바로가기
                            </li>
                            <li class="nav-item">
                                <a href="<c:url value='/index.do'/>"><i class="fas fa-fw fa-file"></i> Work IT 바로가기 </a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <div class="dashboard-wrapper">
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->