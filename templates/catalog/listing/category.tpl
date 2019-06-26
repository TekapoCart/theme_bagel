{if $category.id == 3}{* 產品系列 *}

    {block name='content'}
        {if isset($subcategories)}
            <div class="nav-placeholder"></div>
            <div class="squares">
                {foreach from=$subcategories item=subcategory}
                    <article>
                        <a href="{$subcategory.url}">
                            <h2 class="highlight">{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}</h2>
                            <img src="{$subcategory.image.small.url}" width="300" height="300">
                            <div class="overlay"><span>more</span></div>
                        </a>
                    </article>
                {/foreach}
            </div>
        {/if}
    {/block}

{elseif $category.id_parent == 3}{* 產品系列的子分類 *}

    {block name='content'}
        <div class="square intro dark">
            {block name='breadcrumb'}
                {include file='_partials/breadcrumb.tpl'}
            {/block}
            <h1 class="highlight">{$category.name}</h1>
            <div class="description highlight">
                <p>{$category.description nofilter}</p>
            </div>
        </div><!-- end of square intro -->

        {if $category.image.large.url}
            <div id="_desktop_product_figure">
                <div class="figures">
                    <div class="figure" style="background-image: url({$category.image.large.url})"></div>
                </div>
            </div>
            <div id="_mobile_product_figure"></div>
        {/if}
        <div class="square lead">
            <h4>{$category.name}</h4><h5>products</h5>
        </div>
        {block name='product_list'}
            {include file='catalog/_partials/products.tpl' listing=$listing}
        {/block}
    {/block}

{else}

    {extends file='catalog/listing/product-list.tpl'}
    {block name='product_list'}
        <div class="nav-placeholder"></div>
        {include file='catalog/_partials/products.tpl' listing=$listing}
    {/block}

{/if}


