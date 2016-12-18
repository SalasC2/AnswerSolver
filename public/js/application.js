$(document).ready(function() {
  bindEventListener();
});

var bindEventListener = function() {
  newForm();
  submitQuestion();
}

var newForm = function() {
  $('.new-q').on('click', function(event) {
    event.preventDefault();
    var question = this;

    var route = $.ajax({
      url: "/questions/new",
      method: 'GET'
    });

    route.done(function(res){
      $(".new-question").append(res);
      $('.new-q').hide();
    });
  });
}

var submitQuestion = function(){
  $('.new-question').on('submit', '.submitQIndex', function(event){
    event.preventDefault();

    var route = $(this).attr('action');
    var data = $(this).serialize();

    var submit = $.ajax({
      url: route,
      method: "POST",
      data: data
    });

    submit.done(function(res){
      $('.questions').append(res);
      $('.form-title').remove();
      $('.new-q').show();
    });
  });
}
