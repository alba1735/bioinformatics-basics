---
layout: default
title:  "test"
nav_order: 0
has_children: false
nav_exclude: true
---
<!-- <style>
.collapsiblebutton {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.activebutton, .collapsiblebutton:hover {
  background-color: #555;
}

.contentbutton {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
}
</style>

<h2>Collapsibles</h2>

<p>A Collapsible:</p>
<button type="button" class="collapsiblebutton">Open Collapsible</button>
<div class="contentbutton">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div> -->

<script>
$(document).ready(function(){
  $("button").click(function(){
    $("buttoncontent").toggle();
  });
});
</script>

<button>Toggle between hide() and show()</button>


{% capture html %}
<div class=buttoncontent>This is a paragraph.</div>
{% endcapture %}
