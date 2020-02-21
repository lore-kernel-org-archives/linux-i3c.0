Return-Path: <SRS0=HGQP=4J=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB77C35640
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 09:36:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4389F207FD
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 09:36:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N5CECUVS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4389F207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOCYeLP8D/W8ynmM2VfygesmOzDe7ZamkcIOYKv8EIE=; b=N5CECUVSti8Ve6
	BEC/kPU8tJ4FTADKFBAQxFeqPMnF4GnoXn3zApJ+sNvWygfuaN5sZ7su3AxhcthcNe+/8dmoHoG+i
	ZT7WLX0T5zrZBZecT0K1pE96hII/tRRVjO360Sd85NJBsFTkVkj6WJu+ffDS8NPK83PuRAHQbyrkm
	ifOJbpZvFwM3yneZDd2FqP8rxq7iG9XQkHD79HGk6UT5rqYxBQx9l0YHTskXsvvZ75BOtSjrmQin/
	nZ1q5CdnglrWDyucd5XWYCPTAg2qCYeL030GREC8/3nYvGdYBFd7Umb+qZFlzg4yLABhGr+FbeqoX
	RSYQqq4fHLQkDLztcjrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j54jl-0005De-VR; Fri, 21 Feb 2020 09:36:45 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j54jj-0005Ch-3t
 for linux-i3c@lists.infradead.org; Fri, 21 Feb 2020 09:36:44 +0000
Received: by mail-oi1-f194.google.com with SMTP id b18so995268oie.2
 for <linux-i3c@lists.infradead.org>; Fri, 21 Feb 2020 01:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l+VSzBk136F0WnmD8vd1UXyUqbIVYbRCZbVzHfV0nCo=;
 b=uePI708YC3UmUdipaTD5NTRrOsqPwKGLi4xbkbHsn/ahy5IS/C4klEJpZZzDCXlQKG
 eGjLh3pfUzGJ+tTUuzRYQv+TsmrM0cfTh2bGRcugplPjU5xMB+f42gB4lLoNuNEwOKrP
 tgTopvhdkQLmmxh4qv3H1m08Wi3EdB54OVfg5wM3K2IoqrMi2PQg9Dr2Rf6os7qOv8I9
 /Kx3ZcSsQMsvKpH6OfXcRKv6UN/jCd/7WoknWmqTSHyDaJtWrqSHQ9TgTFVxiAgbGp2G
 L03F8Di7mTRhzAlUK1HLoQ7Z/YUrfOlUPN7JZTJPCZoAZ7xdkLARjCbGK54f1qLcOG7Z
 8AqQ==
X-Gm-Message-State: APjAAAW/BsBzWzX/ejKJmLbZnbYBWvOgIv1cEEh93IQe/qocg6Koq598
 45Z1GDNpO0ojOYwIrCGfVSsqtC7eicBbP+3Vt2E=
X-Google-Smtp-Source: APXvYqwTLkzdJ7Ea1pHuDDK58bfsunGZ+J2COTT5It/qUAHl0F0jdTOlEjeYhsTaMKlgabM9EKUDnBJ18UmF8kn5mDw=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr1273580oia.102.1582277801696; 
 Fri, 21 Feb 2020 01:36:41 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2020 10:36:30 +0100
Message-ID: <CAMuHMdU3WgdV0cqf0Gu=szyNch=QOEK8UbiQyxLjsf+WnS=-ZA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] i2c: add sanity check for parameter of
 i2c_verify_client()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_013643_160806_D2D2191F 
X-CRM114-Status: UNSURE (   8.41  )
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

Hi Wolfram,

On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We export this function, so we should check the paramter to make it

parameter

> NULL-compatible.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

And then the check in i2c_acpi_find_client_by_adev() can be removed.
BTW, can the i2c_verify_client() check in that function actually fail?
If yes, it should call put_device(dev) on failure, like
of_find_i2c_device_by_node() does.

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
