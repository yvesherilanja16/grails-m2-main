<g:applyLayout name="layout">
    <div class="card-header">

        <h3 style="text-align: center">Nouvelle annonce</h3>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div class="card-header-right"><ul class="list-unstyled card-option"><li><i
                class="icofont icofont-simple-left "></i></li>        <li><i
                class="icofont icofont-maximize full-card"></i></li>        <li><i
                class="icofont icofont-minus minimize-card"></i></li>        <li><i
                class="icofont icofont-refresh reload-card"></i></li>        <li><i
                class="icofont icofont-error close-card"></i></li></ul>
        </div>
        <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
    </div>

    <div class="card-block table-border-style" style="padding-left: 2%;padding-right: 2%">
        <g:form controller="annonce" action="save" method="POST">
            <fieldset class="form-group row">

                <f:all bean="annonce" />

            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </g:form>
    </div>
</g:applyLayout>