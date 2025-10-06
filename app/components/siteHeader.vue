<script setup lang="ts">
// Navigation items for the main menu (desktop + mobile)
interface BasicNavItem {
  label: string
  to: string
  icon?: string
}
// Mutable array so it matches prop type expectations
const navItems: BasicNavItem[] = [
  { label: 'Home', to: '/', icon: 'i-lucide-home' },
  { label: 'Blog', to: '/blog', icon: 'i-lucide-newspaper' },
  { label: 'Projects', to: '/projects', icon: 'i-lucide-rocket' },
  { label: 'About', to: '/about', icon: 'i-lucide-user' }
]

// Dropdown (account) menu groups — array of groups, each group is an array of items
interface DropdownItem {
  label: string
  to?: string
  icon?: string
}
const accountMenu: DropdownItem[][] = [
  [
    { label: 'Profile', to: '/profile', icon: 'i-lucide-user-circle-2' },
    { label: 'Settings', to: '/settings', icon: 'i-lucide-settings' }
  ],
  [
    { label: 'Log in', to: '/login', icon: 'i-lucide-log-in' },
    { label: 'Register', to: '/register', icon: 'i-lucide-user-plus' }
  ]
]
</script>

<template>
  <UHeader class="sticky top-0 z-50 bg-violet-500/90 backdrop-blur text-white">
    <template #left>
      <UContainer class="flex items-center gap-3">
        <NuxtLink to="/" class="flex items-center gap-2 font-semibold">
          <UIcon name="i-lucide-orbit" class="size-5" />
          <span class="hidden sm:inline">fullzer4</span>
        </NuxtLink>
      </UContainer>
    </template>

    <UContainer class="flex justify-center">
      <div class="rounded-full bg-violet-700/70 px-3 py-1 shadow-sm ring-1 ring-white/10">
        <UNavigationMenu
          :items="navItems"
          orientation="horizontal"
          class="text-sm"
          :ui="{
            root: 'text-white',
            // era 'trigger': use 'link' no v4
            link: 'px-3 py-2 rounded-full hover:bg-white/10 focus:outline-none',
            content: 'min-w-[16rem] p-2'
          }"
        />
      </div>
    </UContainer>

    <template #right>
      <UContainer class="flex items-center gap-3">
        <span class="hidden sm:inline-block h-5 w-px bg-white/30" />
        <UDropdownMenu :items="accountMenu">
          <!-- cor semântica válida + utilitárias para texto branco -->
          <UButton variant="ghost" color="neutral" class="hidden sm:inline-flex text-white">
            Log in
          </UButton>
        </UDropdownMenu>

        <UColorModeButton class="hidden sm:inline-flex" />

        <UButton
          to="/contact"
          color="primary"
          variant="solid"
          class="rounded-full font-medium"
        >
          Book a demo
        </UButton>
      </UContainer>
    </template>

    <!-- era #panel -->
    <template #content>
      <div class="px-4 pb-4">
        <UNavigationMenu
          :items="navItems"
          orientation="vertical"
          :ui="{
            root: 'text-white',
            list: 'flex flex-col',
            link: 'px-3 py-2 rounded-xl hover:bg-white/10 text-base'
          }"
        />
        <div class="mt-4 flex items-center gap-3">
          <UButton to="/login" variant="ghost" color="neutral" class="flex-1 text-white">
            Log in
          </UButton>
          <UButton to="/contact" color="primary" class="flex-1">
            Book a demo
          </UButton>
        </div>
      </div>
    </template>
  </UHeader>
</template>
