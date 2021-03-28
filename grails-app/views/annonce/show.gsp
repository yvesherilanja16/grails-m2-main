<g:applyLayout name="layout">
    <div class="card-header">

        <h3 style="text-align: center">Affichage annonce</h3>

        <g:if test="${flash.message}">
            <div class="message  alert alert-success" role="status">${flash.message}</div>
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
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Title</label>

            <div class="col-sm-4">
                <input type="text" class="form-control form-control-round" name="title" value="${annonce.title}"
                       required="" id="title" disabled>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Description</label>

            <div class="col-sm-4">
                <input type="text" class="form-control form-control-round" name="description"
                       value="${annonce.description}"
                       required="" id="description" disabled>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Price</label>

            <div class="col-sm-4">
                <input type="number decimal" class="form-control form-control-round" name="price"
                       value="${annonce.price}"
                       required="" min="0.0" id="price" disabled>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Illustrations</label>

            <div class="col-sm-4">
                <g:each in="${annonce.illustrations}" var="illustration">
                    <img src="${baseUrl + illustration.filename}"/>
                </g:each>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Author</label>

            <div class="col-sm-4">
                <g:select name="author.id" class="form-control" from="${userList}" optionKey="id"
                          optionValue="username"/>
            </div>
        </div>

        <div class="form-group row">
            <g:form resource="${this.annonce}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit btn btn-warning" action="edit" resource="${this.annonce}"><g:message
                            code="default.button.edit.label" default="Edit"/></g:link>
                    <input class="delete btn btn-danger" type="submit"
                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </fieldset>
            </g:form>
        </div>
    </div>
</g:applyLayout>