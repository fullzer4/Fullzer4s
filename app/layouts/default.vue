<script setup lang="ts">
import SiteHeader from '~/components/siteHeader.vue'
</script>

<template>
  <div class="min-h-dvh flex flex-col bg-white dark:bg-neutral-950">
    <SiteHeader />

    <main class="flex-1">
      <slot />
    </main>

    <footer class="border-t border-neutral-200/60 dark:border-neutral-800">
      <UContainer class="py-10 text-sm text-neutral-600 dark:text-neutral-400">
        <div class="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
          <p>© {{ new Date().getFullYear() }} Gabriel Pereira — Portfólio & Blog</p>
          <div class="flex items-center gap-4">
            <NuxtLink to="/privacy" class="hover:underline">Privacy</NuxtLink>
            <NuxtLink to="/terms" class="hover:underline">Terms</NuxtLink>
          </div>
        </div>
      </UContainer>
    </footer>
  </div>
</template>
