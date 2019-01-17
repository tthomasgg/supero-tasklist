$(function(){
    $(".fa-edit,.fa-trash-alt").on('mouseover', function(){
        $(this).addClass('fas');
        $(this).removeClass('far');
    });


    $(".fa-edit,.fa-trash-alt").on('mouseleave', function(){
        $(this).addClass('far');
        $(this).removeClass('fas');
    });

    /*$( "#sortable" ).sortable({
        revert: true
    });

    $( "#draggable" ).draggable({
        connectToSortable: "#sortable",
        helper: "clone",
        revert: "invalid"
    });

    $( "#sortable, .list-group-item.list-group-item-action" ).disableSelection();*/

    $( "#sortable" ).sortable({
        revert: true
      });
      $( "#draggable" ).draggable({
        connectToSortable: "#sortable",
        helper: "clone",
        revert: "invalid"
      });
      $( "ul, li" ).disableSelection();
      $( "#sortable" ).sortable({
        cancel: '.disabled',
        items: ".list-group-item:not(.disabled)",
        update: function(event, ui){
            var id = $(ui.item[0]).data('id');
            //posicao + 1 pois index() retorna 0 para primeira posicao
            var pos = $(ui.item[0]).index('.list-group-item.list-group-item-action')+1;
            var args = {"id" : id, "pos" : pos};

            $.ajax({
                'url' : 'atualizaPosicoes.jsp',
                'data' : args,
                success : function(data) {
                    console.log(data);
                }
            })
        }
      });      

})