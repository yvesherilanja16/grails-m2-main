<g:applyLayout name="layout">
    <div class="card-header">

        <h3 style="text-align: center">User List</h3>
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
        <f:table collection="${userList}" />

        <div class="pagination">
            <g:paginate total="${userCount ?: 0}" />
        </div>
    </div>
</g:applyLayout>