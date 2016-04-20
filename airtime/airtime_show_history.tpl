{{ config_load file="strings-{{ $gimme->language->code }}.tpl" }}

{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_tpl/header.tpl" }}

  <div id="wrapper">

    <div id="content">

    {{ foreach $showHistory as $show }}
      <div>
        <span>{{ $show.name }}</span>
        <span>{{ $show.show_id }}</span>
        <span>{{ $show.instance_id }}</span>
        <span>{{ $show.starts }}</span>
        <span>{{ $show.ends }}</span>
        <span>{{ $show.created }}</span>
        <span>{{ $show.last_scheduled }}</span>
        <span>{{ $show.time_filled }}</span>
      </div>
    {{ /foreach }}

    </div><!-- / Content -->

{{ include file="_tpl/footer.tpl" }}

  </div><!-- / Wrapper -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>