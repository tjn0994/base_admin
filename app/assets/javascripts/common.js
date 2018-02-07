$(document).ready(function(){
  search("#category_search", "#q_code_or_name_or_description_cont");
});

function search(form_id, id) {
  $("input" + id).keyup(function(e) {
    $.get($(form_id).attr('action'), $('#category_search').serialize(), null, 'script');
  });
}
