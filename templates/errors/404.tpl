{extends file='page.tpl'}

{block name='page_content_container'}
    {block name='page_content'}
        <div class="text-xs-center">
            <div class="image-wrapper">
                <img src="{$urls.theme_assets}img/404.png">
                <h1>404</h1>
                <div>Sorry, the item you are looking for<br>is not on this planet anymore.</div>
            </div>
            <br>
            <a href="{$urls.pages.index}" class="btn btn-secondary">{l s='Back' d='messages'}{l s='Home' d='Shop.Theme.Global'}</a>
        </div>
    {/block}
{/block}