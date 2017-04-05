$(document).ready(function(){

    $('#form_registration').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight",
        onAjaxFormComplete: function(form, status, resposta, options){

            var nova_modal = $('<div id="dialog-modal" title="Login"><p>'+resposta.msg+'</p></div>')
                
            nova_modal.dialog({
                height: 186,
                width: 390,
                modal: true,
                buttons: {
                    Ok: function(dados) {
                        
                        $( this ).dialog( "close" );
                        if(resposta.sucesso == 'true'){
                            window.location = resposta.novaPagina
                        }
                        
                    }
                }
            });
        }
    });
    
    
    $('#form_registo').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight",
        onAjaxFormComplete: function(form, status, resposta, options){

            var nova_modal = $('<div id="dialog-modal" title="Registo"><p>'+resposta.msg+'</p></div>')
                
            nova_modal.dialog({
                height: 300,
                width: 550,
                modal: true,
                buttons: {
                    Ok: function(dados) {
                        $( this ).dialog( "close" );
                        if(resposta.sucesso == true){
                            window.location = resposta.novaPagina
                        }
                        
                    }
                }
            });
        }
    });
    
    $('#form_registo_subscritor').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight",
        onAjaxFormComplete: function(form, status, resposta, options){

            var nova_modal = $('<div id="dialog-modal" title="Registo"><p>'+resposta.msg+'</p></div>')
                
            nova_modal.dialog({
                height: 160,
                width: 400,
                modal: true,
                buttons: {
                    Ok: function(dados) {
                        $( this ).dialog( "close" );
                        if(resposta.sucesso == true){
                            window.location = resposta.novaPagina
                        }
                        
                    }
                }
            });
        }
    });
    
    $('#form_add_subscritores').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight",
        onAjaxFormComplete: function(form, status, resposta, options){

            var nova_modal = $('<div id="dialog-modal" title="Adicionar subscritores"><p>'+resposta.msg+'</p></div>')
                
            nova_modal.dialog({
                height: 150,
                width: 400,
                modal: true,
                buttons: {
                    Ok: function(dados) {
                        $( this ).dialog( "close" );
                        if(resposta.sucesso == true){
                            window.location = resposta.novaPagina
                        }
                        
                    }
                }
            });
        }
    });
    
    $('#form_altera_dados').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight",
        onAjaxFormComplete: function(form, status, resposta, options){

            var nova_modal = $('<div id="dialog-modal" title="Alteração dos seus dados"><p>'+resposta.msg+'</p></div>')
                
            nova_modal.dialog({
                height: 150,
                width: 400,
                modal: true,
                buttons: {
                    Ok: function(dados) {
                        $( this ).dialog( "close" );
                        if(resposta.sucesso == true){
                            window.location = resposta.novaPagina
                        }
                        
                    }
                }
            });
        }
    });
    
    $('#form_cria_campanha').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight",
        onAjaxFormComplete: function(form, status, resposta, options){

            var nova_modal = $('<div id="dialog-modal" title="Criação de campanha"><p>'+resposta.msg+'</p></div>')
                
            nova_modal.dialog({
                height: 170,
                width: 400,
                modal: true,
                buttons: {
                    Ok: function(dados) {
                        $( this ).dialog( "close" );
                        if(resposta.sucesso == true){
                            window.location = resposta.novaPagina
                        }
                        
                    }
                }
            });
        }
    });
    
    $('#form_cria_grupo').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight",
        onAjaxFormComplete: function(form, status, resposta, options){

            var nova_modal = $('<div id="dialog-modal" title="Criação do novo grupo"><p>'+resposta.msg+'</p></div>')
                
            nova_modal.dialog({
                height: 220,
                width: 400,
                modal: true,
                buttons: {
                    Ok: function(dados) {
                        $( this ).dialog( "close" );
                        if(resposta.sucesso == true){
                            window.location = resposta.novaPagina
                        }
                        
                    }
                }
            });
        }
    });
    
    $('#form_pass').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight",
        onAjaxFormComplete: function(form, status, resposta, options){

            var nova_modal = $('<div id="dialog-modal" title="Alteração de password"><p>'+resposta.msg+'</p></div>')
                
            nova_modal.dialog({
                height: 200,
                width: 500,
                modal: true,
                buttons: {
                    Ok: function(dados) {
                        
                        $( this ).dialog( "close" );
                        if(resposta.sucesso == 'true'){
                            window.location = resposta.novaPagina
                        }
                        
                    }
                }
            });
        }
    });
    
    $('#form_recuperar').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight",
        onAjaxFormComplete: function(form, status, resposta, options){

            var nova_modal = $('<div id="dialog-modal" title="Recupecao dos seus dados"><p>'+resposta.msg+'</p></div>')
                
            nova_modal.dialog({
                height: 160,
                width: 500,
                modal: true,
                buttons: {
                    Ok: function(dados) {
                        
                        $( this ).dialog( "close" );
                        if(resposta.sucesso == true){
                            window.location = resposta.novaPagina
                        }
                        
                    }
                }
            });
        }
    });
    
    $('#users_empresa').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight",
        onAjaxFormComplete: function(form, status, resposta, options){

            var nova_modal = $('<div id="dialog-modal" title="Subscritores"><p>'+resposta.msg+'</p></div>')
                
            nova_modal.dialog({
                height: 160,
                width: 500,
                modal: true,
                buttons: {
                    Ok: function(dados) {
                        
                        $( this ).dialog( "close" );
                        if(resposta.sucesso == true){
                            window.location = resposta.novaPagina
                        }
                        
                    }
                }
            });
        }
    });
    

    $('#form').validationEngine({
        ajaxFormValidation:true,
        promptPosition : "centerRight"
    });
    
    
    

});