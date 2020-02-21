Return-Path: <SRS0=HGQP=4J=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA4DC35642
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 09:38:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80DE820801
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 09:38:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PcUDnECg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80DE820801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQrnrXgq9adfUKSJVrwyLF2+8ckVEcP246sglLEOLPo=; b=PcUDnECgD+J8Ql
	9MQzeFr527S2Asaa6zT8zgYtQpEo5iX6su9rkFdkWUhB/KwZkuNuNMDL4hOAh1JLr0C0oeiAznP3o
	Qe2D2luEzh3if4FqBcGizYT8IwJrY/WhmfxvT/vdRi74L1HR4UvHZrDT8cFoOcjOw+d/Ku0Zk4nEv
	QUEezqO6EhSzmquoPs1h+R3h2sUVvbX8mKZmsIL53qDonwdTLeFtwzBdtaXZssbFrlPcgjKJtjCRV
	LNPHVzWOGAPJCmXtEL0FJUQlu2sgN/n2Z2M/gl3lZKtDdriYxf3iO+U07pyIhYV26vLpVMyLPQhoM
	49tmgGe6dbHZq0m5+SOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j54lh-0005K6-7Z; Fri, 21 Feb 2020 09:38:45 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j54lf-0005Jn-7U
 for linux-i3c@lists.infradead.org; Fri, 21 Feb 2020 09:38:44 +0000
Received: by mail-oi1-f196.google.com with SMTP id b18so1000015oie.2
 for <linux-i3c@lists.infradead.org>; Fri, 21 Feb 2020 01:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uD4laB3s8bi0BFiMPx+I3Obi95+70uww5AFzLEhj4u4=;
 b=gcJykE5nTMocWTC/J03x1LMIJA4nUedeUXXJC8tnKoVQWpVn0z2OB2zBRkGPasZnTV
 fXntrzFIjZ4jn2nDleVtSxroy6no9n/91NNIXhx/zx2pbOnTW15O02DG/xeua1dULqjN
 E0/WbwuclKqTpzTe08Xn4b8HClYgwMRy5ocN4NLh23iUItYNv1bXF1wi7bRLLJ7ctyKK
 2Fb4PTNk+2pNQZRShYfDKmUnPvNAaRXQ6H7A8Y/SDbNycHdk0Wb6E3IGqnqDAzzlDvGM
 EawYLSyKUU9lMDDf3VoqtNKMvO3rI9PK1PDn5hhW8PtLKBt10VqhmueZwyagoThOGsFI
 yU5A==
X-Gm-Message-State: APjAAAXwQRnsN9P+bj8ZKZyKu31tdoTiWRi3aGm+iuDwqr8t+M16tDba
 ixijrt05A6ioTYHmAusZmYKRFyFizFHG4RAUwGT8zQ==
X-Google-Smtp-Source: APXvYqy4vUm+VI9GjjFc09JRIyZV/BmC+3fmvmW3aFzesDOM/pFSOuqf1mSriMqU+kB52tcCLY0NhaK/KfKQ7khW+Qo=
X-Received: by 2002:aca:52d0:: with SMTP id g199mr1152890oib.153.1582277922433; 
 Fri, 21 Feb 2020 01:38:42 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2020 10:38:31 +0100
Message-ID: <CAMuHMdX=w0=qBe=qZxsdoat7VLpi53hdi_CPLybR3sVHq+9jkA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] i2c: use DEFINE for the dummy driver name
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_013843_270354_4432B422 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 20, 2020 at 6:27 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We use it in multiple places, so make sure it is consistent whenever we
> need to change it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
