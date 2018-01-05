$(document).on('change', '.navigation-quick-select', function() {
  window.location = $(this).val();
});

$(document).ready(function() {
  $('.datepicker').datepicker({ dateFormat: "dd-mm-yy"});

  $('.single-colorbox').colorbox();

  if (Modernizr.mq('only screen and (min-width: 1024px)')) {
    $('.iframe-colorbox').colorbox({
      iframe: true,
      scrolling: true,
      width: '50px',
      height: '50px'
    });
  }

  $('.searchable-select').select2({
    placeholder: "Please select"
    //allowClear: true
  });

  $('.multiselect').multiSelect({
    selectableOptgroup: true,
    selectableHeader: '<input type="text" class="multiselect-search-input" autocomplete="off" placeholder="Search">',
    selectionHeader: '<input type="text" class="multiselect-search-input" autocomplete="off" placeholder="Search">',
    afterInit: function(ms){
      var that = this,
          $selectableSearch = that.$selectableUl.prev(),
          $selectionSearch = that.$selectionUl.prev(),
          selectableSearchString = '#'+that.$container.attr('id')+' .ms-elem-selectable:not(.ms-selected)',
          selectionSearchString = '#'+that.$container.attr('id')+' .ms-elem-selection.ms-selected';

      that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
      .on('keydown', function(e){
        if (e.which === 40){
          that.$selectableUl.focus();
          return false;
        }
      });

      that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
      .on('keydown', function(e){
        if (e.which == 40){
          that.$selectionUl.focus();
          return false;
        }
      });
    },
    afterSelect: function(){
      this.qs1.cache();
      this.qs2.cache();
    },
    afterDeselect: function(){
      this.qs1.cache();
      this.qs2.cache();
    }
  });

  /*
  $(".module-sortable").sortable({
    containment: '.ui-sortable',
    items: '.module-list-index',
    axis:'y',
    update: function() {
    $.ajax({
        type: "post",
        data: 'model=' + $('.ui-sortable').attr('data-module') + '&' + $(this).sortable("serialize"),
        dataType: "script",
        complete: sortableComplete,
        url: "/admin/reorder"
      });
    }
  });
  */

  $(".module-sortable").sortable({
     containment: 'parent',
      axis:'y',
      update: function() {
      $.ajax({
          type: "post",
          data: 'model=' + $(this).data('module') + '&' + $(this).sortable("serialize"),
          dataType: "script",
          complete: sortableComplete,
          url: "/admin/reorder"
        });
      }
    });

  $(".navigation-sortable").sortable({
    containment: 'parent',
    items: '.menu-item',
    axis:'y',
    update: function() {
    $.ajax({
        type: "post",
        data: $(this).closest('.navigation-sortable').sortable("serialize"),
        dataType: "script",
        complete: sortableComplete,
        url: $(this).closest('.navigation-sortable').data('sortable-path')
      });
    }
  });

  $(".ui-sortable").disableSelection();

  $('.slick-image-selector').slick({
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 3,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 3
        }
      },
      {
        breakpoint: 480,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 1
        }
      }
    ]
  });
});


function enableTabs() {
  $('.tabs').tabs({
    create: function(event, ui) { $('.tabs').removeClass('prevent-flash');  },
    activate: function() { equalHeight(); }
  });

  $('.field_with_errors').each(function(){
    var id = $(this).closest('fieldset').attr('id');

    if(id !== undefined) {
      $('a[href="#' + id + '"]').css('color', '#ff5a5a');
    }
  });
}

if (Modernizr.mq('only screen and (min-width: 1024px)')) {
  $(document).ready(function() {
    enableTabs();
    $('.tabs').prepend('<a class="enable-tabs" href="#" style="display:none";>Enable tabs <span class="octicon octicon-chevron-up"></span></a>');
  });



  $(document).on('click', '.destroy-tabs', function() {
    $('.' + $(this).attr('data-class')).tabs('destroy');
    $('.tab-list a').each(function() {
      $($(this).attr('href')).prepend('<legend>' + $(this).text() + '</legend>');
    });
    $('.tab-list, .destroy-tabs').hide();
    $('.enable-tabs').removeAttr('style');
    $('form').removeClass('form-has-tabs');
    equalHeight();
  });

  $(document).on('click', '.enable-tabs', function() {
    enableTabs();
    $('.enable-tabs').hide();
    $('.tab-list, .destroy-tabs').show();
    $('.tabs legend').remove();
  });
} else {
  $(document).ready(function() {
    $('.tab-list').hide();

    $('.tab-list a').each(function() {
      $($(this).attr('href')).prepend('<legend>' + $(this).text() + '</legend>');
    });
  });
}

function sortableComplete() {
  $('.odd, .even').removeClass('odd even');
  $('.module-list-index:odd').addClass('odd');
  $('.module-list-index:even').addClass('even');
  $('.module-list-index:not(.module-list-index.header)').effect("highlight", { color: '#86cccc' }, 500);
}

$(document).on('click', '.deselect-multiple-select', function() {
  $(this).closest('.field').find('.multiple-select').multipleSelect('uncheckAll');
  return false;
});
