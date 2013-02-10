console.log('new_doc!');
$("#neww").append("<%= j render 'new_document_form', document: @document %>");
enableTypeahead();