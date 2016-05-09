<div class="container">
    <nav class="navbar navbar-inverse">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href='FrontControllerServlet'>Leaky Cauldron</a>
        </div>

        <div class="collapse navbar-collapse js-navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown mega-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Nuestros productos <span class="caret"></span></a>
                    <ul class="dropdown-menu mega-dropdown-menu">
                        <li class="col-sm-3">
                            <form action='FrontControllerServlet' method='POST' role='form'>
                                <ul class='listItems'>
                                    <li class="dropdown-header">G�neros</li>
                                    <li><input type='hidden' value='SearchCommand' name='command'/></li>
                                    <li><input type='submit' class='submitLink' value='Juvenil' name='genero'/></li>
                                    <li><input type='submit' class='submitLink' value='Infantil' name='genero'/></li>
                                    <li><input type='submit' class='submitLink' value='Fantasia' name='genero'/></li>
                                    <li><input type='submit' class='submitLink' value='Aventuras' name='genero'/></li>
                                    <li><input type='submit' class='submitLink' value='Ciencia Ficcion' name='genero'/></li>
                                </ul>
                            </form>
                        </li>
                        <li class="col-sm-3">
                            <form action='FrontControllerServlet' method='POST' role='form'>
                                <ul class='listItems'>
                                    <li class="dropdown-header">Materias</li>
                                    <li><input type='hidden' value='SearchCommand' name='command'/></li>
                                   <li><input type='submit' class='submitLink' value='Idiomas' name='genero'/></li>
                                   <li><input type='submit' class='submitLink' value='Deportes' name='genero'/></li>
                                   <li><input type='submit' class='submitLink' value='Tecnologia' name='genero'/></li>
                                   <li><input type='submit' class='submitLink' value='Informatica' name='genero'/></li>
                                   <li><input type='submit' class='submitLink' value='Oposiciones' name='genero'/></li>
                                </ul>
                            </form>
                        </li>
                        <li class="col-sm-3">
                            <div>
                                <form action='FrontControllerServlet' method='POST' role='form'>
                                    <input type='hidden' value='ShowBookDetailsCommand' name='command'/>
                                    <ul class='listItems'>
                                        <li class="dropdown-header">Recomendados</li>
                                        <li><input type='submit' class='submitLink' value='Cronicas vampiricas' name='title'/></li>
                                        <li><input type='submit' class='submitLink' value='El nombre del viento' name='title'/></li>
                                        <li><input type='submit' class='submitLink' value='Los juegos del hambre' name='title'/></li>
                                        <li><input type='submit' class='submitLink' value='Harry Potter 3' name='title'/></li>
                                        <li><input type='submit' class='submitLink' value='Harry Potter 1' name='title'/></li>
                                    </ul>
                                </form>
                            </div>
                        </li>
                        <li class="col-sm-3">
                            <ul class='listItems'>
                                <li class="dropdown-header">Libros</li>
                                <li><div class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <% ArrayList<Book> books = (ArrayList) session.getAttribute("books");
                                            int active = 1;
                                            if (books !=  null && !books.isEmpty()) {
                                                for (Book book : books){ %>
                                            <div class="item <% if (active == 1) out.print("active");%>">
                                                <form action='FrontControllerServlet' method='POST' role='form'>
                                                    <input type='hidden' value='ShowBookDetailsCommand' name='command'/>
                                                    <% active = 0; %>
                                                    <input type='hidden' value='<% out.print(book.getIsbn()); %>' name='isbnDetails'/>
                                                    <input type='image' src='covers/<% out.print((book.getTitle())+".jpg"); %>' class="img-responsive" alt="<% out.print(book.getTitle()); %>">
                                                </form>
                                            </div><!-- End Item -->
                                            <% } %>
                                        <% } %>
                                    </div><!-- End Carousel Inner -->
                                </div></li><!-- /.carousel -->
                                <li class="divider"></li>
                                <li ><a href="booksView.jsp" class='submitLink'>Ver todos los libros</a></li>
                            </ul>
                            <ul class='listItems'>
                                <li><div>
                                    <form action='FrontControllerServlet' class='form-horizontal' role='form'>
                                        <input type='hidden' value='ShowSuggestionsCommand' name='command'>
                                        <button type='submit' class='submitLink'>Ver Recomendaciones</button>
                                    </form>
                                </div></li>
                            </ul>
                        </li>
                    </ul>
                </li>

            </ul>
            <ul class="nav navbar-nav">
                <li>
                    <form action='FrontControllerServlet' class="navbar-form" method='POST' role="search">
                        <ul class="nav navbar-nav">
                            <li><input type='hidden' value='SearchCommand' name='command'></li>
                            <li>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Buscar" name="search" required>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <select name="select" class='form-control'>
                                <option selected="selected" value="0">T�tulo</option>
                                <option value="1">Autor</option>
                                <option value="2">Categor�a</option>
                                </select>
                            </li>
                        </ul>
                    </form>
                </li>

            </ul>
            <ul class="nav navbar-nav" style="padding-top: 8px">
            <%  Client client = (Client) session.getAttribute("client");
                if(client != null && client.getIsadmin() == 1){ %>
                <li><div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class='btn btn-danger' href='adminView.jsp'>Administrar Base de Datos</a>
                    </div></li>
            <%  } %>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Mi cuenta <span class="caret"></span></a>
                    <% if(session.getAttribute("session") == null){ %>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="loginView.jsp">Inicia Sesi�n</a></li>
                            <li class="divider"></li>
                            <li><a href="registerView.jsp">Registrarse</a></li>
                        </ul>   
                    <% }else{ %>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href='profileView.jsp' style="padding: 1px 6px;">Perfil</a></li>
                        <li class="divider"></li>
                        <li>
                            <form action='FrontControllerServlet' class='form-horizontal' method='POST' role='form'>
                                <input type='hidden' value='ShowStarredCommand' name='command'>
                                <button class="submitLink" type='submit' class='btn btn-default'>Favoritos</button>
                            </form>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <form method='post' action='FrontControllerServlet' role='form'>
                                <input type='hidden' value='AddShoppingCommand' name='command'>
                                <input class="submitLink" type='submit' name='compras' value="Mis compras">
                            </form>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <form action='FrontControllerServlet' class='form-horizontal' method='POST' role='form'>
                                <input type='hidden' value='ShowReservationsCommand' name='command'>
                                <button class='submitLink' type='submit'>Mis Reservas</button>
                            </form>
                        </li>
                        <li class="divider"></li>
                        <li>    
                            <form method='post' action='FrontControllerServlet' class='form-horizontal' role='form'>
                                <input type='hidden' value='LogOutCommand' name='command'>
                                <input type='submit' class='submitLink' name='logout' value='Cerrar sesi�n'>
                            </form>
                        </li>
                        <% } %>
                    </ul>
                </li>
                <li class="dropdown">
                    <% if(session.getAttribute("session") != null) { %>
                        <% ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); %>
                        <a href="FrontControllerServlet?command=ShowCartCommand" role="button"> <span class="glyphicon glyphicon-shopping-cart"></span> <% out.print(cart.getCart().size()); %></a>
                    <% } %>
                </li>
            </ul>
        </div>
    </nav>
</div>