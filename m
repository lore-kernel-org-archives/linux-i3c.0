Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3120CCE9D6F
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Jan 2026 15:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUP5NSG1gRMrDEKezFB4F+n0KipY3j8EDx7EgL5dhEQ=; b=g2pMhIbS65RzIU
	ODRn5bhIDdx5XCBK3YePyaOSjrcvPyPx5cErEWQD/isyC2Eyon53M8c+r0qJJ10iDwb+OGFUu2Yjk
	+sByuFbtIO4f5k8sI1sniGmO6m1qERxN1cMtnHR/g+tH2p6Ki8F+RDeQmOdjLOY0RzkIgcARcoFeD
	smAjGaL9/kGuNRsa6CsTLhCxqPAGddGAfPKcn3W0y+xeDcCd/OuC2Z8d2/vTjCVYhrzC5ZU2YBJHq
	ifCKUemh51fgLxKv0WnzDSz4EaRDCG22d9Js4LsvmJ1WOXd7OE7hlI6Uwq+37QYvc7yAuvNoqr7Pt
	JqkipNo+6nDYM3EMzbZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9OG-0000000DRX8-3xBv;
	Tue, 06 Jan 2026 15:54:36 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9OD-0000000DRWI-2hr3
	for linux-i3c@lists.infradead.org;
	Tue, 06 Jan 2026 15:54:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 09C001A26A2;
	Tue,  6 Jan 2026 15:54:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBB7360739;
	Tue,  6 Jan 2026 15:54:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D58C103C8393;
	Tue,  6 Jan 2026 16:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767714867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=JKmJjeA+TbghONDMBCgVukZFNKdcsUhTzD7QTEwX/zE=;
	b=qd8o6nXAYZ+5kWfVoatRsGedKaWYu4nvHV/5dYZioOpnY28/2wmYNT0VrqmUxstiTgeO7v
	39idbBH1mZE6j2QtHx59ZVhsFv9zn9iKMUgeMw8eZ7gc5GHlwZ4pI4TjhriCduwdkiKhwG
	SmYb3nOi/HXireBeuEgzcofm+kLVh9NSY0QnyYqomRQwqPUvBB01qVQCyEVfA0gwLEpz+7
	rI4/Y1Wc4LVjYVesmLABzJBtoB5r2Rzv+SaYxYTO1dN7UFg7aCc5Fd/EXsA0oARH5FJLj6
	qRd3ahYUyKbN5jeb1+NUQyEpb56VHIeE+YJwwcLXVHGW7mzADSfwxa9JpoHFxA==
Date: Tue, 6 Jan 2026 16:54:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Frank Li <Frank.li@nxp.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Message-ID: <20260106155423992035a6@mail.local>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
 <TY3PR01MB113466E129D0970F0E2541F7B8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aV0g5j01beuz5CO+@lizhi-Precision-Tower-5810>
 <TY3PR01MB113466AB09CC77C375492A0E28687A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aV0neUGcqiGkE/Sv@lizhi-Precision-Tower-5810>
 <TYCPR01MB11332395B91D672D6BD46CECD8687A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11332395B91D672D6BD46CECD8687A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_075434_187492_F012F28D 
X-CRM114-Status: GOOD (  12.34  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 06/01/2026 15:41:10+0000, Biju Das wrote:
> > This is just more flexiable for clk schema. If your schema is simple enough check num_clks >
> > RENESAS_I3C_TCLK_IDX should be enough.
> 
> For avoiding crash that check is sufficient, but as you said wrong dtb like crash
> can also lead to non-functional i3c device
> 
> Eg:
> 
> From bindings, we expect the below entries in DTS for RZ/G3S
> 
> "pclk", "tclk" for RZ/G3S
> 
> But user mistakenly just added "pclk", that will lead to kernel crash
> 
> Or
> 
> Swap the clocks
> 
> "tclk", "pclk" this will lead to non-functional i3c device
> 
> On both cases, user ignored DT binding check warnings.
> 
> As you said crash is fatal, maybe stick with just num_clks > RENESAS_I3C_TCLK_IDX

Yes, this is enough


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
