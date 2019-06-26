{extends file='page.tpl'}

{block name='page_title'}
    {$cms_category.name}
{/block}

{block name='page_content_container'}
    <section id="content" class="page-content page-category page-category-{$cms_category.id}">

        {if $cms_category.description }
            <div class="cms-category-desc">{$cms_category.description}</div>
        {/if}

        {block name='page_content'}
            {block name='cms_sub_pages'}
                {if $cms_pages}
                    <ul class="cms-page-list">
                        {foreach from=$cms_pages item=cms_page}
                            <li class="cms-page-item">
                                <a href="{$cms_page.link}">
                                    {if isset($cms_page.image)}<img src="{$cms_page.image}">{/if}
                                    <div class="cms-page-title">{$cms_page.meta_title}</div>
                                    {if $cms_page.meta_description}<div class="cms-page-desc">{$cms_page.meta_description|truncate:70:'...'}</div>{/if}
                                </a>
                            </li>
                        {/foreach}
                    </ul>
                    <div class="clearfix"></div>
                {/if}
            {/block}
        {/block}

    </section>
{/block}