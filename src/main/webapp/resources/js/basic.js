$(document).ready(function () {

//	$(window).resize(function(){
//        var width = parseInt($(this).width()+17); //parseint는 정수로 하기 위함
//        if(width <= 1000){
//			$('.sub01 .sub_menu_box.sub01, .sub02 .sub_menu_box.sub02, .sub03 .sub_menu_box.sub03, .sub04 .sub_menu_box.sub04, .sub05 .sub_menu_box.sub05, .sub06 .sub_menu_box.sub06, .sub07 .sub_menu_box.sub07, .sub08 .sub_menu_box.sub08').css("display","none");
//		 }else{
//           $('.sub01 .sub_menu_box.sub01, .sub02 .sub_menu_box.sub02, .sub03 .sub_menu_box.sub03, .sub04 .sub_menu_box.sub04, .sub05 .sub_menu_box.sub05, .sub06 .sub_menu_box.sub06, .sub07 .sub_menu_box.sub07, .sub08 .sub_menu_box.sub08').css("display","block");
		   //$('.sub_menu_wrap .sub_menu_box li').css("display","inline-block");
 //       }
//    }).resize();


	$('#tab_btn_box>div').click(function(){
		var box = $(this).index()+1;

		$('#tab_btn_box>div').removeClass('tab_on');
		$(this).addClass('tab_on');	

		$('#tab_con_box div.tab_con').css("display","none");
		$('#tab_con_box div.tab_con_box'+box).fadeIn(500);
	});

	//
	//var jbOffset = $( '#hd_wrap' ).offset();
	//$( window ).scroll( function() {
	//	if ( $( document ).scrollTop() > (jbOffset.top+0) ) {
	//		$( '#hd_wrap' ).addClass( 'hd-up' );
	//		}
	//	else {
	//		$( '#hd_wrap' ).removeClass( 'hd-up' );
			//$('.gnb_mo_menu .gnb_dp1 .gnb_dp2_wrap').slideUp(200);
			//$('.gnb_mo_menu .gnb_dp1 span').removeClass('on');
			//$('#gnb_menu').removeClass('on');
			//$('#gnb_menu_box').animate({right:'-1100px'});
	//	}
	//});


	//hd_main_wrap
	$('#hd_gnb.gnb_pc .gnb_dp1_wrap').hover(function(){
			$('#hd_wrap').addClass('over');
			$('#hd_wrap .hd_bg').slideDown(50);
			$('#hd_gnb.gnb_pc .gnb_dp1_wrap .gnb_dp2_wrap').stop().slideDown(200);
		}, function(){
			
			$('#hd_wrap .hd_bg').slideUp(50);
			$('#hd_gnb.gnb_pc .gnb_dp1_wrap .gnb_dp2_wrap').slideUp(100);
	});
	
	$('#hd_main_wrap #hd_gnb.gnb_pc .gnb_dp1_wrap').hover(function(){
		$('#hd_wrap').addClass('over');
		}, function(){
		$('#hd_wrap').removeClass('over');
	});
	

	//
	$('.gnb_mo_menu .gnb_dp1 span').click(function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
			$(this).siblings('.gnb_dp2_wrap').slideUp(200);
			$('.gnb_mo_menu .gnb_dp1 span').css({opacity:1});
		}else{
			$(this).addClass('on');
			$('.gnb_mo_menu .gnb_dp1 span').removeClass('on');
			$('.gnb_mo_menu .gnb_dp1 span').not(this).css({opacity:0.7});
			$(this).css({opacity:1});
			$('.gnb_mo_menu .gnb_dp1 .gnb_dp2_wrap').slideUp(200);
			$(this).siblings('.gnb_dp2_wrap').slideDown(200);
		}
	});
	
	//
	$('#gnb_menu').click(function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
			$('.gnb_mo_menu .gnb_dp1 .gnb_dp2_wrap').slideUp(200);
			$('#gnb_menu_box').animate({right:'-1100px'});
			
		}else{
			$(this).addClass('on');
			$('#gnb_menu_box').animate({right:'0px'});
		}
	});


	//
	$('.sec01_con_box').hover(function(){
		$('.txt_box', this).stop().animate({top:'20%'});
		$(this).stop().addClass('over');
	}, function(){
		$('.txt_box', this).stop().animate({top:'80%'});
		$(this).stop().removeClass('over');
	});

	//
	$('#ft_wrap .ft_bt_btn').click(function(){
		$('#ft_wrap .ft_bt_con').slideToggle(100);
	});


	





});  
