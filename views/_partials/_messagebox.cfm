<cfscript>
    switch( msgStruct.type ){
        case "info" : {
            local.cssType = " alert-info";
            local.iconType = "fas fa-info-circle";
            break;
        }
        case "error" : {
            local.cssType = " alert-danger";
            local.iconType = "far fa-frown";
            break;
        }
        default : {
            local.cssType = " alert-warning";
            local.iconType = "fas fa-exclamation-triangle";
        }
    }
</cfscript>
<cfoutput>
<div class="alert#local.cssType#" style="min-height: 38px">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <div class="row">
        <i class="#local.iconType# fa-2x pull-left"></i>
        <p class="col-10">#msgStruct.message#</p>
    </div>
</div>
</cfoutput>