{{ config_load file="settings.tpl" section="Stream" }}

<body dir="{{ if $gimme->issue->language->code == ar }}rtl{{ else }}ltr{{ /if }}">
    <header id="main_header">
        <div id="top" class="clearfix">

            <div id="pages_top" class="clearfix">
                <a href="#" class="cat-trigger">Contact</a>
                <ul class="show">
                  {{* Set local context *}}
                  {{ local }}
                  {{ unset_topic }}
                  {{* Set static issue *}}
                  {{ set_issue number="1" }}
                  {{* Set pages section *}}
                  {{ set_section number="5" }}
                  {{ list_articles order="bynumber asc" }}
                  <li><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></li>
                  {{ /list_articles }}
                  {{ /local }}
                </ul>
            </div><!-- / pages_top -->

            <div class="top-menu">
              {{ local }}
              <ul>
                {{ dynamic }}
                {{ if $gimme->user->logged_in }}
                <li class="login"><a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">{{ $gimme->user->first_name }} {{ $gimme->user->last_name }}</a>
                  <ul class="sub">
                    <li><a href="{{ $view->url(['controller' => 'auth', 'action' => 'logout'], 'default') }}?t={{ time() }}">{{ #logout# }}</a></li>
                  </ul>
                </li>
                {{ else }}
                  <li class="login"><a href="{{ $view->url(['controller' => 'auth', 'action' =>'index'], 'default') }}">{{ #login# }}</a></li>
                {{ /if }}
                {{ /dynamic }}
                <li class="social_links follow"><a href="#">{{ #followUs# }}</a>
                  <ul class="sub">
                    {{ if #TwitterName# !=null }}
                      <li>
                      <a href="https://twitter.com/{{ #TwitterName# }}" rel="external">{{ #followAtTwitter# }}</a>
                      </li>
                    {{ /if }}
                    {{ if #FacebookName# !=null }}
                      <li>
                      <a href="https://www.facebook.com/{{ #FacebookName# }}" rel="external">{{ #likeOnFacebook# }}</a>
                      </li>
                    {{ /if }}
                    <li><a href="http://{{ $gimme->publication->site }}/en/static/rss/">{{ #signupRSS# }}</a></li>
                  </ul>
                </li>
                <li class="share"><a href="#">{{ #shareThis# }}</a>
                  <ul class="sub">
                    {{ $whereami = $view->serverUrl($smarty.server.REQUEST_URI)|escape }}
                      {{ if #TwitterName# !=null }}
                      <li><a href="http://twitter.com/share?url={{ $whereami }}&text={{ if $gimme->article->name }}{{ $gimme->article->name }}{{ else }}{{ $gimme->issue->name }}{{ /if }}&via={{ #TwitterName# }}">{{ #tweetOnTwitter# }}</a></li>
                      {{ /if}}
                    <li><a href="//www.facebook.com/sharer/sharer.php?u={{ $whereami }}">{{ #postToFacebook# }}</a></li>
                    <li><a href="https://plus.google.com/share?url={{ $whereami }}">{{ #shareGooglePlus# }}</a></li>
                  </ul>
                </li>
              </ul>
              {{ search_form template="search.tpl" html_code="class=\"search-box\"" button_html_code="class=\"button\"" }} 
              <a href="#" class="search-trigger"></a>
              <div class="hiden">
                 {{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"input search\"" }}
              </div>
              {{ /search_form }}
              {{ /local }}
          </div>
        </div><!-- / Top -->
        
        <div id="header" class="clearfix">

          <h1>
            <a href="/{{ $gimme->language->code }}/content/">{{ $gimme->publication->name }}</a>
          </h1>

          <div id="player">

            <button class="audio-trigger">
              <span></span>
            </button>

            <audio class="audioplayer" id="audioplayer" controls>
              <source src="{{ #StreamingServer# }}:{{ #StreamPort# }}/{{ #StreamA# }}" type="audio/ogg">
              <source src="{{ #StreamingServer# }}:{{ #StreamPort# }}/{{ #StreamB# }}" type="audio/mpeg">
            </audio>

          </div>

          <nav id="language_select">
            {{ local }}
              {{ unset_issue }}
              {{ unset_language }}
              {{ $defaultLang = $gimme->language->name }}

              {{ assign var="i" value=1 }}
              {{ list_issues constraints = "number is 10" }}
                {{ $i = $i + 1 }}
              {{ /list_issues }}

              {{ if $i > 1 }}
                <ul>
              {{ /if }}

              {{ list_issues constraints = "number is 10" }}
                <!-- {{ $i }} -->
                {{ $currLang = $gimme->language->name }}
                {{ set_language name="$currLang" }}
                {{ if $defaultLang != $currLang }}
                  <li {{ if $gimme->language->name == $gimme->default_language->name }}class="active"{{ /if }}><a href="{{ uri }}">{{ $gimme->language->name }}</a></li>
                {{ /if }}
              {{ /list_issues }}

              {{ if $i > 1 }}
                </ul>
              {{ /if }}

              {{ set_default_language }}
              {{ set_default_issue }}
            {{ /local }}
          </nav>
   
        </div><!-- / Header -->
        
        <div id="nav-bar" class="clearfix">
          <a href="#" class="cat-trigger">{{ #content# }}</a>
          {{ local }}
          {{ set_issue number="10" }}
          <ul class="show">
            <li><a href="/{{ $gimme->language->code }}/content/">{{ #content# }}</a></li>
            {{ local }}
            {{ set_issue number="1" }}
            {{ list_articles constraints="type is Program_Grid"}}
              <li><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></li>
            {{ /list_articles }}
            {{ /local }}
            {{ list_sections }}
              <li><a href="{{ url options='section' }}">{{ $gimme->section->name }}</a></li>
            {{ /list_sections }}
            <li><a href="/airtime/shows">{{ #shows# }}</a></li>
          </ul>
          {{ /local }}
        </div><!-- / Nav Bar -->

    </header>
