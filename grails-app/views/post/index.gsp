  <!DOCTYPE html>
  <html>
      <head>
          <meta name="layout" content="main" />
          <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
          <title><g:message code="default.list.label" args="[entityName]" /></title>
      </head>
      <body>
          <div class="billboard">
            <div class="billboardVid">
              <g:video videoKey="1g_MqQf8_pg&t=130s"/>
            </div>
            <span class="blogHomeTitle col-xs-12">"Insert Inspirational Quote Here"</span>

          </div>
          <div class="titleAndNewPostBtn container">
            <sec:ifAnyGranted roles='ROLE_ADMIN'>
              <g:link type="button" class="btn btn-primary newPostBtn" action="create">New Post</g:link></li>
            </sec:ifAnyGranted>

          </div><br><hr><br>

          <div id="list-post" class=" scaffold-list container col-xs-12" role="main">

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:each in="${this.postList?}" name="defaultList" var="post" status="i">

              <div class="blogPreview${i}">

                <div>
                <g:link class="blogShowLink col-xs-10" mapping="searchEngineFriendlyURL" params='[title: "${post.title}"]' id="${post.id}">
                  <p class="blogTitle"><strong>${post.title}</strong></p>
                </g:link>
                  <p class="col-xs-10 blogBodyPreview">${post?.blogBodyPreview()}
                </div>
                  <br/>
                  <p class="col-xs-2">-${post.author}</p>
                  <span class="col-xs-2 pull-right blogDate"><g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${post.dateCreated}"/></span>
                </p>
                <br><br><br><br><br><br><br>

              </div>
            </g:each>
            <g:if test="${postCount > 10}">
              <div id="pagination" class="pagination myPagi">
                <g:paginate total="${postCount ?: 0}" />
              </div>
            </g:if>
          </div>
      </body>
  </html>
