{% set leancloud_uri = '//cdn1.lncld.net/static/js/3.11.1/av-min.js' %}
{% if theme.vendors.leancloud %}
  {% set leancloud_uri = theme.vendors.leancloud %}
{% endif %}
<!-- 新版Valine会自动引入av-min.js -->
<!-- <script src="{{ leancloud_uri }}"></script> -->

{% set valine_uri = '//cdn.jsdelivr.net/npm/valine@1/dist/Valine.min.js' %}
{% if theme.vendors.valine %}
  {% set valine_uri = theme.vendors.valine %}
{% endif %}
<script src="{{ valine_uri }}"></script>

<script>
  var GUEST = ['nick', 'mail', 'link'];
  var guest = '{{ theme.valine.guest_info }}';
  guest = guest.split(',').filter(function(item) {
    return GUEST.indexOf(item) > -1;
  });
  new Valine({
    el: '#comments',
    verify: {{ theme.valine.verify }},
    notify: {{ theme.valine.notify }},
    appId: '{{ theme.valine.appid }}',
    appKey: '{{ theme.valine.appkey }}',
    placeholder: '{{ theme.valine.placeholder }}',
    avatar: '{{ theme.valine.avatar }}',
    meta: guest,
    pageSize: '{{ theme.valine.pageSize }}' || 10,
    visitor: {{ theme.valine.visitor }},
    lang: '{{ theme.valine.language }}' || 'zh-cn'
  });
</script>
