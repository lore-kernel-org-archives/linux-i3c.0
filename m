Return-Path: <SRS0=HGQP=4J=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF80C35641
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 09:50:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12BD0222C4
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 09:50:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NlcsWip4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12BD0222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdzomzBVPqKRspRpweH1ggAYDZdhBE8cpMJ3z5pJKVo=; b=NlcsWip4UCVl0B
	fPr/6cl+4rfw9xTWKwxB6dEsrJg5Z83BoJqObL/TbEMtdoedTyflthZF3Sdi13m4Td43563nHaQ4o
	8pR9zOoASk/8ThLY3qwbapkNZf3qXggFonWcjdC02qh6cdTEh/RpDMv12E3ZnAvUEOLWvm9211L/G
	VkcIBPPof0TxdLYS+s0Rz5bblDDspUoLY2szJIkEZ9WYNbSQtpZ3h6mGCyJcLDywWJZJwiDJjLQXh
	v9hSho7HddasbeKGpzpTs1Ttb8SM+G87s+4atUfN4gaf+mopWli65FrKVHVA1X7BXlCaHhEIRQbR2
	GCQEHsb0UD1bs05Oe/CA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j54wq-0001t6-Ng; Fri, 21 Feb 2020 09:50:16 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j54wo-0001sm-AT
 for linux-i3c@lists.infradead.org; Fri, 21 Feb 2020 09:50:15 +0000
Received: by mail-ot1-f66.google.com with SMTP id r16so1493295otd.2
 for <linux-i3c@lists.infradead.org>; Fri, 21 Feb 2020 01:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LGtPhAVjIvRquefayqs6YiIA/tNdWVoN+WLDPh1u7gE=;
 b=G6/r8fCBDUrVIy7f9mYTwRjmGGmMsK8ncsD3WjNuE06Jf78+a8zali5VYtHYc9vxWO
 mKqWTY1f9XhUrvUDzWfiW2s4vB5E2DberrvAWJAQeSA6a2RsNUwQbLIFNv/7oqoHjYQM
 LeXByOdrMrgj2WTj+2sHGahbZ5vLQAQy+Cno0xG5bC9i8Hd+lp2+MeiXam/afsM0r6P2
 +AP7LDEGAMua0TByGMCRbMaqxvRey0uRUcG/RECW2zQrRSoiOcWAfsLdykPjXa0hMieP
 ZBBs7FT0dSV93XJwabJo+gWg8UKOS0hTocn6lPHVpXbz992eB0sYRyTH2HnZAT4mtVbV
 3zeQ==
X-Gm-Message-State: APjAAAW2sPFhuhLwVUP+0yLbQ1+CIvU/MUObHUv+WbwN+Sd5ritGqgjg
 YnMqgld5vpG1Z8f1OBe3J2z3MdEnfa0Y+9ci32I=
X-Google-Smtp-Source: APXvYqwm+9QUakxr4sAH21zwcX7ad8NwXiWnkq/zDR06hcy6RD3aCDm8gQ7zDkbZbqGMQTUgWgb5ROsz2Bqdvv3L3xg=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr12558550otk.145.1582278613276; 
 Fri, 21 Feb 2020 01:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2020 10:50:02 +0100
Message-ID: <CAMuHMdW-foZ+o1RbvEH8xX_zPa0sJ_kqRX+u4=bFRFNCHbLdwg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] i2c: of: remove superfluous parameter from
 exported function
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_015014_360877_C7A970F8 
X-CRM114-Status: UNSURE (   8.34  )
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

On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> 'dev' is only used for printing an error message. However, that
> information is not needed because '%pOF' fully describes the location of
> the error. Drop the 'dev' and remove the superfluous parameter.
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
