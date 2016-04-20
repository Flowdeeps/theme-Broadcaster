{{ config_load file="strings-{{ $gimme->language->code }}.tpl" }}

{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_tpl/header.tpl" }}

  <div id="wrapper">

    <div id="content">

      <p>{{ $liveInfo.AIRTIME_API_VERSION }}</p>
      <p>{{ $liveInfo.timezone }}</p>
      <p>{{ $liveInfo.timezoneOffset }}</p>

      <p>{{ $liveInfo.previous.name }}</p>
      <p>{{ $liveInfo.previous.type }}</p>
      <p>{{ $liveInfo.previous.starts }}</p>
      <p>{{ $liveInfo.previous.ends }}</p>

      <p>{{ $liveInfo.current.name }}</p>
      <p>{{ $liveInfo.current.type }}</p>
      <p>{{ $liveInfo.current.starts }}</p>
      <p>{{ $liveInfo.current.ends }}</p>

      <p>{{ $liveInfo.next.name }}</p>
      <p>{{ $liveInfo.next.type }}</p>
      <p>{{ $liveInfo.next.starts }}</p>
      <p>{{ $liveInfo.next.ends }}</p>

      <p>{{ $liveInfo.currentShow.name }}</p>
      <p>{{ $liveInfo.currentShow.starts }}</p>
      <p>{{ $liveInfo.currentShow.ends }}</p>
      <p>{{ $liveInfo.currentShow.id }}</p>
      <p>{{ $liveInfo.currentShow.instance_id }}</p>

      <p>{{ $liveInfo.nextShow.name }}</p>
      <p>{{ $liveInfo.nextShow.starts }}</p>
      <p>{{ $liveInfo.nextShow.ends }}</p>
      <p>{{ $liveInfo.nextShow.id }}</p>
      <p>{{ $liveInfo.nextShow.instance_id }}</p>

    </div><!-- / Content -->

{{ include file="_tpl/footer.tpl" }}

  </div><!-- / Wrapper -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>