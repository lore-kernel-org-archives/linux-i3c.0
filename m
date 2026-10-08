Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16D5CA600B
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Oct 2026 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=caXpJr9PHI1awMNutNbmIqRQgi85mfsseDfIGbbZqxk=; b=2sQ6tDn0oxoILO
	AMee26uPE7By7egGv+JWCNWvl6Q4fIX+bDJmheRIPpcXNyncSczLQYyTg4eL35uSemoace7HHNQ5U
	SM5OqNnnpa3P3xnOZMj9RYDkW1hAMK6lI5xzcEVYHA7jnTRPxupuftvcGiXVPuYwFM+vLHsaXfwyX
	4SrTCvW3VIaifPzeJMhupHGJxXCCEvIi6j3zMGwBCxMh04E0L6l4be5EZOZhAcztfxaY4BpwHpRAS
	g7XUaY9bDvAqFoglX5Vqv2Bs9iu3BHoYht5lumksUXsNyqj3qOqottgvtpfYMCB9V+NGb8erP6hmM
	xYq+xfNuF69henuiLaJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEn9K-00000004L8f-2FcR;
	Thu, 08 Oct 2026 12:23:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEn9H-00000004L8L-31XX
	for linux-i3c@lists.infradead.org;
	Thu, 08 Oct 2026 12:23:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E0931A1195;
	Thu,  8 Oct 2026 12:22:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22E5A60341;
	Thu,  8 Oct 2026 12:22:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAC761033026E;
	Thu,  8 Oct 2026 14:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791462169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=NRZ2ntUT7ufLsv9s/suJ3Gy+KO8Zklh0QCrhpXXOx9s=;
	b=Bpd5JMhBu8cirohm7Q71zRI1kjM4bE6fdknRM7s34w4IV5Q/iBAZG5VgrLFKbRH2lbJlxZ
	QkhSdj3fiYNoqtc9DPBYloGrEPXbULZJ8eOicY3fiwTgqk/6Guo877sNu8pKhlGXRUXe4+
	uABsq8ut1E5fI/PumW9kOuCA5hYC485eUCsJynSgW8t0H/XRs3aUsnHurdQ4V5+ttpao7H
	Q6khByvkVg/fPxomNaVaemG6sBEq+YRORCfgiTvgxIg0BtO6dZwdqE1tPCnfmQ/ChE/q6Y
	E8WF9Jy1uY8rzuB44e7dyhO0jQ9O1tywEEouACLnV8p60/YnIaQ36b1yNcwAjA==
Date: Thu, 8 Oct 2026 14:22:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i3c: dw: Support Synaptics sl2610 i3c
Message-ID: <179146214847.369159.6401160228330992905.b4-ty@b4>
References: <20261005152425.25319-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261005152425.25319-1-jszhang@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_052259_921005_08E3C64C 
X-CRM114-Status: UNSURE (   8.46  )
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

On Mon, 05 Oct 2026 23:24:22 +0800, Jisheng Zhang wrote:
> This is subset of the "arm64: add Synaptics SL261X SoCs and RDK boards"
> series.
> 
> Support the Synaptics SL2610 SoC I3C controller, which is compatible
> with the Synopsys DesignWare I3C.
> 
> Since v1:
>  - collect Reviewed-by tag
>  - use sl2610 instead of sl261x
>  - restrict altera i3c reset to 1
>  - send as a separate series for i3c subsystem
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: i3c: dw: support up to two reset lines
      https://git.kernel.org/i3c/c/6931331f48dc
[2/3] i3c: dw: switch to array-based exclusive reset control
      https://git.kernel.org/i3c/c/224e3606711d
[3/3] dt-bindings: i3c: Add Synaptics sl2610 i3c
      https://git.kernel.org/i3c/c/fc5eb1b0631a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
