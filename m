Return-Path: <SRS0=HGQP=4J=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B6EC35642
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 10:14:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFD4524650
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 10:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TIbFIxET"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFD4524650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5T6CThKESTCFh1HX0lk+6NxNB/Du90kxBmMK7N9rZs=; b=TIbFIxETuKfi6m
	BZGElDEWGWf15p30ES6ZOtB0OkJuP/GYYS2NEujnUcnQWkzwQ8+BvYDPvAZK0vHRV1j3BfkhycqSB
	KFg7dabIxqt9D3HezFQW/n/MDKJY6acBMRtHT/H3kwU2C1JWdVsswoGtwRCNjXQpo2uW8MoX46LY6
	kh6bb+bRh0DFVzYkInF9kv7Jvv6cRkeTZ3sOkMTOuIVqu8fFP4qbh5tSFMH2pn+TK8BoTLPew8Hvk
	xAOtS81dDC6QKxRuJFpngYiuJGLVg9v78bN5YGpM7hrQGIbKn+f9K2N/FxPjba006dmnO7nkZWT7k
	aC3OX9fb/Z6U032Xtghw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j55Jq-0003Rb-Ga; Fri, 21 Feb 2020 10:14:02 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j55Jo-0003RE-Ad
 for linux-i3c@lists.infradead.org; Fri, 21 Feb 2020 10:14:01 +0000
Received: by mail-oi1-f194.google.com with SMTP id a22so1046537oid.13
 for <linux-i3c@lists.infradead.org>; Fri, 21 Feb 2020 02:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IZocKraqIUJZ35HEbFK9lQ7GF0tGKhiv0gssLBu8UR0=;
 b=OeNUR55yMLybTDUfscHiSlljIK0MsWXW99cz0X4ZQlZEtF0+5c6n0J3uNXBRO5rrFO
 cB9L7BI3v/olndQxrAoPHx2kBxoa+VlwO0RuK4Q5c6WCUS2VX4xYcXY2vClfB2Gb1sZw
 VPTstnkKrJ4IKwUqjhy/6nb36vfDTaDpXP5EI9/YsyDT92p5dqzu6Yxlo9gKYhuqMti8
 5g4qMvrcoOLANdo1XZXhepAWbqFdKjdHE2E+rWgXJJHVm+JxsE+uvLoMkmsgvZN8ecfm
 pC+10IpN2f+x5iGA0q2G8bWycbrSw8GZv6tZPDaBXMOF4WuP7+qLA70ZHReU0cXKxnzf
 UZ6w==
X-Gm-Message-State: APjAAAUm256Vq3Afl47yV/a7V0O/UDR+Ew2n/CQ4n7SKQnUplwsfWtYX
 vapWD5VpRRmNUDSRaGTtOKCvfR5pfNHFxfIb7oQ=
X-Google-Smtp-Source: APXvYqy8ctrMdeADSQHxwR9cRnUsbwVavhFTJOapRHb2udJuBdEfDAXWSOiRn1HggkpBEl/pTw91mKIAc1cco0Xe+B8=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr1284059oia.148.1582280039481; 
 Fri, 21 Feb 2020 02:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2020 11:13:48 +0100
Message-ID: <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] i2c: core: hand over reserved devices when
 requesting ancillary addresses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_021400_366981_0CD786F0 
X-CRM114-Status: GOOD (  13.76  )
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
> With i2c_new_ancillary_address, we can check if the intended driver is
> requesting a reserved address. Update the function to do these checks.
> If the check passes, the "reserved" device will become a regular "dummy"
> device.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -975,6 +975,8 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>                                                 u16 default_addr)
>  {
>         struct device_node *np = client->dev.of_node;
> +       struct device *reserved_dev, *adapter_dev = &client->adapter->dev;
> +       struct i2c_client *reserved_client;
>         u32 addr = default_addr;
>         int i;
>
> @@ -984,7 +986,21 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>                         of_property_read_u32_index(np, "reg", i, &addr);
>         }
>
> -       dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
> +       dev_info(adapter_dev, "Address for %s : 0x%x\n", name, addr);
> +
> +       /* No need to scan muxes, siblings must sit on the same adapter */
> +       reserved_dev = device_find_child(adapter_dev, &addr, __i2c_check_addr_busy);
> +       reserved_client = i2c_verify_client(reserved_dev);
> +
> +       if (reserved_client) {
> +               if (reserved_client->dev.of_node != np ||
> +                   strcmp(reserved_client->name, I2C_RESERVED_DRV_NAME) != 0)
> +                       return ERR_PTR(-EBUSY);

Missing put_device(reserved_dev).

> +
> +               strlcpy(reserved_client->name, I2C_DUMMY_DRV_NAME, sizeof(client->name));
> +               return reserved_client;
> +       }

else put_device(reserved_dev)

(perhaps i2c_verify_client() checking dev was not such a great idea, as
 callers need to act on dev && !verified anyway?)

> +
>         return i2c_new_dummy_device(client->adapter, addr);
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);

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
