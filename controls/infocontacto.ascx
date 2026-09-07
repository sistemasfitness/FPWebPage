<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="infocontacto.ascx.cs" Inherits="WebPage.controls.infocontacto" %>
<aside class="col-md-4 info-contacto form-web">
    <div class="box_style_2" style="font-weight: 500;">
        <h5 style="font-weight: 800; font-size: 20px;">Información de Contacto</h5>

        <p>Cra. 35A #51-59, Cabecera del llano, Bucaramanga, Santander.</p>

        <a href="https://wa.me/573185483713" style="color: #333333;" target="_blank">(+57) 318 548 3713</a>

        <a href="mailto:liderventadigital@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">liderventadigital@fitnesspeoplecmd.com</a>

        <%--<p>
            Cra. 35A #51-59, Cabecera del llano, Bucaramanga, Santander.<br />
            (+57) 322 687 2886<br />
            <a href="mailto:servicioalcliente@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">servicioalcliente@fitnesspeoplecmd.com</a>
        </p>--%>

        <h5 style="font-weight: 800; font-size: 15px;">Cómo llegar?</h5>

        <form action="https://www.google.com/maps/dir/" method="get" target="_blank">
            <input type="hidden" name="api" value="1">
    
            <div class="form-group">
                <input type="text" 
                       name="origin" 
                       placeholder="Ingresa tu ubicación" 
                       class="form-control styled" 
                       required />

                <input type="hidden" 
                       name="destination" 
                       value="Cra. 35A #51-59, Cabecera del llano, Bucaramanga, Santander" />
            </div>

            <input type="submit" 
                   value="OBTENER RUTA" 
                   class="btn_1 add_bottom_15" />
        </form>
        <hr class="styled" />
        <h5 style="font-weight: 800; font-size: 20px;">Departamentos</h5>
        <ul class="contacts_info">
            <li>
                <h5 style="font-weight: 800; font-size: 15px; margin-bottom: 0">Contabilidad</h5>
                <a href="https://wa.me/573187077584" style="color: #333333;" target="_blank">(+57) 318 707 7584</a>
                <br />
                <a href="mailto:contabilidad@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">contabilidad@fitnesspeoplecmd.com</a>
                <br />
                <small>Lunes a Viernes de 9:00 a.m a 6:00 p.m</small>
            </li>
            <li>
                <h5 style="font-weight: 800; font-size: 15px; margin-bottom: 0">Área Comercial</h5>
                <a href="https://wa.me/573138859790" style="color: #333333;" target="_blank">(+57) 313 885 9790</a>
                <br />
                <a href="mailto:directorcomercial@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">directorcomercial@fitnesspeoplecmd.com</a>
                <br />
                <small>Lunes a Sábado de 8:00 a.m a 7:00 p.m</small>
            </li>
            <li>
                <h5 style="font-weight: 800; font-size: 15px; margin-bottom: 0">Ejecutivo Corporativo</h5>
                <a href="https://wa.me/573006859461" style="color: #333333;" target="_blank">(+57) 300 685 9461</a>
                <br />
                <a href="mailto:lidercorporativo@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">lidercorporativo@fitnesspeoplecmd.com</a>
                <br />
                <small>Lunes a Sábado de 8:00 a.m a 7:00 p.m</small>
            </li>
        </ul>
    </div>
</aside>
