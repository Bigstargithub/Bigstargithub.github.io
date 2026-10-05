---
title: Memories
icon: fas fa-calendar-check
order: 3
---

{% include lang.html %}
{% assign memories = site.categories['Memories'] %}

<div id="page-category">
  {% if memories and memories.size > 0 %}
    <ul class="content ps-0">
      {% for post in memories %}
        <li class="d-flex justify-content-between px-md-3">
          <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
          <span class="dash flex-grow-1"></span>
          {% include datetime.html date=post.date class='text-muted small text-nowrap' lang=lang %}
        </li>
      {% endfor %}
    </ul>
  {% else %}
    <p class="text-muted px-md-3">아직 작성된 회고가 없습니다.</p>
  {% endif %}
</div>
