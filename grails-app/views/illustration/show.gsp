<g:applyLayout name="layout">
    <div class="card-header">

        <h3 style="text-align: center">Show illustration</h3>
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

    </div>

    <div class="card-block table-border-style" style="padding-left: 2%;padding-right: 2%">
        <f:display bean="illustration" />
        <g:form resource="${this.illustration}" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${this.illustration}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</g:applyLayout>
