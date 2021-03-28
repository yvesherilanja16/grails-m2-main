<g:applyLayout name="layout">
    <div class="card-header">

        <h3 style="text-align: center">Modification annonce</h3>
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
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
    </div>
    <g:uploadForm controller="annonce" action="update" id="${annonce.id}">
        <g:hiddenField name="version" value="${this.annonce?.version}"/>

        <div class="card-block table-border-style" style="padding-left: 2%;padding-right: 2%">
            <fieldset class="form">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Title <span class="required-indicator"
                                                                       style="color: red">*</span></label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control form-control-round" name="title" value="${annonce.title}"
                               required="" id="title">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Description <span class="required-indicator"
                                                                             style="color: red">*</span></label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control form-control-round" name="description"
                               value="${annonce.description}"
                               required="" id="description">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Price <span class="required-indicator"
                                                                       style="color: red">*</span></label>

                    <div class="col-sm-4">
                        <input type="number" step="any" class="form-control form-control-round" name="price"
                               value="${annonce.price}"
                               required="" min="0.0" id="price">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Illustrations <span class="required-indicator"
                                                                               style="color: red">*</span></label>

                    <div class="col-sm-4">
                        <g:each in="${annonce.illustrations}" var="illustration">
                            <img src="${baseUrl + illustration.filename}"/>
                        </g:each>
                    </div>
                </div>

                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label" for="file">Upload</label>
                    <div class="col-sm-4">
                    <input style="display: inline" type="file" class="form-control" name="file" id="file"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Author <span class="required-indicator"
                                                                        style="color: red">*</span></label>

                    <div class="col-sm-4">
                        <g:select name="author.id" class="form-control" from="${userList}" optionKey="id"
                                  optionValue="username"/>
                    </div>
                </div>
            </fieldset>
            <fieldset class="buttons form-group row">
                <div class="col-sm-4">
                    <input class="save btn btn-info" type="submit"
                           value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                </div>
            </fieldset>
        </div>

    </g:uploadForm>
</g:applyLayout>