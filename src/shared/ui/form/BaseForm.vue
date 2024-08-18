<script setup></script>

<template>
    <form :class="BaseForm.form">
        <slot></slot>
    </form>
</template>

<style module="BaseForm">
.form {
    padding: 8px;

    display: inline-block;
}
</style>
