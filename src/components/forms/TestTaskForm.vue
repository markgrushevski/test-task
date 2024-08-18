<script setup>
import { computed, ref } from 'vue';
import { BaseForm, BaseSelect } from '@shared/ui';
import { townsExample, workshopsExample, employeesExample, brigadesExample, turnsExample } from './example-data.js';

const formDataCookieKey = 'test-task-form-data';

const formData = ref({
    town: null,
    workshop: null,
    employee: null,
    brigade: null,
    turn: null
});

const filteredWorkshops = computed(() => {
    const selectedTownId = formData.value.town?.id;
    return workshopsExample.filter((workshop) => workshop.townId === selectedTownId);
});

const filteredEmployee = computed(() => {
    const selectedWorkshopId = formData.value.workshop?.id;
    return employeesExample.filter((employee) => employee.workshopId === selectedWorkshopId);
});

const isFormDataCorrect = computed(() => {
    return Object.values(formData.value).every((value) => value);
});

function saveFormData() {
    if (!isFormDataCorrect.value) return;

    document.cookie = formDataCookieKey + '=' + JSON.stringify(formData.value);

    // debug
    const cookieFormData = document.cookie.split(';').find((str) => str.includes(formDataCookieKey));
    const cookieFormDataValue = cookieFormData.substring(cookieFormData.indexOf('=') + 1);
    console.debug('Saved form data', JSON.parse(cookieFormDataValue));
}
</script>

<template>
    <BaseForm @submit.prevent="saveFormData">
        <fieldset>
            <legend>Данные для заполнения</legend>
            <BaseSelect v-model="formData.town" :items="townsExample" label="Город" />
            <BaseSelect v-model="formData.workshop" :items="filteredWorkshops" label="Цех" />
            <BaseSelect v-model="formData.employee" :items="filteredEmployee" label="Сотрудник" />
            <BaseSelect v-model="formData.brigade" :items="brigadesExample" label="Бригада" />
            <BaseSelect v-model="formData.turn" :items="turnsExample" label="Смена" />
            <button :disabled="!isFormDataCorrect" type="submit">Сохранить</button>
        </fieldset>
    </BaseForm>
</template>
