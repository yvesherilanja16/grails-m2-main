<g:applyLayout name="layout">

    <div class="card-header">
        <h3 style="text-align: center">Liste des annonces</h3>

        <div class="card-header-right"><ul class="list-unstyled card-option"><li>
            <i class="icofont icofont-simple-left "></i></li>        <li><i
                class="icofont icofont-maximize full-card"></i></li>        <li><i
                class="icofont icofont-minus minimize-card"></i></li>        <li><i
                class="icofont icofont-refresh reload-card"></i></li>        <li><i
                class="icofont icofont-error close-card"></i></li></ul></div>
    </div>

    <div class="card-block table-border-style">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>

                    <th class="sortable"><a
                            href="/projet/annonce/index?sort=title&amp;max=10&amp;order=asc">Title</a>
                    </th>

                    <th class="sortable"><a
                            href="/projet/annonce/index?sort=description&amp;max=10&amp;order=asc">Description</a>
                    </th>

                    <th class="sortable"><a
                            href="/projet/annonce/index?sort=price&amp;max=10&amp;order=asc">Price</a>
                    </th>

                    <th class="sortable"><a
                            href="/projet/annonce/index?sort=illustrations&amp;max=10&amp;order=asc">Illustrations</a>
                    </th>

                    <th class="sortable"><a
                            href="/projet/annonce/index?sort=author&amp;max=10&amp;order=asc">Author</a>
                    </th>

                </tr>
                </thead>
                <tbody>

                <g:each in="${annonceList}">
                    <tr class="even">
                        <td><a class="btn btn-success"
                               href="/projet/annonce/show/${it.id}">${it.title}</a></td>
                        <td>${it.description}</td>
                        <td>${it.price}</td>
                        <td>
                            <ul>
                                <g:each in="${it.illustrations}" var="illustration">
                                    <img src="${baseUrl + illustration.filename}"/>
                                </g:each>
                            </ul>
                        </td>
                        <td><a class="btn btn-light"
                               href="/projet/user/show/${it.author.id}">${it.author.username}</a>
                        </td>
                    </tr>
                </g:each>

                </tbody>

            </table>

        </div>
    </div>

    <div class="pagination">
        <g:paginate total="${annonceCount ?: 0}"/>
    </div>
    <!-- Main-body end -->

    <div id="styleSelector">

    </div>

</g:applyLayout>