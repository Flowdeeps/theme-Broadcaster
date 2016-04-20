{{ config_load file="strings-{{ $gimme->language->code }}.tpl" }}

{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_tpl/header.tpl" }}

  <div id="wrapper">

    <div id="content">

      <div>
        <p>{{ $show.name }}</p>
        <p>{{ $show.id }}</p>
        <p>{{ $show.description }}</p>

        <audio id="show-audio" controls autoplay></audio>
        <h4>Show Instances</h4>
        {{ foreach $showInstances as $showInstance }}
           <p>{{ $showInstance.instance_id }} :  {{ $showInstance.starts }} - {{ $showInstance.ends }}</p>
            {{ foreach $showInstance.tracks as $track }}
              <div class="show-track" data-src="/airtime/file/{{ $track.file_id}}" data-type="{{ $track.mime }}" style="cursor: pointer; cursor: hand;">
                <span>{{ $track.starts}} : {{ $track.title }} - {{ $track.artist }}</span>
              </div>
            {{ /foreach }}
        {{ /foreach }}
      </div>

    </div><!-- / Content -->

{{ include file="_tpl/footer.tpl" }}

  </div><!-- / Wrapper -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>
<script>
$(document).ready(function() {

    $('.show-track').live('click', function() {
        var audio = $('#show-audio')[0];
        var trackSrc = $(this).data('src');
        var trackType = $(this).data('type');
        $('#show-audio').attr('src', trackSrc); 
        $('#show-audio').attr('type', trackType); 
        audio.load();
    });
});
</script>