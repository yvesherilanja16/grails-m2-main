<g:applyLayout name="layout">
    <div class="card-header">

        <h3 style="text-align: center">Edit User</h3>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <div class="card-header-right"><ul class="list-unstyled card-option"><li><i
                class="icofont icofont-simple-left "></i></li>        <li><i
                class="icofont icofont-maximize full-card"></i></li>        <li><i
                class="icofont icofont-minus minimize-card"></i></li>        <li><i
                class="icofont icofont-refresh reload-card"></i></li>        <li><i
                class="icofont icofont-error close-card"></i></li></ul>
        </div>

    </div>

    <div class="card-block table-border-style" style="padding-left: 2%;padding-right: 2%">
        <g:form resource="${this.user}" method="PUT">
            <g:hiddenField name="version" value="${this.user?.version}" />
            <fieldset class="form">
                <f:all bean="user"/>
            </fieldset>
            <fieldset class="buttons">
                <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            </fieldset>
        </g:form>
    </div>
</g:applyLayout>