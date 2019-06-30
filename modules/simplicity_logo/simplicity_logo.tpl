{if $display_type == 'text' }
    <h1 class="title">
        <a class="logo" href="{if $language.iso_code == 'tw'}{$urls.base_url}{else}{$urls.base_url}{$language.iso_code}{/if}">{if (!empty($display_font)) }<span style="font-family: {$display_font}">{$display_text}</span>{else}{$display_text}{/if}</a>
    </h1>
{else}
    <h1 class="title">
        <a href="{if $language.iso_code == 'tw'}{$urls.base_url}{else}{$urls.base_url}{$language.iso_code}{/if}">
            <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
        </a>
    </h1>
{/if}