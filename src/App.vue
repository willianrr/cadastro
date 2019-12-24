<template>
    <div id="app">
        <Vhome/>
    </div>
</template>

<script>
    import Vhome from './components/V-home.vue'

    export default {
        name: 'app',
        components: {
            Vhome
        },
        data() {
            return {

            }
        }
    }
</script>

<style>
    #app {
        background-color: #fafafa;
        width: 100%;
        height: 100vh;
    }
</style>
