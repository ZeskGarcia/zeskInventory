const app = new Vue({
    el: '#app',
    data: {},
    methods: {},
    mounted: function() {
        // Event Listener Code from Jaareet (https://github.com/Jaareet)
        window.addEventListener('message',
            async (data) => this[data.type] && this[data.type](data));
    }
});