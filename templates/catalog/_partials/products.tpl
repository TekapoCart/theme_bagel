<div id="js-product-list">
    <div class="squares">
        {foreach from=$listing.products item="product"}
            {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product}
            {/block}
        {/foreach}
    </div>
    <div class="clearfix"></div>

    {block name='pagination'}
        {include file='_partials/pagination.tpl' pagination=$listing.pagination}
    {/block}
</div>

