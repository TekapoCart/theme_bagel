<article class="lead">
    <h4>{$category_name}</h4><h5>products</h5>
</article>
{foreach from=$products item="product"}
    {*include file="catalog/_partials/miniatures/product.tpl" product=$product is_info=true product_id=$product_id*}
    {include file="catalog/_partials/miniatures/product.tpl" product=$product product_id=$product_id}
{/foreach}
