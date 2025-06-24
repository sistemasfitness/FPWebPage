<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="loginregister.ascx.cs" Inherits="WebPage.controls.loginregister" %>

<!-- Login modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myLogin" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-popup">
            <a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
            <form action="mainAfil" class="popup-form" id="myLogin" method="post">
                <input type="text" class="form-control form-white" placeholder="Email" id="email" name="email">
                <input type="text" class="form-control form-white" placeholder="Clave" id="clave" name="clave">
                <div class="checkbox-holder text-left">
                    <div class="checkbox">
                        <input type="checkbox" value="accept_1" id="check_1" name="check_1" />
                        <label for="check_1">
                            <span>Acepto los <strong>Términos &amp; Condiciones</strong></span>
                        </label>
                    </div>
                </div>
                <button type="submit" class="btn btn-submit">Ingresar</button>
            </form>
        </div>
    </div>
</div>