App.Router.map(function(){
  this.resource('hello', { path: '/hellos/:hello_id' });
});

App.Router.reopen({
  location: 'history'
});