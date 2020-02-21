Return-Path: <SRS0=HGQP=4J=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA50C35644
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 10:09:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A9320722
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 10:09:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SdYMm/SQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A9320722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYmfc37FfMo5h3oAxGmjEa3ZOl4jpA5BO4zmGvbPl0w=; b=SdYMm/SQcoTySL
	G3I1Ztne1igXFdWgKAFbEw01mpPbRzL0C4qrOwbhDFBkXxFQcn2yogddxQfb7lhN+qSl/4PuiTsnA
	DPznNBPp3zCh6cSkk5JjoKXY7jd/2I6xjnVI4Tz402ou9UWGhdz1iHzYFYCbfq/2x+F9CRryDMnqO
	p8Z9AktMFtZQ/G9LiCY95SzuIZzBT6SZl3druFV0Is+z1x9QDio+hUFloxTyfnTuoNe3sfK58vxW1
	l4Pr+sr84Tg9BvaooTTkQmHDbsKdfHcIDWCSe/pqPqXDbFOIx2UkA0hgQzWAqixnnQCp4Idd2QTFv
	LsN6rBW04dxLiHr6BWhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j55FZ-000153-KX; Fri, 21 Feb 2020 10:09:37 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j55FW-00014h-Uu
 for linux-i3c@lists.infradead.org; Fri, 21 Feb 2020 10:09:36 +0000
Received: by mail-ot1-f65.google.com with SMTP id 77so1515880oty.6
 for <linux-i3c@lists.infradead.org>; Fri, 21 Feb 2020 02:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9uswFKJA3UguMUgU3A3OPoWPldnhscfWTGKerHuP5hA=;
 b=auOHCP0ndMyY9hlKH7EZGXAvPUVKl74hJq9wQ8NjjIL4o8f/vQl/CsNte8b8g2CV8R
 Jy7wdcgfLrmspjCqpkGeWC0KHNv4CoQehshFWpBc0buN6HGabHcihzOnQqNkHds7s3TS
 L41RORVkAPGerdW3w7znPrS6u5MYxq0O+7utMcUCzFCh7lxbsg3rz8DTeXBbasaMA/+E
 NcmDYbUIBtHJGFHbo7hNXxk/rfFLGLSqXaHNkP6fFhLuQohwtiUjkgqM3VIf8lAS375+
 CiiklvBUGfaxMz9hJvPlz+y8mZlT7n8+4MNyUEPa/m+pv2hME+jRzDvjgtHNZau/GjZp
 IdpQ==
X-Gm-Message-State: APjAAAVn8xpeKCBqwmBojsvjmvJwURAFuCNT9H3KJLWQIGrSIWb4Q/5K
 2MPt7LUwxIjHpbRHcZC+h5hLo1JkBx677tYJi6o=
X-Google-Smtp-Source: APXvYqx+lR58sJt3zglwXKZApEjdRFMug7P91pMn1BNbGNAivnSC6znljpvev3pzmq+qlYV7M7doYSTCKf1bWzRIf8I=
X-Received: by 2002:a05:6830:1d4:: with SMTP id
 r20mr12990862ota.107.1582279773101; 
 Fri, 21 Feb 2020 02:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-7-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2020 11:09:21 +0100
Message-ID: <CAMuHMdUvADDozCX6Bd0dDVejpTY-k42naEnB7Q5Z6w7Yg94_Vw@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] i2c: of: mark a whole array of regs as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_020934_996279_ECA52ED1 
X-CRM114-Status: GOOD (  17.73  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kieran Bingham <kieran@ksquared.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Luca Ceresoli <luca@lucaceresoli.net>, Linux I2C <linux-i2c@vger.kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Wolfram,

On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Back then, 'reg' properties in I2C DT bindings only contained one
> address and this address was assigned a device and, thus, blocked.
> Meanwhile, chips using multiple addresses are common and the 'reg'
> property can be an array described by 'reg-names'. This code enhances
> I2C DT parsing, so it will reserve all addresses described in an array.
> They will be bound to the 'dummy' driver as 'reserved' iff the first
> address can be assigned successfully. If that is not the case, the array
> is not further considered. If one later address of the array can not be
> assigned, it will be reported but we don't bail out. The driver has to
> decide if that address is critical or not.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One comment below.

> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -21,20 +21,12 @@
>
>  #include "i2c-core.h"
>
> -int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
> +static void of_i2c_decode_board_info(struct device_node *node, u32 addr,
> +                                    bool first_addr, struct i2c_board_info *info)
>  {
> -       u32 addr;
> -       int ret;
> -
>         memset(info, 0, sizeof(*info));
>
> -       ret = of_property_read_u32(node, "reg", &addr);
> -       if (ret) {
> -               pr_err("invalid reg on %pOF\n", node);
> -               return ret;
> -       }
> -
> -       if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
> +       if (!first_addr || of_modalias_node(node, info->type, sizeof(info->type)) < 0)
>                 strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
>
>         if (addr & I2C_TEN_BIT_ADDRESS) {
> @@ -51,11 +43,27 @@ int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
>         info->of_node = node;
>         info->fwnode = of_fwnode_handle(node);
>
> -       if (of_property_read_bool(node, "host-notify"))
> -               info->flags |= I2C_CLIENT_HOST_NOTIFY;
> +       if (first_addr) {
> +               if (of_property_read_bool(node, "host-notify"))
> +                       info->flags |= I2C_CLIENT_HOST_NOTIFY;
> +
> +               if (of_get_property(node, "wakeup-source", NULL))
> +                       info->flags |= I2C_CLIENT_WAKE;
> +       }
> +}
> +
> +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
> +{
> +       u32 addr;
> +       int ret;
> +
> +       ret = of_property_read_u32(node, "reg", &addr);

Perhaps the time is ripe to start considering #address-cells, instead
of assuming 1, here ...

> +       if (ret) {
> +               pr_err("invalid reg on %pOF\n", node);
> +               return ret;
> +       }
>
> -       if (of_get_property(node, "wakeup-source", NULL))
> -               info->flags |= I2C_CLIENT_WAKE;
> +       of_i2c_decode_board_info(node, addr, true, info);
>
>         return 0;
>  }
> @@ -64,21 +72,33 @@ EXPORT_SYMBOL_GPL(of_i2c_get_board_info);
>  static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>                                                  struct device_node *node)
>  {
> -       struct i2c_client *client;
> +       struct i2c_client *client, *first_client = ERR_PTR(-ENOENT);
>         struct i2c_board_info info;
> -       int ret;
> +       bool first_reg = true;
> +       struct property *prop;
> +       const __be32 *cur;
> +       u32 reg;
>
>         pr_debug("register %pOF\n", node);
>
> -       ret = of_i2c_get_board_info(node, &info);
> -       if (ret)
> -               return ERR_PTR(ret);
> +       of_property_for_each_u32(node, "reg", prop, cur, reg) {

... and especially here, if this code can ever be reused for i3c, which uses 3.

> +               of_i2c_decode_board_info(node, reg, first_reg, &info);
> +
> +               client = i2c_new_client_device(adap, &info);
> +               if (IS_ERR(client)) {
> +                       pr_err("failure registering addr 0x%02x for %pOF\n",
> +                               reg, node);
> +                       if (first_reg)
> +                               return client;
> +               }
>
> -       client = i2c_new_client_device(adap, &info);
> -       if (IS_ERR(client))
> -               pr_err("failure registering %pOF\n", node);
> +               if (first_reg) {
> +                       first_client = client;
> +                       first_reg = false;
> +               }
> +       }
>
> -       return client;
> +       return first_client;
>  }
>
>  void of_i2c_register_devices(struct i2c_adapter *adap)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
