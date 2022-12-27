resource "local_file" "template_file" {
 filename  = format("${path.module}/templates/deid.tpl")
   content   = templatefile("${path.module}/templates/sample.tpl", {       
display_name= "$${display_name}"
description= "$${description}"
crypto_key= "$${crypto_key}"
wrapped_key= "$${wrapped_key}"
template_id= "$${template_id}"
fields=var.fields
  
   })
 }

 