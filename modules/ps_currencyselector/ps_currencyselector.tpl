<div id="_desktop_currency_selector">
    <div class="currency-selector-wrapper">
        <div class="currency-selector dropdown js-dropdown">
            <button data-target="#" data-toggle="dropdown" class="btn-unstyle" aria-haspopup="true" aria-expanded="false" aria-label="{l s='Currency dropdown' d='Shop.Theme.Global'}">
                <i class="material-icons attach_money">attach_money</i>
            </button>
            <ul class="dropdown-menu" aria-labelledby="currency-selector-label">
                {foreach from=$currencies item=currency}
                    <li {if $currency.current} class="current" {/if}>
                        <a title="{$currency.name}" rel="nofollow" href="{$currency.url}" class="dropdown-item">{$currency.iso_code} {$currency.name}{*$currency.sign*}</a>
                    </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div>
