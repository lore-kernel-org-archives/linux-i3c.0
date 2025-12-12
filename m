Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FB8D59F58
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 23:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHhRXiTW92EtP1JyeQUw8hcA3WOT2gEkqlpCdauzNOg=; b=2qOB58UWXxalzI
	FIwCYEz0DHpbIxelMQeM0ZprMlt1R3wQ0xxQxamySpfKCZHkXkwercP/j6pWWganVNLAvEqkVcL2y
	37oScAGnSSMhe/DSgtIRFdpNJ9g2HRMDAgNpT0u8XVj3euBIsvYaGu4R0DS6bl8F3+bghescC7o2u
	ggqc3/9L7cro1t6k30eDc6aeE9Xpvvj/YgemPwwpOBa21W1eXYFmAWN8vveff2CfhQuUbDgIAs53T
	YuMZmEQ/dOfbkJ9MH3rk7kQXrAtutFiKuIvoOCR9hvyvwvSd3pbPzfRzenuZpNriIApleMa3dAmJT
	rSPwOyYHWQOtLwicOAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCEL-00000001CbL-2q1J;
	Fri, 12 Dec 2025 23:07:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCEG-00000001Cah-3O5D
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 23:07:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 64DEF4E41BBE;
	Fri, 12 Dec 2025 23:07:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A1B7606DF;
	Fri, 12 Dec 2025 23:07:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFE98103C8D89;
	Sat, 13 Dec 2025 00:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765580833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bDaKGEZ61DFeAm9Oy1D6NKbVJaadd6WZ6QJ+ePPrDDU=;
	b=uCVRl62AiA2Qu5JGY41QyIdn78FVvzT2EFzV1+We54jbRKoE8hXrnmNZY835xFO+4prQ0P
	YVT2LtXxGcGMlmQjuTgM6JwqcwdrAMH0RIQCcrrywH/drfnQgb6A4bqwFhrYyLcOb38fk6
	Gu0Fg1l14P1f0e1nrdGwFvxXA627KtljC9MuRaAQgYqXiq3u6cRx8zRGvv51kbWb4Pk3w7
	kTM3no4smjZBDpliygVB7WAihrnPRoT224QM5v36vE5VBPS8xmQ63S8vW6utPvw4ZFsiF+
	iCM1AoWtky8NpUQK47FDDr2Ujccyw0eup99nmW/t7o8vMX3GEeDrvSmrAKuHjA==
Date: Sat, 13 Dec 2025 00:07:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] i3c: master: switch to use new callback
 .i3c_xfers() from .priv_xfers()
Message-ID: <176558079620.1405691.18176288166178254349.b4-ty@bootlin.com>
References: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_150716_973965_6D4F1379 
X-CRM114-Status: UNSURE (   6.86  )
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

On Wed, 03 Dec 2025 15:45:49 -0500, Frank Li wrote:
> switch all controller driver use new callback .i3c_xfers() from
> .priv_xfers() and remove .priv_xfers() in framework.
> 
> This serise is base on
> https://lore.kernel.org/linux-i3c/20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com/T/#t
> 
> 
> [...]

Applied, thanks!

[1/2] i3c: master: switch to use new callback .i3c_xfers() from .priv_xfers()
      https://git.kernel.org/abelloni/c/eaa0870387f9
[2/2] i3c: master: cleanup callback .priv_xfers()
      https://git.kernel.org/abelloni/c/41b80d43d9a0

I4ve tweked the doc change in this one.

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
