var visualSlider;

$(document).ready(
		function() { // start

			/*-----s:gnb_script------*/

			$("#gnb_menu, .down_gnb").hover(function() {
				$(".down_gnb").stop().slideDown(300, 'swing');
			}, function() {
				$(".down_gnb").stop().slideUp(300, 'swing');
			});

			$(".menu01, .down_menu01").hover(function() {
				$(".menu01").addClass("on");
			}, function() {
				$(".menu01").removeClass("on");
			});

			$(".menu02, .down_menu02").hover(function() {
				$(".menu02").addClass("on");
			}, function() {
				$(".menu02").removeClass("on");
			});

			$(".menu03, .down_menu03").hover(function() {
				$(".menu03").addClass("on");
			}, function() {
				$(".menu03").removeClass("on");
			});

			$(".menu04, .down_menu04").hover(function() {
				$(".menu04").addClass("on");
			}, function() {
				$(".menu04").removeClass("on");
			});

			$(".menu05, .down_menu05").hover(function() {
				$(".menu05").addClass("on");
			}, function() {
				$(".menu05").removeClass("on");
			});

			$(".menu06, .down_menu06").hover(function() {
				$(".menu06").addClass("on");
			}, function() {
				$(".menu06").removeClass("on");
			});

			$(".menu07, .down_menu07").hover(function() {
				$(".menu07").addClass("on");
			}, function() {
				$(".menu07").removeClass("on");
			});

			$(".menu08, .down_menu08").hover(function() {
				$(".menu08").addClass("on");
			}, function() {
				$(".menu08").removeClass("on");
			});

			/*-----e:gnb_script------*/
			/*--s:mo_gnb--*/
			$('#m_menu').click(function() {
				$(this).toggleClass('open');
				if ($(this).hasClass('open')) {
					$('.gnb_menu').animate({
						right : '0px'
					}, 300)
					$('.lnb_bg').fadeIn(100)
				} else {
					$('.gnb_menu').animate({
						right : '-400px'
					}, 300)
					$('.lnb_bg').fadeOut(100)

				}
				;
			});
			/*--e:mo_gnb--*/

			$('#m_menu').click(function() {
				$('.lnb').toggleClass('open');
			});
			/*--s:mo_gnb_slidedown_btn--*/
			$(".sub_menu").hide();
			$(".lnb_menu a").click(
					function() {
						$(this).next(".sub_menu").slideToggle("fast").siblings(
								".sub_menu:visible").slideUp("fast");
						$(this).toggleClass("active").siblings(".lnb_menu a")
								.removeClass("active");
					});
			/*--e:mo_gnb_slidedown_btn--*/

			/*----s:visual_slider---*/

			/*
			 * visualSlider = $('#visual_slider').bxSlider({ adaptiveHeight:
			 * true, mode: 'fade', auto: true, infiniteLoop: true, pause:8000,
			 * controls:true });
			 */

			/*----e:visual_slider---*/

			/* s:scroll */
			$(window).scroll(function(event) {
				var y = $(this).scrollTop();

				if (y >= 900) {
					$('#tit01').addClass('tit01 on');
					$('#tit02').addClass('tit02 on');
					$('#tit03').addClass('tit03 on');
					$('#circle01').addClass('fadeInDownShort01 on');
					$('#circle02').addClass('fadeInDownShort02 on');
					$('#circle03').addClass('fadeInDownShort03 on');
					$('#circle04').addClass('fadeInDownShort04 on');
					$('#circlebar').addClass('fadeInDownShort05 on');
				}

			});
			/* e:scroll */

			$(".side_btn").hover(function() {
				$(this).animate({
					right : '-37px'
				}, 100, 'swing');
			}, function() {
				$(".side_btn").animate({
					right : '-113px'
				}, 100, 'swing');
			});

		});// end
