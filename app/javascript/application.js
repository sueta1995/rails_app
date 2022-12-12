// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

particlesJS.load('particles-js', '/particles.json', function() {
    console.log('callback - particles.js config loaded');
});
