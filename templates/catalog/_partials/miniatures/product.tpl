{block name='product_miniature_item'}
    <article data-sticker="{$product.sticker}" class="product-miniature js-product-miniature {if isset($cssClass)}{$cssClass}{/if}" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
        {if strlen($product.sticker) > 0}<div class="sticker" style="background-image: url('/img/cms/sticker/{$product.sticker}');"></div>{/if}
        {if $product_id !== $product.id}<a href="{$product.url}">{/if}
        <h3>{$product.name|truncate:70:'...'}</h3>
        <img src="{$product.cover.bySize.home_default.url}" style="padding: 25px;">
        <div class="overlay{if $is_info} info{/if}{if $product_id == $product.id} on{/if}"><span>{if $is_info}info{else}more{/if}</span></div>
        {if $product_id !== $product.id}</a>{/if}
    </article>
{/block}