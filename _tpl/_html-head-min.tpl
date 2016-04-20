{{ config_load file="settings.tpl" section="Site" }}
{{ config_load file="settings.tpl" section="Stream" }}

<!DOCTYPE html>

{{ $lang = $gimme->issue->language->code }}

<!--[if lt IE 7 ]> <html lang="{{ $lang }}" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="{{ $lang }}" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="{{ $lang }}" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="{{ $lang }}" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="{{ $lang }}" id="modernizrcom" class="no-js"> <!--<![endif]-->
<head>

  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  <title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>
  <meta name="author" content="Aleksander Baćko Jeličič" />
  {{ if empty($siteinfo) }}{{ $siteinfo=['description' => '', 'keywords' => ''] }}{{ /if }}
  {{* if an article is active, meta-description of web page will be article's intro, otherwise it will pull site's description from System Preferences (/Configure/System Preferences) *}}
  <meta name="description" content="{{ if $gimme->article->defined }}{{ $gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}{{ else }}{{ $siteinfo.description }}{{ /if }}" />
  {{* if an article is active, meta-keywords will be generated of article keywords (defined on article edit screen), otherwise it will use site-wide keywords from System Preferences (/Configure/System Preferences) *}}
  <meta name="keywords" content="{{ if $gimme->article->defined }}{{ $gimme->article->keywords }}{{ else }}{{ $siteinfo.keywords }}{{ /if }}" />
  <meta name="generator" content="Sublime Text 3" />

  <!-- RSS & Pingback -->
  <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://{{ $gimme->publication->site }}/en/static/rss/" />

  {{ if $gimme->article->defined }}{{* Open Graph protocol metatags for Facebook sharing *}}
    <meta property="og:title" content="{{$gimme->article->name|html_entity_decode|regex_replace:'/&(.*?)quo;/':'&quot;'}}" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="http://{{ $gimme->publication->site }}{{ uri }}" />
    <meta property="og:site_name" content="{{ $gimme->publication->name }}" />
    <meta property="og:description" content="{{$gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}" />
    {{ list_article_images }}
    <meta property="og:image" content="{{ $gimme->article->image->imageurl }}" />
    {{ /list_article_images }}
  {{ /if }}

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="{{url static_file='favicon.ico' }}" type="image/vnd.microsoft.icon" />
    <link rel="icon" href="{{url static_file='favicon.ico' }}" type="image/vnd.microsoft.icon" />
    <link rel="apple-touch-icon" href="{{url static_file='favicon.ico' }}" />

    <link rel="stylesheet" href="{{ url static_file='assets/css/fancybox/jquery.fancybox-1.3.4.css' }}" />
    <link rel="stylesheet" href="{{ url static_file='dist/css/main.css' }}" type="text/css" />

    <!-- js files  -->
    <script src="{{ url static_file='dist/js/libs/jquery.min.js' }}"></script>
                
    <script>
      var apiSrc = "{{ #AirtimeAPI# }}";
    </script>

</head>
