Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F605D37E3B
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TH8NFeySLTAp22sZsd4y1VNda7kggPhMHaMzxtEWU1A=; b=HetnCPPk8i4r7G
	WvrFb4lwZB7oQbQODd9djzKKZuE0l+sFcfH3SwblAmWOjA2Az2bqMslStOI4RUdw9fnQ2oDpUEW8r
	zxoS5GH3ucdJXzzZvkFwXCt2hQ3zGhZoqW7XoK9yCVZ1anrkbjc0RO4C7BoErLoChkYc4Db3dMwXc
	hL6rgyZSUPS/FreGe1oeIFASMJ9H0JSk96rSWHSzaaRr/1SZMDrj1C+rbrrcw7OineUGXfOlu5lE+
	0tHUG9ZUk65Rh3kRgpxoldOOSlecxWlFG1/0wH/uVI2srq0h0x1oqOd5pp5RwR6AuGZLjLo4Vi5eC
	w2EyRqOJJ+jQbhNYCWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2Oj-00000009c2D-466j;
	Wed, 14 Jan 2026 15:03:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2Oh-00000009c1b-0KqL
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 15:03:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 936434E420D7;
	Wed, 14 Jan 2026 15:02:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68BB76074A;
	Wed, 14 Jan 2026 15:02:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B60C710B68265;
	Wed, 14 Jan 2026 16:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768402976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QO5VB5UcoX6yJGvOy61nbzpj4avb0kRK9ECr1RMHGB0=;
	b=LtjnaUw2ZeD7BIR2wERCFl/9IeGVCeexdSu3q+ie4yCeAU/mKCOfzsfUiXkiFAOrezX5m7
	EPZZ08Te3boZUTT0v0Ndp+zEUvQxKCgOBhmr9x6TyDmbHws5Ic7X5eDTj1SsTqs+a+2kyN
	clIPAh2f49RMBOP0WaA3IbNhyGqFVNDgklUluf9aZyvfS/KNCAOPSARd2hlsz7A+7k5cDr
	oS9VvmGU4hZMy+IYDhwaf4V5XdBiALjoWwx8DckOAG5r1997muUBPR6NsMzFQZ1G8i7H7I
	GrHwCRuGjiA5v7BLs9ifmN7d9Jden02+6uYPqiBcYM9kMlF5YoPpfqypofXq1g==
Date: Wed, 14 Jan 2026 16:02:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: tomm.merciai@gmail.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] i3c: renesas: Add suspend/resume support
Message-ID: <176840281755.1259180.1971003582485935072.b4-ty@bootlin.com>
References: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_070259_250249_91DFC2F1 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

On Wed, 07 Jan 2026 11:33:46 +0100, Tommaso Merciai wrote:
> This series adds suspend/resume support to the Renesas I3C controller driver.
> 
> Thanks & Regards,
> Tommaso
> 
> v4->v5:
>  - Rebased on top of next-20260107
>  - PATCH 1/4:
>      - Improved check for clk_bulk_get_all_enabled() failure into
>        renesas_i3c_probe().
>  - PATCH 2/4:
>      - Moved presetn and tresetn reset controls renesas_i3c struct
>        entries above num_clks to avoid padding.
>  - PATCH 4/4:
>      - Collected tag.
> 
> [...]

Applied, thanks!

[1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
      https://git.kernel.org/i3c/c/579c7255922a
[2/4] i3c: renesas: Store clock rate and reset controls in struct renesas_i3c
      https://git.kernel.org/i3c/c/ff4e4f03f008
[3/4] i3c: renesas: Factor out hardware initialization to separate function
      https://git.kernel.org/i3c/c/5eb3e8763e07
[4/4] i3c: renesas: Add suspend/resume support
      https://git.kernel.org/i3c/c/e7218986319b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
