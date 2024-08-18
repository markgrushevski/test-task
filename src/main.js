import './main.css';
import { createApp } from 'vue';
import TestTaskApp from './TestTaskApp.vue';

const testtaskApp = createApp(TestTaskApp);

testtaskApp.mount('#testtask');
