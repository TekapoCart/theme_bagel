{block name='footer'}
    {* copyright 版權聲明 *}
    {block name='copyright_link'}
        <div class="copyright">
            Copyright &copy; {$smarty.now|date_format:"%Y"} <a href="{$urls.base_url}" target="_blank">{$shop.name}</a><br>
            Powered by <a href="https://www.tekapo.io/" target="_blank">TekapoCart</a>
        </div>
    {/block}
{/block}