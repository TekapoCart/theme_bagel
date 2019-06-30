{block name='block_social'}
    <div class="socialfollow block-social">
        <ul>
            {foreach from=$social_links item='social_link'}
                <li class="{$social_link.class}"><a href="{$social_link.url}" target="_blank">{$social_link.label}</a></li>
            {/foreach}
        </ul>
    </div>
    <div class="clearfix"></div>
{/block}