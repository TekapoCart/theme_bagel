{extends file=$layout}

{block name='content'}

    <div id="products">

        {if $listing.products|count}

            <div id="">
                {block name='product_list_top'}
                    {include file='catalog/_partials/products-top.tpl' listing=$listing}
                {/block}
            </div>

            <div id="">
                {block name='product_list'}
                    {include file='catalog/_partials/products.tpl' listing=$listing}
                {/block}
            </div>

            <div id="js-product-list-bottom">
                {block name='product_list_bottom'}
                    {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
                {/block}
            </div>

        {else}

            {include file='catalog/listing/no-result.tpl'}

        {/if}



    </div>
{/block}