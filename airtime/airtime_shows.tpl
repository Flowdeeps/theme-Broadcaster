{{ config_load file="strings-{{ $gimme->language->code }}.tpl" }}

{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_tpl/header.tpl" }}

  <div id="wrapper">

    <div id="content">
      <section class="grid-3">
      {{ foreach $shows as $show }}
        <article>
          <h4><a href="/airtime/shows/{{ $show.id }}">{{ $show.name}}</a></h4>
          <span>{{ $show.id }}</span>
          <p>{{ $show.description }}</p>
          <span>{{ $show.image_path }}</span>
          <span>{{ $show.genre }}</span>
          <span>{{ $show.url }}</span>
        </article>
      {{ /foreach }}
      </section>
    </div><!-- / Content -->

{{ include file="_tpl/footer.tpl" }}

  </div><!-- / Wrapper -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>