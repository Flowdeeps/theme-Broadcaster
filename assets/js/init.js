$(document).ready(function() {

  /* Input focus/blur */

  $('input[type="text"], input[type="password"], textarea').focus(function() {
    if(this.value==this.defaultValue)this.value='';
  });

  $('input[type="text"], input[type="password"], textarea').blur(function() {
    if (this.value ==='')this.value=this.defaultValue;
  });

  // init mediaelements.js audiolibrary
  $('audio.audioplayer').mediaelementplayer({
      audioWidth: 215,
      audioHeight: 35,
      loop: true,
      iPadUseNativeControls: true,
      iPhoneUseNativeControls: true,
      AndroidUseNativeControls: true,
      features: ['volume']
  });

  var player = $("audio.audioplayer")[0];

  // audio player
  $('.audio-change, .audio-trigger').click(function (e) {
      e.preventDefault();

      if ($('body').hasClass('audio-now-playing')) {
          player.pause();
      } else {
          player.play();
      }
  });

  $('#js-change-sound').on('click', function (e) {
      e.preventDefault();
      if ($("audio.audioplayer")[0].volume > 0) {
          $('body').addClass('audio-sound');
          player.volume = 0;
      } else {
          $('body').removeClass('audio-sound');
          player.volume = 1;
      }
  });

  // now playing elements
  var nowplaying = $('.now-playing-bar');
  var current = nowplaying.find('.current');
  var next = nowplaying.find('.next');

  // get api elements
  // current
  var dataCurrPrefix = "Current: "
  var dataCurrentName = "";
  var dataCurrentDescription = "";
  var dataCurrentElapsed = "";
  var dataCurrentRemain = "";
  // next
  var dataNextPrefix = "Next: ";
  var dataNextName = "";
  var dataNextDescription = "";
  var dataNextStart = "";
  var dataNextEnd = "";

  $.ajax({
    url: 'https://sourcefabric.airtime.pro/api/live-info/',
    dataType: 'jsonp',
    success: function(data){
      console.log(data);
      var i = 0;
      var refresh = setInterval(function(){
        // console.log('balls', i);
        i++;
        // current
        dataCurrentName = dataCurrPrefix + data.current.name;
        current.find('h3').html(dataCurrentName);
        dataCurrentDescription = data.currentShow[0].description;
        if (dataCurrentDescription == "") {
          dataCurrentDescription = "No show description";
        }
        dataCurrentElapsed = data.schedulerTime;
        current.find('.description').html(dataCurrentDescription);
        current.find('.elapsed').html(dataCurrentElapsed);
        // next
        dataNextName = dataNextPrefix + data.next.name;
        next.find('h3').html(dataNextName);
        dataNextDescription = data.nextShow[0].description;
        if (dataNextDescription == "") {
          dataNextDescription = "No show description";
        }
        next.find('.description').html(dataNextDescription);
        dataNextStart = data.nextShow[0].starts;
        dataNextEnd = data.nextShow[0].ends;
        next.find('.start').html(dataNextStart);
        next.find('.end').html(dataNextEnd);
      }, 1000);
    }
  });

  $('audio').on('play pause', function () {
      if (this.paused) {
          $('title').text('Radio FFM');
          $('body').removeClass('audio-now-playing');
          $('.hl-onair span').text('');
      } else {
          $('.hl-onair span').text($('.sec-onair h2').text());
          $('title').text($('.sec-onair h2').text() + ' | Radio FFM');
          $('body').addClass('audio-now-playing');
      }
  });

  if( $(window).width() < 660) {

    var expandCounter = 0;
    $('.top-menu ul li a').click(function(){
      if (expandCounter === 0) {
        $(this).addClass('active');
        $(this).next('.sub').slideDown('fast');
        expandCounter = 1;
      } else if ($(this).hasClass('active')) {
        $('.top-menu ul li a').removeClass('active');
        $('.sub').slideUp('fast');
        expandCounter = 0;
      } else {
        $('.top-menu ul li a').removeClass('active');
        $('.sub').slideUp('fast');
        $(this).addClass('active');
        $(this).next('.sub').slideDown('fast');
        expandCounter = 1;
      }
      return false;
    });

    $('a.cat-trigger').click(function(){
      $('.top-menu ul li a').removeClass('active');
      $('.top-menu ul li .sub').slideUp();
      $(this).next('ul').slideToggle('fast');
      expandCounter = 0;
    });

    $('.search-box a.search-trigger').click(function(){
      $('.top-menu ul li a').removeClass('active');
      $('.top-menu ul li .sub').slideUp();
      $(this).toggleClass('active');
      $(this).next('div').slideToggle('fast');
      expandCounter = 0;
    });

  } else {

    // Man Nav
    $('.top-menu ul li').hover(function(){
      $(this).children('a').addClass('active');
      $(this).children('.sub').slideDown('fast');
    },
    function(){
      $(this).children('a').removeClass('active');
      $(this).children('.sub').slideUp('fast');
    });
  }

  // Article Details
  $('article').hover(function(){
    $(this).find('.info').slideDown('fast');
  },
  function(){
    $(this).find('.info').slideUp('fast');
  });

  // bxSlider
  if ($('.bxslider article')[0]){
    $('.bxslider').bxSlider({
      auto: true
    });
  }

  // add class to comment buttons
  $('.comments').find('input[type=submit]').each(function(){
    $(this).addClass('button');
  });

  // album review links opener
  $('.social_links').find('a').bind('click', function(){
    // console.log($(this).attr('href'));
    var $link = $(this).attr('href');
    window.open($link);
    return false;
  });

  // share links opener and parent slideUp
  $('.share').find('a').bind('click', function(){
    // console.log($(this).attr('href'));
    var $link = $(this).attr('href');
    window.open($link);
    $(this).parent().parent().slideUp('fast');
    return false;
  });

  // active state gubbins for the program grid
  if ($('.program_grid')[0]){

    setTimeout(function(){
      // figure out what the current day is
      var d = new Date().getDay();
      var dows = new Array('sunday','monday','tuesday','wednesday','thursday','friday','saturday');
      var day = dows[d];

      $("#scheduleTabs .tab_container div").each(function(){
        if (!$(this).hasClass(day)){
          $(this).hide();
        }
      });
      $("#scheduleTabs .tabs a").bind('click',function() {
        $("#scheduleTabs .tabs li").removeClass('active');
        day = $(this).parent().parent().attr('class');
        day = day.toLowerCase();
        $(this).parent().parent().addClass('active');
        $("#scheduleTabs .tab_container div").each(function(){
          $(this).animate({
            opacity: 0
          }, function(){
              $("#scheduleTabs .tab_container div").hide();
            });
          if ($(this).hasClass(day)) {
            setTimeout(function(){
              $("#scheduleTabs .tab_container ." + day).show();
              $("#scheduleTabs .tab_container ." + day).animate({
                opacity: 1
              });
            }, 1000);
          }
        });
        return false;
      });
    }, 1000);

    $("#scheduleTabs").airtimeWeekSchedule({
      sourceDomain: apiSrc,
      dowText:{monday:"Monday", tuesday:"Tuesday", wednesday:"Wednesday", thursday:"Thursday", friday:"Friday", saturday:"Saturday", sunday:"Sunday"},
      miscText:{time:"Time", programName:"Program Name", details:"Details", readMore:"Read More"},
      updatePeriod: 600 //seconds
    });
    var d = new Date().getDay();
    // $('#scheduleTabs').tabs({selected: d === 0 ? 6 : d-1, fx: { opacity: 'toggle' }});
  }

  // open sponsors in new window
  $('.sponsors').find('a').bind('click', function(){
    window.open($(this).attr('href'));
    return false;
  });

  // hide most of the menu when in mobile view
  // console.log($(window).width());
  if ($(window).width() <= 400 ){
    $('#nav-bar li a').each(function(){
      // console.log($(this).text());
      if ($(this).text() != 'Home' &&
          $(this).text() != 'Programs' &&
          $(this).text() != 'Program Grid' &&
          $(this).text() != 'Shows' &&
          $(this).text() != 'Events'){
            $(this).parent().hide();
      }
    });
  }

  // show the page when it's loaded.
  $('html').removeClass('hidden');

});
