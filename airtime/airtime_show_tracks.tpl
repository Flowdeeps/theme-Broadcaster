{{ config_load file="strings-{{ $gimme->language->code }}.tpl" }}

{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_tpl/header.tpl" }}

  <div id="wrapper">

    <div id="content">

    {{ foreach $tracks as $track }}
      <div>
          <span>{{ $track.title }}</span>
          <span>{{ $track.artist }}</span>
          <span>{{ $track.starts }}</span>
          <span>{{ $track.length }}</span>
          <span>{{ $track.file_id }}</span>
      </div>
    {{ /foreach }}

    </div><!-- / Content -->

{{ include file="_tpl/footer.tpl" }}

  </div><!-- / Wrapper -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>