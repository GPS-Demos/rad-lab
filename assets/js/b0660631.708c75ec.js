"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[267],{3905:(e,t,i)=>{i.d(t,{Zo:()=>d,kt:()=>c});var n=i(7294);function a(e,t,i){return t in e?Object.defineProperty(e,t,{value:i,enumerable:!0,configurable:!0,writable:!0}):e[t]=i,e}function l(e,t){var i=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),i.push.apply(i,n)}return i}function r(e){for(var t=1;t<arguments.length;t++){var i=null!=arguments[t]?arguments[t]:{};t%2?l(Object(i),!0).forEach((function(t){a(e,t,i[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(i)):l(Object(i)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(i,t))}))}return e}function o(e,t){if(null==e)return{};var i,n,a=function(e,t){if(null==e)return{};var i,n,a={},l=Object.keys(e);for(n=0;n<l.length;n++)i=l[n],t.indexOf(i)>=0||(a[i]=e[i]);return a}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(n=0;n<l.length;n++)i=l[n],t.indexOf(i)>=0||Object.prototype.propertyIsEnumerable.call(e,i)&&(a[i]=e[i])}return a}var s=n.createContext({}),u=function(e){var t=n.useContext(s),i=t;return e&&(i="function"==typeof e?e(t):r(r({},t),e)),i},d=function(e){var t=u(e.components);return n.createElement(s.Provider,{value:t},e.children)},p={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},m=n.forwardRef((function(e,t){var i=e.components,a=e.mdxType,l=e.originalType,s=e.parentName,d=o(e,["components","mdxType","originalType","parentName"]),m=u(i),c=a,b=m["".concat(s,".").concat(c)]||m[c]||p[c]||l;return i?n.createElement(b,r(r({ref:t},d),{},{components:i})):n.createElement(b,r({ref:t},d))}));function c(e,t){var i=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var l=i.length,r=new Array(l);r[0]=m;var o={};for(var s in t)hasOwnProperty.call(t,s)&&(o[s]=t[s]);o.originalType=e,o.mdxType="string"==typeof e?e:a,r[1]=o;for(var u=2;u<l;u++)r[u]=i[u];return n.createElement.apply(null,r)}return n.createElement.apply(null,i)}m.displayName="MDXCreateElement"},1215:(e,t,i)=>{i.r(t),i.d(t,{assets:()=>s,contentTitle:()=>r,default:()=>p,frontMatter:()=>l,metadata:()=>o,toc:()=>u});var n=i(7462),a=(i(7294),i(3905));const l={sidebar_position:5,title:"05 - Publishing Modules"},r="Publishing Modules",o={unversionedId:"rad-lab-ui/ui_installation/publishing-modules",id:"rad-lab-ui/ui_installation/publishing-modules",title:"05 - Publishing Modules",description:"No modules will be available for Users to deploy until an Admin publishes them.",source:"@site/docs/rad-lab-ui/ui_installation/publishing-modules.md",sourceDirName:"rad-lab-ui/ui_installation",slug:"/rad-lab-ui/ui_installation/publishing-modules",permalink:"/rad-lab/docs/rad-lab-ui/ui_installation/publishing-modules",draft:!1,tags:[],version:"current",sidebarPosition:5,frontMatter:{sidebar_position:5,title:"05 - Publishing Modules"},sidebar:"tutorialSidebar",previous:{title:"04 - Web Application",permalink:"/rad-lab/docs/rad-lab-ui/ui_installation/frontend"},next:{title:"06 - Cleanup Environment",permalink:"/rad-lab/docs/rad-lab-ui/ui_installation/cleanup"}},s={},u=[{value:"Global Admin Variables",id:"global-admin-variables",level:2},{value:"Email Notifications",id:"email-notifications",level:4},{value:"Module Admin Variables",id:"module-admin-variables",level:2}],d={toc:u};function p(e){let{components:t,...i}=e;return(0,a.kt)("wrapper",(0,n.Z)({},d,i,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("h1",{id:"publishing-modules"},"Publishing Modules"),(0,a.kt)("admonition",{title:"Important",type:"danger"},(0,a.kt)("p",{parentName:"admonition"},"No modules will be available for Users to deploy until an Admin publishes them.")),(0,a.kt)("h2",{id:"global-admin-variables"},"Global Admin Variables"),(0,a.kt)("p",null,"Some variables are common to all modules. Upon first log in, and Admin will set these variables, so that users will not need to add them. These include (but not limited to):"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"Billing ID"),(0,a.kt)("li",{parentName:"ul"},"Organization ID (without ",(0,a.kt)("inlineCode",{parentName:"li"},"organizations/"),"-prefix)"),(0,a.kt)("li",{parentName:"ul"},"Folder ID (without ",(0,a.kt)("inlineCode",{parentName:"li"},"folders/"),"-prefix)"),(0,a.kt)("li",{parentName:"ul"},"Email Notification(enable/disable email notifications)")),(0,a.kt)("h4",{id:"email-notifications"},"Email Notifications"),(0,a.kt)("p",null,"You can optionally enable RAD Lab notification for deployment events. This includes deployment creations, updates, and deletions."),(0,a.kt)("p",null,"If enabled, the following users/groups (defined in the module's Terraform variables) will receive email notifications:"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"The individual taking the action"),(0,a.kt)("li",{parentName:"ul"},(0,a.kt)("inlineCode",{parentName:"li"},"trusted_users")),(0,a.kt)("li",{parentName:"ul"},(0,a.kt)("inlineCode",{parentName:"li"},"trusted_groups")),(0,a.kt)("li",{parentName:"ul"},(0,a.kt)("inlineCode",{parentName:"li"},"owner_users")),(0,a.kt)("li",{parentName:"ul"},(0,a.kt)("inlineCode",{parentName:"li"},"owner_groups"))),(0,a.kt)("p",null,"Currently only sending via gmail is supported. It is recommended to ",(0,a.kt)("a",{parentName:"p",href:"https://support.google.com/mail/answer/56256?hl=en"},"create a new gmail address")," for this purpose only and generate an ",(0,a.kt)("inlineCode",{parentName:"p"},"App Password")," to authenticate it by following ",(0,a.kt)("a",{parentName:"p",href:"https://support.google.com/mail/answer/185833?hl=en"},"these directions"),"."),(0,a.kt)("p",null," You will then provide this email and its password to RAD Lab UI via the ",(0,a.kt)("inlineCode",{parentName:"p"},"Global Variables")," setup."),(0,a.kt)("p",null,"The email address will be store in Firestore, and email password will be securely stored in Google's ",(0,a.kt)("a",{parentName:"p",href:"https://cloud.google.com/secret-manager"},"Secret Manager")),(0,a.kt)("h2",{id:"module-admin-variables"},"Module Admin Variables"),(0,a.kt)("p",null,"Lastly, some modules have specific requirements for variables that typical Users may not know, understand how to obtain, or even be authorized to access."),(0,a.kt)("p",null,"Once an Admin tries to publish a module, if the module requires any of these variables, the Admin will be prompted. These values will be saved in Firestore and inaccessible to Users."),(0,a.kt)("p",null,"When a User deploys a module, Global and Module Admin Variables will be combined with the variables the User provided and passed to Terraform for execution (User variables supersede all other variables of the same name, and Module Admin variable supersede Global Admin variables of the same name)."))}p.isMDXComponent=!0}}]);