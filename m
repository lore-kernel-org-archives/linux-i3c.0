Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D410CCFA18
	for <linux-i3c@archiver.kernel.org>; Sat,  8 Nov 2025 21:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaoxAJHg4hu9iR9syn/ov0HgMWxvKTRVREzuD4QvLcQ=; b=af4FoQTC/51eXY
	CxEue32kIOr5hYsHW95R+qqJfrOIsABw9x1Yw3W5h/X4AmmbF/kMcmtuP6CzTT4Pja4WMponCx1eo
	7i2+fJEvpJSbCLQPvH2tbiZQLz+ER1KLs01e/8yS0fiuP38Ksu7c5XtP6H0wyWhy1MJpT0yax5IGD
	DmLxs7zUuG757Y89/Q0WnAz13GYJXbbtXBc5hDnrzoHuN8AyvB9G2f+lxurHgkCCNlnTBtv0vexnh
	kpAI0s0ACjb80QaIkkjTL93EOxYUsank7QfmeGOMlwE70iZNc6MWCnfhNaCAVkpf4TUKrUrp/jMwo
	neNRjYlXVC7JxAnyNgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHquy-00000003VEC-2q9B;
	Sat, 08 Nov 2025 21:56:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHquv-00000003VDl-2E6t
	for linux-i3c@lists.infradead.org;
	Sat, 08 Nov 2025 21:56:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A0B114E415D5;
	Sat,  8 Nov 2025 21:56:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 58B1D60710;
	Sat,  8 Nov 2025 21:56:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D0F511853068;
	Sat,  8 Nov 2025 22:56:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762638971;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=5AxV9zAfwzxXLQuYV4SQntDLgupugMLE1UNs9cxOI+o=;
	b=OU4HVJNbfjro2tym801hMPJgd3rXAsv44NyResegH3DkZjcHSK4a0XrNbZ1tqE13y082a+
	fzvlIKQ+JXOcdoyANXlS6ktYJ339sN/dNhrmYfjcspWutuA8ss30zaKxMWZjuSgNYpd8BL
	8H1Z8VL59cCA7tR2iq2FsXY72rQ1kj3LSW47ugy/fJk977f9RI8oswMg9Q8ZDMb75YE8+o
	F8ruPori6PCtW35rWhvyrrkODFYCgpS6Datmo1uxCUGfRmhLLKimuCmSUHDD5prye0mW6e
	hsrvrPPY8LxXXgbo2EmcWmvkJSwHluxZrYHXTCOCMirh7e9Pph2+iKh3OWVAdg==
Date: Sat, 8 Nov 2025 22:56:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank.Li@nxp.com, wsa+renesas@sang-engineering.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, adrianhoyin.ng@altera.com
Subject: Re: (subset) [PATCH v5 0/3] i3c: dw: Add Altera Agilex5 runtime PM
 disable quirk
Message-ID: <176263895276.673133.964686520497034769.b4-ty@bootlin.com>
References: <cover.1762237922.git.adrianhoyin.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1762237922.git.adrianhoyin.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_135617_700318_83D917C8 
X-CRM114-Status: UNSURE (   7.49  )
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

On Tue, 04 Nov 2025 15:29:05 +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> This patchset adds support for an Altera SoCFPGA-specific quirk
> in the Synopsys DesignWare I3C master driver.
> 
> While running the I3C compliance test suite on the Altera Agilex5 SoCFPGA,
> the I3C bus was observed to hang when a slave device issued an IBI after
> the Dynamic Address Assignment (DAA) process completed.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: i3c: snps: Add Altera SoCFPGA compatible
      https://git.kernel.org/abelloni/c/8d1d2c408cc0
[3/3] i3c: dw: Disable runtime PM on Agilex5 to avoid bus hang on IBI
      https://git.kernel.org/abelloni/c/fba0e56ee752

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
