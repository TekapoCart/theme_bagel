<div id="_desktop_language_selector">
    <div class="language-selector-wrapper">
        <div class="language-selector dropdown js-dropdown">
            <button data-target="#" data-toggle="dropdown" class="btn-unstyle" aria-haspopup="true" aria-expanded="false" aria-label="{l s='Language dropdown' d='Shop.Theme.Global'}">
                <i class="material-icons language">language</i>
            </button>
            <ul class="dropdown-menu" aria-labelledby="language-selector-label">
                {foreach from=$languages item=language}
                    <li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
                        <a href="{url entity='language' id=$language.id_lang}" rel="nofollow" class="dropdown-item" data-iso-code="{$language.iso_code}">{$language.name_simple}</a>
                    </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div>