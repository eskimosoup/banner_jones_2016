$(document).ready(function() {
  $('.tinymce').tinymce({
    paste_text_sticky: true,
    paste_text_sticky_default: true,
    relative_urls: false,
    theme: 'modern',
    height: 600,
    plugins: [
      'contextmenu media code link paste autolink hr preview table mantlink optimage lists'
    ],
    contextmenu: "link optimage | inserttable | cell row column deletetable",
    menubar: 'edit insert format table tools',
    toolbar1: 'styleselect | bold italic underline | alignleft aligncenter alignright outdent indent | bullist numlist | subscript superscript strikethrough',
    toolbar2: 'link optimage | preview | hr | code',
    content_css: "/assets/optimadmin/global/editor-59990b01bf289ec42d730def87e787c9255d5bcc533ecf56a44d0a3c958d16c4.css",
    link_list: "/admin/link_list",
    valid_children : "+a[div|h1|h2|h3|h4|h5|h6|p|#text]",
    image_class_list: [
      { title: 'None', value: '' },
      { title: 'Image Left', value: 'image-left' },
      { title: 'Image Right', value: 'image-right' },
    ],
    style_formats: [
      { block: 'h2',  title: 'Header 2' },
      { block: 'h3',  title: 'Header 3' },
      { block: 'h4',  title: 'Header 4' },
      { block: 'h5',  title: 'Header 5' },
      { block: 'h6',  title: 'Header 6' },
      { block: 'p', title: 'Paragraph' },
      { title: 'Image Left', selector: 'img', attributes: { class: 'image-left' }},
      { title: 'Image Right', selector: 'img', attributes: { class: 'image-right' }}
    ],
  });
});
