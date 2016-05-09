<section class="home_top">

    {{ $currlang = $gimme->language->code }}
    {{ $currplaylist = "Carousel-" }}
    {{ $currplaylist = $currplaylist|cat:$currlang }}

    <section class="bxslider">
    {{ list_playlist_articles name="$currplaylist" length="4" }}

        <article>
            <a href="{{ url options='article' }}">{{ include file="_tpl/img/img_front.tpl" where="topfront" }}</a>
            <h2><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h2>
        </article>

    {{ /list_playlist_articles }}
    </section>

    <div class="current_widget">
        <h2>On Air <span>Now</span></h2>
        <ul class="widget now-playing-bar">
            <li class="current">
                <h3>Now</h3>
                <p class="description"></p>
                <dl>
                  <dt>Elapsed:</dt>
                    <dd class="elapsed">0</dd>
                  <dt>Remaining:</dt>
                    <dd class="remaining">0</dd>
                </dl>
            </li>
            <li class="next">
              <h3>Next</h3>
              <p class="description"></p>
              <dl>
                <dt>Start</dt>
                  <dd class="start">0</dd>
                <dt>End</dt>
                  <dd class="end">0</dd>
              </dl>
            </li>
        </ul>
    </div>

    <div class="about_home">
      <h2>About <span>Us</span></h2>
      {{ include file="_tpl/front-about-us.tpl" }}
    </div>

</section>

<section class="grid-3">

    <h2>Latest <span>News</span></h2>

    {{ set_section number="60" }}
    {{ list_articles length="3" order="bydate desc" }}
      <article>
        <figure>
            <a href="{{ url option='article' }}">{{ include file="_tpl/img/img_onethird.tpl" }}</a>
        </figure>
        <h4><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></h4>
        <p><span class="time">{{ $gimme->article->publish_date }}</span> /
        <a class="comments_num" href="{{ url options='article' }}#comments">{{ $gimme->article->comment_count }} comment{{ if $gimme->article->comment_count != 1 }}s{{ /if }}</a></p>
      </article>
    {{ /list_articles }}
    {{ unset_section }}

</section>
