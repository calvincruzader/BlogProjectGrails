<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="btn btn-default" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="btn btn-default" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="btn btn-default" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-post" class="content scaffold-edit" role="main">
            <h1>What would you like to change?</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.post}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.post}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.post}" method="PUT">
                <g:hiddenField name="version" value="${this.post?.version}" />
                <fieldset class="form">
                  <div>
                    <label>Title:</label>
                    <input class="form-control" name="title" type="text" value="${post.title}"></input>
                  </div>
                  <div>
                    <label>Body:</label>
                    <textarea class="form-control" name="body" type="text" rows="3">${post.body}</textarea>
                  </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="btn btn-default" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
