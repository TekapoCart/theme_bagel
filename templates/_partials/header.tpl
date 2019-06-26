{block name='header_banner'}
    <div class="header-banner">
        {hook h='displayBanner'}
    </div>
{/block}

<div id="nav">
    {hook h='displayNav1'}
    <div id="header">
        <div class="header-nav">
            <div class="right-nav">
                {hook h='displayNav2'}
            </div>
        </div>
    </div>
</div>
<div id="right-bar">
    {if $page.page_name == 'index'}
        <div id="imagesliders-pager">
            <div class="chevron up hidden-sm-down"><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"viewBox="0 0 404.258 404.258" xml:space="preserve"><polygon class="fill" points="138.331,0 114.331,18 252.427,202.129 114.331,386.258 138.331,404.258 289.927,202.129 "/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg></div>
            <ul></ul>
            <div class="chevron down hidden-sm-down"><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"viewBox="0 0 404.258 404.258" xml:space="preserve"><polygon class="fill" points="138.331,0 114.331,18 252.427,202.129 114.331,386.258 138.331,404.258 289.927,202.129 "/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg></div>
        </div>
    {else}
        {hook h='displayTop'}
    {/if}
</div>





