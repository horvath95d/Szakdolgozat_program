document.querySelectorAll('.topic').forEach(e => {
    e.addEventListener('click', event => {
        var topics = document.querySelectorAll('.topic:not(.collapsed)');        
        
        topics.forEach(element => {
            if (e != element) {
                element.classList.add('collapsed');
                element.nextElementSibling.classList.remove('show');
            }
        });
    })
});