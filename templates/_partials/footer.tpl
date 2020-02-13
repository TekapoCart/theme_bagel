{block name='hook_footer_before'}
    {hook h='displayFooterBefore'}
{/block}

{block name='hook_footer'}
    {hook h='displayFooter'}
{/block}

{* copyright 版權聲明 *}
{block name='copyright_link'}
    <div class="copyright">
        Copyright &copy; {$smarty.now|date_format:"%Y"} <a href="{$urls.base_url}" target="_blank">{$shop.name}</a><br>
        Powered by <a href="https://www.tekapo.io/" target="_blank" rel="noreferrer">TekapoCart</a>
    </div>
{/block}

<div class="text-xs-right">
    <a href="javascript:void()" class="back-top" title="{l s='Back to top' d='Shop.Theme.Actions'}">
        <span><i class="material-icons">arrow_drop_up</i></span>
    </a>
</div>

{block name='hook_footer_after'}
    {hook h='displayFooterAfter'}
{/block}
