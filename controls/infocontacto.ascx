<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="infocontacto.ascx.cs" Inherits="WebPage.controls.infocontacto" %>
<aside class="col-md-4">
    <div class="box_style_2">
        <h5 style="font-weight: 900;">Información de Contacto</h5>
        <p>
            Calle 45 No. 35 - 23 Piso 2<br />
            (+57) 318 707 7584<br />
            <a href="mailto:fp_info@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">fp_info@fitnesspeoplecmd.com</a>
        </p>
        <h5 style="font-weight: 900;">Cómo llegar?</h5>
        <form action="http://maps.google.com/maps" method="get" target="_blank">
            <div class="form-group">
                <input type="text" name="saddr" placeholder="Ingresa tu ubicación" class="form-control styled" />
                <input type="hidden" name="daddr" value="Fitness People centro administrativo, Cl. 45 #35 23 piso 2, Cabecera del llano, Bucaramanga, Santander" />
                <!-- Write here your end point -->
            </div>
            <input type="submit" value="OBTENER RUTA" class="btn_1 add_bottom_15" />
        </form>
        <hr class="styled" />
        <h5 style="font-weight: 900;">Departamentos</h5>
        <ul class="contacts_info">
            <li><strong>Contabilidad</strong><br>
                <a href="https://wa.me/573187077584" style="color: #333333;" target="_blank">(+57) 318 707 7584</a>
                <br />
                <a href="mailto:contabilidad@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">contabilidad@fitnesspeoplecmd.com</a>
                <br />
                <small>Lunes a Viernes 9am - 6pm</small>
            </li>
            <li><strong>Área Comercial</strong><br>
                <a href="https://wa.me/573138859790" style="color: #333333;" target="_blank">(+57) 313 885 9790</a>
                <br />
                <a href="mailto:comercial@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">comercial@fitnesspeoplecmd.com</a>
                <br />
                <small>Lunes a Sábado 8am - 7pm</small>
            </li>
            <li><strong>Ejecutivo Corporativo</strong><br>
                <a href="https://wa.me/573006859461" style="color: #333333;" target="_blank">(+57) 300 685 9461</a>
                <br />
                <a href="mailto:lidercorporativa@fitnesspeoplecmd.com" style="color: #333333; text-decoration: underline;">lidercorporativa@fitnesspeoplecmd.com</a>
                <br />
                <small>Lunes a Sábado 8am - 7pm</small>
            </li>
        </ul>
    </div>
</aside>
