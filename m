Return-Path: <SRS0=HGQP=4J=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AD5C35642
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 09:48:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC82824650
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 09:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LwyMchS2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC82824650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hKM+TCytWfpIQbuJVvifmOBVITu8IlTk2f7D9EHLiW4=; b=LwyMchS2NbQ59C
	pBipno5m5w6abZ9eWuC6dSQ0jXRXbWl+x2DAtVQ/wRFL2zp0Cj8pWNI/WyIeo0LR3LAgcMJgjmoeH
	NZ3ocIZMpKYhsLJ4ys0+jmzopJBlTEQFS0IfHZJac+5bvTxDG+Ux4VR9+Ua5S72sB0MhPueh1VOcO
	S2xAEj9dI3SkLGnNfqnE8OI48jWaq2yNmCVwt3/trjlu03feCHu6ymg3Lp9fBp8G5Z7SwiY/6rvKw
	m8dNYt0910wchImZkpe6QYOGnob7Q4rLUyactjCE4U/HgOwZyEdy++slhqk29ByYcgrveGGrOux19
	UBud7y/J0/uot4p7RvhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j54vL-0000YW-Ds; Fri, 21 Feb 2020 09:48:43 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j54vJ-0000Xj-I7
 for linux-i3c@lists.infradead.org; Fri, 21 Feb 2020 09:48:42 +0000
Received: by mail-ot1-f67.google.com with SMTP id j20so1494190otq.3
 for <linux-i3c@lists.infradead.org>; Fri, 21 Feb 2020 01:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uIi0c0G5Zb0Jw5ypN9sLASPQpOpXkoB2JbMIvsoRlKU=;
 b=PjzF4r+Iqzdgmge0nku7GUd6dmVBFBtaGVXhoX5O8CFwY++ht8x/PVL/rBpQ5MJII4
 vTXupYHl9m+G+Bv25AqoUmjg71sHcBYiepRVfbmwQbnxBlOcvju2UUoef25fYD/UOfGC
 WHKZvLflb3+6fqaWEMAkF7lHnlz+IvsSL/0H2NSV0wLF6RafCJ2DSFopmh6TNhL1YJT2
 czmaDZ4nFRslkpwEKsdetzeMAqCp74AP5WpU9OtULxkfOcdReSTLm2VSrkSL6BWwngl2
 bD/y9eEkH4Qfa8Q7S+/zl/mAaBue2FSuUt+yGXXc9DycLF4bLwIj0FDdazN4H+BJwt2M
 r04A==
X-Gm-Message-State: APjAAAW2qHa6/M3XuaEdSRbiVPUuh+UYqDHz3DgJq+5wwffnLckz5omZ
 XDFjiMWQji8FSyaWDgxOwu6eFDKEfai/3j/IqE0=
X-Google-Smtp-Source: APXvYqzCfDGAqcLdudcohpMobUQi25VoP3sGfFSGSDz0m/c8bEwK2Ubq4fI8d2E03xtKyfavurE7PLjwAUBVVtlYtvQ=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr27799290otm.297.1582278518775; 
 Fri, 21 Feb 2020 01:48:38 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
In-Reply-To: <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2020 10:48:27 +0100
Message-ID: <CAMuHMdXGvRRJUU7fOszPuKcvHA2ttpLTvQ5=9h3vVWPYFUbjaQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_014841_598429_4DB5EB4E 
X-CRM114-Status: GOOD (  14.41  )
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

On Fri, Feb 21, 2020 at 10:45 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Sometimes, we have unknown devices in a system and still want to block
> > their address. For that, we allow DT nodes with only a 'reg' property.
> > These devices will be bound to the "dummy" driver but with the name
> > "reserved". That way, we can distinguish them and even hand them over to
> > the "dummy" driver later when they are really requested using
> > i2c_new_ancillary_device().
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

FTR, depending on the extra dummy removed.

> but one question below.
>
> > --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> > @@ -50,7 +50,6 @@ Examples:
> >                 reg-io-width = <1>;     /* 8 bit read/write */
> >
> >                 dummy@60 {
> > -                       compatible = "dummy";
> >                         reg = <0x60>;
> >                 };
> >         };
>
> There's a second instance to remove 18 lines below.

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
