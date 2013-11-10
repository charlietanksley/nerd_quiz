App.Router.map(function(){
  this.route('quiz');
});

App.Router.reopen({
  location: 'history'
});