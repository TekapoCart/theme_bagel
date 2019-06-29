{extends file='page.tpl'}

{block name='page_header_container'}
    <div class="page-header">
        <h1>{$page.meta.title}</h1>
    </div>
{/block}

{block name='page_content'}
    {widget name="contactform"}
{/block}
