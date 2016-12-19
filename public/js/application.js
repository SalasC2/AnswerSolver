$(document).ready(function() {
  bindEventListener();
});

var bindEventListener = function() {
  newForm();
  submitQuestion();
  editAnswer();
  submitChangeA();
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

var editAnswer = function(){
  $('.e-l-a').on('click', function(event) {
    event.preventDefault();
    var something  = this;
    var route = $(this).attr('href');
    var form = $.ajax({
      url: route,
      method: "GET"
    });

    form.done(function(res){
      $('#edit-link-a').append(res);
      $('.e-l-a').hide();
    });
  });
}

var counter = 1;

var submitChangeA = function() {
  $('#edit-link-a').on("submit", ".submitAIndex", function(){
    event.preventDefault();
    var route = $(this).attr("action");
    var data = $(this).serialize();

    var submit = $.ajax({
      url: route,
      type: "PUT",
      data: data
    });

    submit.done(function(res) {
      $('#answer-id').each(function(i){
        $('<div></div>', {
            "class": "solution",
            "id": "id_" + i
        }).empty().appendTo(".solution");
      });
      $('.edit-answer').remove();
      $('.e-l-a').show();
    });
  });
}
