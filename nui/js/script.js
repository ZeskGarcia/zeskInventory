const app = new Vue({
    el: '#app',
    data: {
        screens: {
            showInventory: false
        },
        inventory: {
            name: null
        },
        Settings: {
            Colors: {
                Inventory: '',
                Label: ''
            }
        },
        Translations: {
            Close: 'Cerrar'
        }
    },
    methods: {
        createInventory(data) {
            this.screens.showInventory = true;
        }
    },
    mounted: function() {
        // Event Listener Code from Jaareet (https://github.com/Jaareet)
        window.addEventListener('message',
            async (data) => this[data.type] && this[data.type](data));
    }
});