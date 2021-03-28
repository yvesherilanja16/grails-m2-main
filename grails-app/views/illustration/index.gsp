<g:applyLayout name="layout">
    <div class="card-header">

        <h3 style="text-align: center">Show Illustration</h3>
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
        <table>
            <thead>
            <tr>

                <th class="sortable"><a href="/projet/illustration/index?sort=filename&amp;max=10&amp;order=asc">Illustration</a></th>

                <th class="sortable"><a href="/projet/illustration/index?sort=annonce&amp;max=10&amp;order=asc">Annonce</a></th>

            </tr>
            </thead>
            <tbody>

            <g:each in = "${illustrationList}">
                <tr class="even">
                    <td><a href="/projet/illustration/show/${it.id}"><img src="${baseUrl + it.filename}" /></a></td>
                    <td><a href="/projet/annonce/show/${it.annonce.id}">${it.annonce.title}</a></td>
                </tr>
            </g:each>

            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${illustrationCount ?: 0}" />
        </div>
    </div>
</g:applyLayout>