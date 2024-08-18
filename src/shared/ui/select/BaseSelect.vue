<script setup>
defineProps({
    items: {
        type: Array,
        required: true
    },
    label: {
        type: String,
        required: false,
        default: 'Выберите значение'
    }
});

const selected = defineModel({ type: Object });
</script>

<template>
    <label>
        {{ label }}:
        <select v-model="selected" :class="BaseSelect.select" :disabled="!items.length">
            <option v-for="item in items" :key="item.id" :value="item">
                {{ item.label }}
            </option>
        </select>
    </label>
</template>

<style module="BaseSelect">
.select {
    margin-bottom: 12px;

    min-height: 2em;

    width: 200px;
    min-width: 150px;

    display: block;
}
</style>
