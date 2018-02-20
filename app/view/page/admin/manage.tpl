{% import "../../layout/admin/meta.tpl" as metaTemp %}
{% import "../../layout/admin/header.tpl" as headerTemp %}
{% import "../../layout/admin/script.tpl" as scriptImport %}

<!DOCTYPE html>
<html lang="zh-cn">
<head>
  {{ metaTemp.value("TeanBlog | 管理文章", "Blog, TeanBlog", "A minimalist style blog based on Egg.js") }}
  <link rel="stylesheet" href="/public/css/admin/manage.css">
</head>
<body>
  {{ headerTemp.current(3) }}
    <section class="container admin-panel">
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>发布</th>
              <th>更新</th>
              <th>标题</th>
            </tr>
          </thead>
          <tbody>
            {% for article in resourceData.rows %}
              <tr>
                <td>{{ article.created_at_beauty }}</td>
                <td>{{ article.updated_at_beauty }}</td>
                <td>{{ article.title | truncate(15) }}</td>
                <td class="table-action-btn__wrapper">
                  <button type="button" class="table-action-btn btn btn-primary">编辑</button>
                </td>
                <td class="table-action-btn__wrapper">
                  <button type="button" class="table-action-btn btn btn-danger">删除</button>
                </td>
              </tr>
            {% endfor %}
          </tbody>
        </table>
      </div>
      {% if resourceData.count > 10 %}
        <nav>
          <ul class="pagination">
            <li class="page-item {{ "disabled" if resourceData.current === 1 else "" }}">
              <a class="page-link" href="/admin/article/manage/{{ resourceData.current - 1 }}">
                上一页
              </a>
            </li>
            <li class="page-item active">
              <span class="page-link">{{ resourceData.current }}</span>
            </li>
            <li class="page-item {{ "disabled" if resourceData.current >= resourceData.count / 10 else "" }}">
              <a class="page-link" href="/admin/article/manage/{{ resourceData.current + 1 }}">
                下一页
              </a>
            </li>
          </ul>
        </nav>
      {% endif %}
    </section>
  {% include "../../layout/admin/footer.tpl" %}
  {% include "../../layout/script.tpl" %}
  {{ scriptImport.import("manage") }}
</body>
</html>
