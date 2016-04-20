{{ config_load file="strings-{{ $gimme->language->code }}.tpl" }}

{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_tpl/header.tpl" }}

  <div id="wrapper">

    <div id="content">

    {{ foreach $trackHistory as $track }}
      <div>
        <span>{{ $track.track_title }}</span>
        <span>{{ $track.artist_name }}</span>
        <span>{{ $track.instance_id }}</span>
        <span>{{ $track.starts }}</span>
        <span>{{ $track.ends }}</span>
        <span>{{ $track.history_id }}</span>
      </div>
    {{ /foreach }}

    </div><!-- / Content -->

{{ include file="_tpl/footer.tpl" }}

  </div><!-- / Wrapper -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>